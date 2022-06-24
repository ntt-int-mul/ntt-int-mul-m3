#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "hal.h"

#include "params.h"
#include "nttmulmod.h"

#include "helper.h"
#include "crt.h"
#include "ntt.h"
#include "gmpwrap.h"
#include "randombytes.h"

#define NTESTS 1

static void send_number_(char *s, uint64_t num, char *u){
  char fmt[100] = {0}, str[100];
  strcpy(fmt, s);   // the 90s want their APIs back yo
  int n = strlen(fmt);
  fmt[n++] = ':';
  while (n < 30)
      fmt[n++] = ' ';
  strcat(fmt, "%20llu");
  sprintf(str, fmt, (unsigned long long) num);
  if (u) { strcat(str, " "); strcat(str, u); }
  hal_send_str(str);
}

#define send_number(S,N) do { send_number_((S),(N),NULL); } while (0)
#define send_cycles(S,N) do { send_number_((S),(N),"cycles"); } while (0)

//static void dumpint(uint32_t *a){
//    char buf[0x1000] = {0};
//    sprintf(buf + strlen(buf), "0x");
//    for(size_t i = N-1; i<N; --i)
//        sprintf(buf + strlen(buf), "%08lx", (unsigned long) a[i]);
//    hal_send_str(buf);
//}

static void profile(void){
  uint64_t t0, t1;

  uint64_t chunk_time;
  uint64_t dechunk_time;
  uint64_t lower_time;
  uint64_t crt_time;

  uint64_t fnt_time;
  uint64_t fnt_pre_time;
  uint64_t ifnt_time;
  uint64_t fnt_base_time;
  uint64_t fnt_base_pre_time;
  uint64_t fnt_basesqr_time;

  uint64_t ntt_time;
  uint64_t ntt_pre_time;
  uint64_t intt_time;
  uint64_t ntt_base_time;
  uint64_t ntt_base_pre_time;
  uint64_t ntt_basesqr_time;

//  uint64_t sub_high_time;
  uint64_t add_high_time;

  uint64_t tbl_lookup_time;

  pre_t pre;
  poly_dbl_t f1, f2, f3;
  poly_t p1;
  num_t tbl[(size_t) 1 << EXP_WINDOWSIZE];
  num_t i1;
  dbl_num_t i2;
  hal_send_str("-- Individual functions");
  t0 = hal_get_time();
  chunk(&p1, &i1);
  t1 = hal_get_time();
  chunk_time = t1-t0;
  send_cycles("chunk", chunk_time);

  t0 = hal_get_time();
  lower(&p1, &f2);
  t1 = hal_get_time();
  lower_time = t1-t0;
  send_cycles("lower", lower_time);

  t0 = hal_get_time();
  dechunk(&i2, &f1);
  t1 = hal_get_time();
  dechunk_time = t1-t0;
  send_cycles("dechunk", dechunk_time);

  t0 = hal_get_time();
  crt(f1.v, f2.v, f3.v);
  t1 = hal_get_time();
  crt_time = t1-t0;
  send_cycles("crt", crt_time);

  t0 = hal_get_time();
  ntt_q1(f1.v, f2.v);
  t1 = hal_get_time();
  ntt_time = t1-t0;
  send_cycles("ntt_q1", ntt_time);

  t0 = hal_get_time();
  ntt_pre_q1(pre.v1, f1.v);
  t1 = hal_get_time();
  ntt_pre_time = t1-t0;
  send_cycles("ntt_pre_q1", ntt_pre_time);

  t0 = hal_get_time();
  intt_q1(f1.v);
  t1 = hal_get_time();
  intt_time = t1-t0;
  send_cycles("intt_q1", intt_time);

  t0 = hal_get_time();
  basemul_q1(f1.v, f2.v, f3.v);
  t1 = hal_get_time();
  ntt_base_time = t1-t0;
  send_cycles("basemul_q1", ntt_base_time);

  t0 = hal_get_time();
  basemul_pre_q1(f1.v, f2.v, pre.v1);
  t1 = hal_get_time();
  ntt_base_pre_time = t1-t0;
  send_cycles("basemul_pre_q1", ntt_base_pre_time);

  t0 = hal_get_time();
  basesqr_q1(f1.v, f2.v);
  t1 = hal_get_time();
  ntt_basesqr_time = t1-t0;
  send_cycles("basesqr_q1", ntt_basesqr_time);


  t0 = hal_get_time();
  ntt_q2(f1.v, f2.v);
  t1 = hal_get_time();
  fnt_time = t1-t0;
  send_cycles("ntt_q2", fnt_time);

  t0 = hal_get_time();
  ntt_pre_q2(pre.v2, f1.v);
  t1 = hal_get_time();
  fnt_pre_time = t1-t0;
  send_cycles("ntt_pre_q2", fnt_pre_time);

  t0 = hal_get_time();
  intt_q2(f1.v);
  t1 = hal_get_time();
  ifnt_time = t1-t0;
  send_cycles("intt_q2", ifnt_time);

  t0 = hal_get_time();
  basemul_q2(f1.v, f2.v, f3.v);
  t1 = hal_get_time();
  fnt_base_time = t1-t0;
  send_cycles("basemul_q2", fnt_base_time);

  t0 = hal_get_time();
  basemul_pre_q2(f1.v, f2.v, pre.v2);
  t1 = hal_get_time();
  fnt_base_pre_time = t1-t0;
  send_cycles("basemul_pre_q2", fnt_base_pre_time);

  t0 = hal_get_time();
  basesqr_q2(f1.v, f2.v);
  t1 = hal_get_time();
  fnt_basesqr_time = t1-t0;
  send_cycles("basesqr_q2", fnt_basesqr_time);

//  t0 = hal_get_time();
//  sub_high(&i1, &i2, &i2, &i1);
//  t1 = hal_get_time();
//  sub_high_time = t1-t0;
//  send_cycles("sub_high", sub_high_time);

  t0 = hal_get_time();
  add_high(&i1, &i2, &i2);
  t1 = hal_get_time();
  add_high_time = t1-t0;
  send_cycles("add_high", add_high_time);

  t0 = hal_get_time();
  tbl_lookup(&i1, tbl, (1u<<EXP_WINDOWSIZE)-1);
  t1 = hal_get_time();
  tbl_lookup_time = t1-t0;
  send_cycles("tbl_lookup", tbl_lookup_time);


  hal_send_str("-- Sums (estimated cycle counts)");

  send_cycles("mulmod (w/ NTT of b)  sum", 3*chunk_time+2*dechunk_time+lower_time+3*crt_time+4*fnt_time+3*ifnt_time+1*fnt_base_time+2*fnt_base_pre_time+4*ntt_time+3*intt_time+1*ntt_base_time+2*ntt_base_pre_time+add_high_time);
  send_cycles("    3x chunk", 3*chunk_time);
  send_cycles("    2x dechunk", 2*dechunk_time);
  send_cycles("    1x lower", lower_time);
  send_cycles("    3x crt", 3*crt_time);
  send_cycles("    4x ntt_q1", 4*ntt_time);
  send_cycles("    4x intt_q1", 3*intt_time);
  send_cycles("    1x basemul_q1", 1*ntt_base_time);
  send_cycles("    2x basemul_pre_q1", 2*ntt_base_pre_time);
  send_cycles("    4x ntt_q2", 4*fnt_time);
  send_cycles("    3x ifnt_q2", 3*ifnt_time);
  send_cycles("    1x basemul_q2", 1*fnt_base_time);
  send_cycles("    2x basemul_pre_q2", 2*fnt_base_pre_time);
  send_cycles("    1x add_high", add_high_time);

  hal_send_str("");

  send_cycles("mulmod (b precomp) sum", 2*chunk_time+2*dechunk_time+lower_time+3*crt_time+3*fnt_time+3*ifnt_time+3*fnt_base_pre_time+3*ntt_time+3*intt_time+3*ntt_base_pre_time+add_high_time);
  send_cycles("    2x chunk", 2*chunk_time);
  send_cycles("    2x dechunk", 2*dechunk_time);

  send_cycles("    1x lower", lower_time);
  send_cycles("    3x crt", 3*crt_time);
  send_cycles("    3x ntt_q1", 3*ntt_time);
  send_cycles("    3x intt_q1", 3*intt_time);
  send_cycles("    3x basemul_pre_q1", 3*ntt_base_pre_time);
  send_cycles("    3x ntt_q2", 3*fnt_time);
  send_cycles("    3x ifnt_q2", 3*ifnt_time);
  send_cycles("    3x basemul_pre_q2", 3*fnt_base_pre_time);
  send_cycles("    1x add_high", add_high_time);

  hal_send_str("");

  send_cycles("sqrmod sum", 2*chunk_time+2*dechunk_time+lower_time+3*crt_time+3*fnt_time+3*ifnt_time+2*fnt_base_pre_time+fnt_basesqr_time+3*ntt_time+3*intt_time+2*ntt_base_pre_time+ntt_basesqr_time+add_high_time);

  send_cycles("    2x chunk", 2*chunk_time);
  send_cycles("    2x dechunk", 2*dechunk_time);
  send_cycles("    1x lower", lower_time);
  send_cycles("    3x crt", 3*crt_time);
  send_cycles("    3x ntt_q2", 3*fnt_time);
  send_cycles("    3x intt_q2", 3*ifnt_time);
  send_cycles("    2x basemul_pre_q2", 2*fnt_base_pre_time);
  send_cycles("    1x basesqr_q2", fnt_basesqr_time);
  send_cycles("    3x ntt_q1", 3*ntt_time);
  send_cycles("    3x intt_q1", 3*intt_time);
  send_cycles("    2x basemul_pre_q1", 2*ntt_base_pre_time);
  send_cycles("    1x basesqr_q1", ntt_basesqr_time);
  send_cycles("    1x add_high", add_high_time);

}

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

static void chunk_full(poly_t *dst, uint32_t const src[Npad]){
    memset(dst, 0, sizeof(*dst));
    const uint8_t *srcb = (uint8_t*)src;
    size_t i;
    uint32_t at=0;
    int abits=0;
    size_t actr=0;

    for(i=0; i<4*Npad; i++){
        at += (uint32_t) srcb[i] << abits;
        abits += 8;
        if(abits >= 11){
            dst->v[actr++] = at & 0x7FF;
            at >>= 11;
            abits -= 11;
        }
    }
}

static void num_full_pre(pre_t *out, uint32_t const in[Npad])
{
    poly_t chunked;
    chunk_full(&chunked, in);
    ntt_pre(out, &chunked);
}

static void sample_montmul_ctx( montmul_ctx_t *ctx )
{
    uint32_t p_inv[Npad];
    uint32_t min_p_inv[Npad];

    // sample random odd p < 2**(NBITS-1)
    randombytes((uint8_t *)ctx->p.v, sizeof ctx->p.v);
    ctx->p.v[N-1] &= 0x7FFFFFFF;
    ctx->p.v[0]  |= 0x00000001;
    // invert p mod 2^20748
    gmpinvmod(p_inv, ctx->p.v);
    gmpneginvmod(min_p_inv, ctx->p.v);

    // ntts of pinv mod Q1, Q2
    num_full_pre(&ctx->p_inv_data,p_inv);
    // ntts of minpinv mod Q1, Q2
    num_full_pre(&ctx->min_p_inv_data,min_p_inv);
    // ntts of p mod Q1, Q2
    num_pre(&ctx->p_data, &ctx->p);

    // compute R^2 mod p (for converion to Montgomery domain)
    gmpgetrsqr(ctx->rsqr.v, ctx->p.v);
    gmpgetr(ctx->r.v, ctx->p.v);
}

static int test_sqrmod(void){
    uint64_t t0, t1;

    // element to be squared
    num_t a, cref, c;

    montmul_ctx_t ctx;
    sample_montmul_ctx(&ctx);

    // find a < p
    sample_modp(a.v, ctx.p.v);

    // compute reference
    gmpmulmod(cref.v, a.v, a.v, ctx.p.v);

    t0 = hal_get_time();
    ntt_sqrmod(&c, &a, &ctx);
    t1 = hal_get_time();

    send_cycles("sqrmod", t1-t0);

    if(memcmp(&c, &cref, sizeof cref)){
        hal_send_str("ERROR INT SQR MOD\n");
        return 1;
    }
    return 0;
}

static int test_mulmod(bool precomp){
    uint64_t t0, t1;
    num_t a, b, cref, c;

    montmul_ctx_t ctx;
    sample_montmul_ctx(&ctx);

    // find a,b < p
    sample_modp(a.v, ctx.p.v);
    sample_modp(b.v, ctx.p.v);

    // compute reference
    gmpmulmod(cref.v, a.v, b.v, ctx.p.v);

    /*****************************************
     * PRECOMPUTATION (done during keygen)
     ****************************************/
    if (!precomp) {
        t0 = hal_get_time();
        ntt_mulmod(&c, &a, &b, &ctx);
        t1 = hal_get_time();
        send_cycles("mulmod (w/ NTT of b)", t1-t0);

        // dumpint(c);
        if(memcmp(&c, &cref, sizeof cref)){
            hal_send_str("ERROR INT MUL MOD\n");
            return 1;
        }
        return 0;
    }

    /*****************************************
     * PRECOMPUTATION (done during decrypt, but only once)
     ****************************************/
    pre_t b_data;
    num_pre(&b_data,&b);

    /*****************************************
     * ONLINE COMPUTATION (during decrypt)
     ****************************************/

    t0 = hal_get_time();
    ntt_mulmod_core(&c, &a, &b_data, &ctx);
    t1 = hal_get_time();
    send_cycles("mulmod (b precomputed)", t1-t0);

    if(memcmp(&c, &cref, sizeof cref)){
        hal_send_str("ERROR INT MUL MOD (PRE)\n");
        return 1;
    }
    return 0;
}

static int test_tbl_lookup(void){
    uint64_t t0, t1, tt = 0;
    num_t res;
    num_t tab[(1u<<EXP_WINDOWSIZE)];
    for (unsigned idx = 0; idx < (1u<<EXP_WINDOWSIZE); ++idx) {
        randombytes((uint8_t *) &res, sizeof res);
        randombytes((uint8_t *) &tab, sizeof tab);
        t0 = hal_get_time();
        tbl_lookup(&res, tab, idx);
        t1 = hal_get_time();
        tt += t1 - t0;
        if (memcmp(&res, &tab[idx], sizeof res)) {
            hal_send_str("ERROR in tbl_lookup()\n");
            return 1;
        }
    }
    send_cycles("table lookup", tt >> EXP_WINDOWSIZE);
    return 0;
}

/* If is_public is set, we use e = 2^16 + 1 as is extremely common. */
static int test_expmod(bool is_public){
    uint64_t t0, t1;
    num_t a, b, cref, c;

    const uint32_t b0 = 0x10001;

    montmul_ctx_t ctx;
    sample_montmul_ctx(&ctx);

    // find a,b < p
    // Actually b should be < p - 1
    sample_modp(a.v, ctx.p.v);
    sample_modp(b.v, ctx.p.v);

    if (is_public) {
        memset(&b, 0, sizeof b);
        b.v[0] = b0;
    }

    // compute reference
    gmpexpmod(cref.v, a.v, b.v, ctx.p.v);


    t0 = hal_get_time();
    if (is_public)
        ntt_expmod_public(&c, &a, b0, &ctx);
    else
        ntt_expmod(&c, &a, &b, &ctx);
    t1 = hal_get_time();
    send_cycles((is_public ? "expmod (public)" : "expmod (private)"), t1-t0);
    // dumpint(c);
    if(memcmp(&c, &cref, sizeof cref)){
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

  profile();
  hal_send_str("-- actual benchmarks");
  for(int i=0;i<NTESTS;i++){
    err += test_mulmod(false);
  }
  hal_send_str(err ? "ERRORS" : "OK");

  for(int i=0;i<NTESTS;i++){
    err += test_mulmod(true);
  }
  hal_send_str(err ? "ERRORS" : "OK");

  for(int i=0;i<NTESTS;i++){
    err += test_sqrmod();
  }
  hal_send_str(err ? "ERRORS" : "OK");

  err += test_tbl_lookup();
  hal_send_str(err ? "ERRORS" : "OK");

//  send_cycles("schoolbook montgomery (2048 bits):", 232405);
//  send_cycles("BearSSL Montgomery (2048 bits):", 327000);

  hal_send_str("running expmod (public-key version) now...");
  for(int i=0;i<NTESTS;i++){
    err += test_expmod(true);
  }
  hal_send_str(err ? "ERRORS" : "OK");

  hal_send_str("running expmod (private-key version) now... you may want to grab a coffee...");
  for(int i=0;i<NTESTS;i++){
    err += test_expmod(false);
  }
  hal_send_str(err ? "ERRORS" : "OK");

  hal_send_str("#################");
  hal_send_str(err ? "ERRORS\nERRORS\nERRORS\nERRORS" : "OK");
  hal_send_str("#################");

  while(1);
  return 0;
}
