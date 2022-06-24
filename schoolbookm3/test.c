#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <stdbool.h>
#include "hal.h"
#include "randombytes.h"
#include "gmpwrap.h"
#include "schoolbook_mulmod.h"

#define NTESTS 100

static void send_number_(char *s, uint64_t num, char *u){
  char fmt[100] = {0}, str[100];
  strcpy(fmt, s);   // the 90s want their APIs back yo
  int n = strlen(fmt);
  fmt[n++] = ':';
  while (n < 24)
      fmt[n++] = ' ';
  strcat(fmt, "%20llu");
  sprintf(str, fmt, (unsigned long long) num);
  if (u) { strcat(str, " "); strcat(str, u); }
  hal_send_str(str);
}

#define send_number(S,N) do { send_number_((S),(N),NULL); } while (0)
#define send_cycles(S,N) do { send_number_((S),(N),"cycles"); } while (0)


// copied from mbedtls
static uint32_t invp(uint32_t *p)
{
    uint32_t x, m0 = p[0];
    unsigned int i;

    x  = m0;
    x += ( ( m0 + 2 ) & 4 ) << 1;

    for( i = 32; i >= 8; i /= 2 )
        x *= ( 2 - ( m0 * x ) );

    return ~x + 1;
}

extern void multi_limb_mont_16_asm(uint32_t *r, uint16_t *a, uint16_t *b, uint16_t *p, uint16_t minv);

static int geq(uint32_t a[N], uint32_t b[N]){
    // no need to be constant-time as it's only used in rejection sampling
    for(int i=N-1; i >= 0; i--){
        if(a[i] < b[i]) {
            return 0;
        }
        if(a[i] > b[i]){
            return 1;
        }
    }
    // all limbs equal
    return 1;
}

static void sample_modp(uint32_t a[N], uint32_t p[N]){
    // find a < p
    do {
        randombytes((uint8_t *)a, N*sizeof(uint32_t));
        a[N-1] &= 0x7FFFFFFF;
    }
    while(geq(a, p));
}

static int test_mul(int print_cycles){
  uint64_t t0, t1;
  uint32_t r[N+1];
  char str[100];

  uint32_t p[N];
  uint32_t x[N];
  uint32_t y[N];
  uint32_t ref[N];
  uint16_t pinv;

  // sample random odd p < 2**2047
  randombytes((uint8_t *)p, sizeof p);
  p[N-1] &= 0x7FFFFFFF;
  p[0]  |= 0x00000001;

  // compute Mod(-p^-1, 2**16)
  pinv = invp(p) % (1<<16);

  // find a,b < p
  sample_modp(x, p);
  sample_modp(y, p);

  // compute reference
  gmpmulmod(ref, x, y, p);


  t0 = hal_get_time();
  schoolbook_mulmod(r, x, y, p, pinv);
  t1 = hal_get_time();
\
  if(print_cycles){
    sprintf(str, "%d x %d bit mulmod = %llu", NBITS, NBITS, t1-t0);
    hal_send_str(str);
  }

  if(memcmp(r, ref, sizeof ref)){
    hal_send_str("ERROR\n");
    return 1;
  }
  return 0;
}



static int test_sqrmod(int print_cycles){
    char str[100];
    uint64_t t0, t1;
    uint32_t a[N];
    uint32_t cref[N];
    uint32_t c[N+1];
    uint32_t p[N];
    uint16_t pinv;

    // sample random odd p < 2**(NBITS-1)
    randombytes((uint8_t *)p, sizeof p);
    p[N-1] &= 0x7FFFFFFF;
    p[0]  |= 0x00000001;

    // find a < p
    sample_modp(a, p);

    // compute reference
    gmpmulmod(cref, a, a, p);

    // compute Mod(-p^-1, 2**16)
    pinv = invp(p) % (1<<16);

    t0 = hal_get_time();
    schoolbook_sqrmod(c, a, p, pinv);
    t1 = hal_get_time();

    if(print_cycles){
      sprintf(str, "%d x %d bit sqrmod = %llu", NBITS, NBITS, t1-t0);
      hal_send_str(str);
    }
    if(memcmp(c, cref, sizeof cref)){
      hal_send_str("ERROR\n");
      return 1;
    }
    return 0;
}


/* If is_public is set, we use e = 2^16 + 1 as is extremely common. */
static int test_expmod(bool is_public){
    uint64_t t0, t1;
    uint32_t a[N];
    uint32_t b[N] = {0x10001};
    uint32_t cref[N];
    uint32_t c[N+1];
    uint32_t p[N];
    uint16_t pinv;
    uint32_t rsqr[N];
    uint32_t r[N];
    uint32_t one[N] = {1};

    // sample random odd p < 2**(NBITS-1)
    randombytes((uint8_t *)p, sizeof p);
    p[N-1] &= 0x7FFFFFFF;
    p[0]  |= 0x00000001;

    // compute Mod(-p^-1, 2**16)
    pinv = invp(p) % (1<<16);

    // compute R^2 mod p (for converion to Montgomery domain)
    gmpgetrsqr(rsqr, p);

    // compute R mod p
    gmpgetr(r, p);

    // find a,b < p
    // Actually b should be < p - 1
    sample_modp(a, p);
    if (!is_public)
        sample_modp(b, p);

    // compute reference
    gmpexpmod(cref, a, b, p);

    /*****************************************
     * ONLINE COMPUTATION (during decrypt)
     ****************************************/

    t0 = hal_get_time();
    if (is_public)
        schoolbook_expmod_public(c, a, b[0], p, pinv, rsqr, r, one);
    else
        schoolbook_expmod(c, a, b, p, pinv, rsqr, r, one);
    t1 = hal_get_time();
    send_cycles((is_public ? "expmod (public)" : "expmod (private)"), t1-t0);
    // dumpint(c);
    if(memcmp(c, cref, sizeof cref)){
        hal_send_str("ERROR INT EXP MOD\n");
        return 1;
    }
    return 0;
}


int main(void){
  hal_setup(CLOCK_BENCHMARK);
  hal_send_str("================");
  int err = 0;

  send_number("NBITS", NBITS);

  err += test_mul(1);
  err += test_sqrmod(1);
  err += test_expmod(1);
  err += test_expmod(0);
  for(int i=0;i<NTESTS;i++){
    err += test_mul(0);
    err += test_sqrmod(0);
  }

  if(err){
    hal_send_str("ERROR\n");
  } else {
    hal_send_str("OK\n");
  }

  hal_send_str("#################");
  while(1);
  return 0;
}
