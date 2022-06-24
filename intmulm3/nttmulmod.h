#ifndef _SQRMOD_H
#define _SQRMOD_H

#include <stdint.h>
#include <stdbool.h>
#include "params.h"

typedef struct  { uint32_t v[N]; } num_t;
typedef struct  { uint32_t lo[Npad]; num_t hi; } dbl_num_t;
typedef struct  { int32_t v[NNN/2]; } poly_t;
typedef union  {
    int32_t v[NNN];
    struct {
        poly_t lo; poly_t hi;
    };
} poly_dbl_t;
typedef struct  { int32_t v1[NNN], v2[NNN]; } ntt_t;
typedef struct  { int32_t v1[NNNpre], v2[NNNpre]; } pre_t;

typedef struct {
    num_t p;
    num_t r;    // 1 in Montgomery domain
    num_t rsqr; // r in Montgomery domain
    pre_t p_inv_data;
    pre_t min_p_inv_data;
    pre_t p_data;
} montmul_ctx_t;

void ntt(ntt_t *out, poly_t const *in);
void ntt_pre(pre_t *out, poly_t const *in);
void mul(ntt_t *out, ntt_t const *, ntt_t const *);
void mul_pre(ntt_t *out, ntt_t const *, pre_t const *);
void sqr(ntt_t *out, ntt_t const *);
void intt_and_crt(poly_dbl_t *out, ntt_t *);  /* destroys input */

// c : output
// a : element to be squared
void ntt_sqrmod(num_t *c,
                num_t const *a,
                montmul_ctx_t const *ctx );


// c : output
// a : first element to be mutiplied
// b : second element to be mutiplied
void ntt_mulmod(num_t *c,
                num_t const *a,
                num_t const *b,
                montmul_ctx_t const *ctx );

// c : output
// a : first element to be multiplied
// b : second element to be multiplied, after precomputation
void ntt_mulmod_core(num_t *c,
                     num_t const *a,
                     pre_t const *b_data,
                     montmul_ctx_t const *ctx );

// c : result (a^b mod p)
// a : base
// b : exponent (secret)
void ntt_expmod(num_t *c,
                num_t const *a,
                num_t const *b,
                montmul_ctx_t const *ctx );

// c : result (a^b mod p)
// a : base
// b : exponent (public)
void ntt_expmod_public(
                num_t *c,
                num_t const *a,
                uint32_t b,
                montmul_ctx_t const *ctx );

void fix_modp(num_t *c, num_t const *a, num_t const *p);    // helper.h
static inline void from_mont_domain(num_t *c,
                                    num_t const *a,
                                    montmul_ctx_t const *ctx )
{
    num_t one = {{1}}; // R^{-1} in Montgomery domain
    ntt_mulmod(c,a,&one,ctx);
    fix_modp(c, c, &ctx->p);
}

static inline void to_mont_domain(num_t *c,
                                  num_t const *a,
                                  montmul_ctx_t const *ctx )
{
    ntt_mulmod(c,&ctx->rsqr,a,ctx);
}

#endif
