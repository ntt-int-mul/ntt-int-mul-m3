#include <gmp.h>

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <unistd.h>
#include <stdint.h>
#include <sys/types.h>

#include "hal.h"


void console_putint(int64_t numIn) {
  char str[100];
  sprintf(str, "%llu", numIn);
  hal_send_str(str);
}

#define console_puts hal_send_str


// #define NW 64
// #define NW 66
// #define NW 128
#define NW 132

uint32_t R[NW+1];

void gmp_import(mpz_t z,const unsigned char *s,unsigned long long slen)
{
  mpz_import(z,slen,-1,1,0,0,s);
}

int gmp_export(unsigned char *s,unsigned long long slen,mpz_t z)
{
  unsigned long long i;
  if (mpz_sizeinbase(z,256) > slen) return -1;
  for (i = 0;i < slen;++i) s[i] = 0;
  mpz_export(s,0,-1,1,0,0,z);
  return 0;
}

#define COUNT 10

#ifdef KARATSUBA
#define intmul intmul_ka
#else
#define intmul intmul_sb
#endif

#define intmul_low intmul_low_sb


extern void intmul (uint32_t *z, uint32_t *x, uint32_t *y, int N);
extern void intmul_low (uint32_t *z, uint32_t *x, uint32_t *y, int N);
extern uint32_t hensel32(uint32_t a);

int main(void) {
	/* add your own code */
  hal_setup(CLOCK_BENCHMARK);

  uint64_t t, t0, t1;
  int i,j, k;
  mpz_t x_gmp, y_gmp, z_gmp, xy_gmp, R_gmp;
  uint32_t x[NW],y[NW],z[4*NW],xy[2*NW], xi[2*NW];
  char buf[16];


  console_puts("\nStart of Testing\r\n\n");
  //srand(53589793);
  srand(2718281828);

  memset(R,4*NW,0); R[NW]=1;
  
  mpz_init(R_gmp);
  mpz_init(x_gmp);
  //mpz_init(y_gmp);
  //mpz_init(z_gmp);
  mpz_init(xy_gmp);

  for (i = 0;i < NW;++i) x[i] = rand();
  //for (i = 0;i < NW;++i) y[i] = rand();
  x[0] |= 1;
  gmp_import(x_gmp,x,4*NW);
  gmp_import(R_gmp,R,4*NW+1);
  /*
  gmp_import(y_gmp,y,4*NW);

  t0 = hal_get_time();
  mpz_mul(xy_gmp,x_gmp,y_gmp);
  t1 = hal_get_time();
  gmp_export(xy,8*NW,xy_gmp);
  console_puts("\r\n");
  console_putint(t1 - t0);
  console_puts(" clock cycles\r\n");
  console_puts("0x");
  for (i = NW-1; i>=0; --i) {
    sprintf(buf,"%08x",x[i]);
    console_puts(buf);
  }
  console_puts("\\\n * 0x");
  for (i = NW-1; i>=0; --i) {
    sprintf(buf,"%08x",y[i]);
    console_puts(buf);
  }
  console_puts("\\\n == 0x");
  for (i = 2*NW-1; i>=0; --i) {
    sprintf(buf,"%08x",xy[i]);
    console_puts(buf);
  }

  t0 = hal_get_time();
  intmul(z,x,y,NW);
  t1 = hal_get_time();
  console_puts("\r\n");
  console_putint(t1 - t0);
  console_puts(" clock cycles\r\n");

  console_puts("\\\n == 0x");
  for (i = 2*NW-1; i>=0; --i) {
    sprintf(buf,"%08x",z[i]);
    console_puts(buf);
  }

  console_puts("\r\n");
  console_puts("\nEnd of Testing intmul\r\n\n");
  if (memcmp(xy,z,NW*8)==0) console_puts("success\n");
  else console_puts("fail\n");
  console_puts("\r\n");

  
  t0 = hal_get_time();
  intmul_low(z,x,y,NW);
  t1 = hal_get_time();
  console_puts("\r\n");
  console_putint(t1 - t0);
  console_puts(" clock cycles\r\n");
  console_puts("\\\n == 0x");
  for (i = NW-1; i>=0; --i) {
    sprintf(buf,"%08x",z[i]);
    console_puts(buf);
  }

  console_puts("\r\n");
  console_puts("\nEnd of Testing intmul_low\r\n\n");
  if (memcmp(xy,z,NW*4)==0) console_puts("success\n");
  else console_puts("fail\n");
*/
  t=0; for (k=0; k<COUNT; k++) {
  
  t0 = hal_get_time();
  hensel(z,x,z+NW,NW);
  t1 = hal_get_time();

  console_puts("\r\n");
  console_putint(t1-t0);
  console_puts(" clock cycles for hensel: ");
  t+= (t1-t0);
  /*
  console_puts("\\\n == 0x");
  for (i = NW-1; i>=0; --i) {
    sprintf(buf,"%08x",z[i]);
    console_puts(buf);
  }
  console_puts("\r\n");
  */

  mpz_invert(xy_gmp,x_gmp,R_gmp);
  gmp_export(xy,4*NW,xy_gmp);
  if(memcmp(xy,z,4*NW)==0) console_puts("pass ");
  else console_puts("fail ");
  
  intmul_low(z+NW,x,z,NW);
  for (j=z[NW]^1, i=NW+1; i<2*NW; i++) j|=z[i];
  if (j==0) console_puts("pass\n");
  else console_puts("fail\n");

  }
  // console_puts("\r\n average: ");
  // console_putint(t/1000);
  // console_putint(t%1000);
  // /*
  // console_puts("\\\n == 0x");
  // for (i = NW-1; i>=0; --i) {
  //   sprintf(buf,"%08x",z[i+NW]);
  //   console_puts(buf);
  // }
  // */
  // console_puts(" cycles \r\n");
    
  /*
  i = rand()|1;
  t0 = hal_get_time();
  j = hensel32(i);
  t1 = hal_get_time();
  console_puts("\r\n");
  console_putint(t1-t0);
  console_puts(" clock cycles for hensel32: ");
  if (i*j==1) console_puts("success\n");
  else console_puts("fail\n");
  */
  
  return 0;
}
