#include "nttmulmod.h"
#include <string.h>

#include "helper.h"
#include "ntt.h"
#include "crt.h"

void ntt(ntt_t *out, poly_t const *in) {
    // NTTs of v mod Q1, Q2
    ntt_q1(out->v1, in->v);
    ntt_q2(out->v2, in->v);
}

void ntt_pre(pre_t *out, poly_t const *in){
    // NTTs of v mod Q1, Q2, with data precomputed for base mul
    ntt_pre_q1(out->v1, in->v);
    ntt_pre_q2(out->v2, in->v);
}

void mul(ntt_t *out, ntt_t const *a, ntt_t const *b){
    basemul_q1(out->v1, a->v1, b->v1);
    basemul_q2(out->v2, a->v2, b->v2);
}

void mul_pre(ntt_t *out, ntt_t const *a, pre_t const *b){
    basemul_pre_q1(out->v1, a->v1, b->v1);
    basemul_pre_q2(out->v2, a->v2, b->v2);
}

void sqr(ntt_t *out, ntt_t const *a){
    basesqr_q1(out->v1, a->v1);
    basesqr_q2(out->v2, a->v2);
}

/* destroys input */
void intt_and_crt(poly_dbl_t *out, ntt_t *c){
    intt_q1(c->v1);
    intt_q2(c->v2);
    crt(out->v, c->v1, c->v2);
}

// a : element to be squared
void ntt_sqrmod(num_t *c,
                num_t const *a,
                montmul_ctx_t const *ctx )
{
    dbl_num_t  aa;
    dbl_num_t  lp;
    poly_dbl_t poly;
    ntt_t      tmp;

    /**********************************
     * t = (a*a)
     **********************************/
    num_ntt(&tmp,a);
    sqr(&tmp, &tmp);
    intt_and_crt(&poly, &tmp);
    dechunk( &aa, &poly );

    /**********************************
     * l = (c mod 2**2048) * minpinv
     **********************************/
    lower(&poly.lo, &poly);
    ntt(&tmp, &poly.lo);
    mul_pre(&tmp, &tmp, &ctx->min_p_inv_data);
    intt_and_crt(&poly, &tmp);

    /**********************************
     * lp = l * p
     **********************************/
    lower(&poly.lo, &poly);
    ntt(&tmp, &poly.lo);
    mul_pre(&tmp, &tmp, &ctx->p_data);
    intt_and_crt(&poly, &tmp);
    dechunk(&lp,&poly);

    add_high( c, &aa, &lp );
}

// a : element to be mutiplied
// b1 : b transformed into NTT domain mod Q1 (precomputed)
// b2 : b transformed into NTT domain mod Q1 (precomputed)
// pinv1 : Mod(p^-1, 2**2048) transformed into NTT domain mod Q1
// pinv2 : Mod(p^-1, 2**2048) transformed into NTT domain mod Q2
// p1    : p transformed into NTT domain mod Q1
// p2    : p transformed into NTT domain mod Q2
void ntt_mulmod_core(num_t *c,
                     num_t const *a,
                     pre_t const *b_data,
                     montmul_ctx_t const *ctx)
{
    dbl_num_t  ab;
    dbl_num_t  lp;
    poly_dbl_t poly;
    ntt_t      tmp;

    /**********************************
     * t = (a*b)
     **********************************/
    num_ntt(&tmp,a);
    mul_pre(&tmp,&tmp,b_data);
    intt_and_crt(&poly, &tmp);
    dechunk( &ab, &poly );

    /**********************************
     * l = (c mod 2**2048) * minpinv
     **********************************/
    lower(&poly.lo, &poly);
    ntt(&tmp, &poly.lo);
    mul_pre(&tmp, &tmp, &ctx->min_p_inv_data);
    intt_and_crt(&poly, &tmp);

    /**********************************
     * lp = l * p
     **********************************/
    lower(&poly.lo, &poly);
    ntt(&tmp, &poly.lo);
    mul_pre(&tmp, &tmp, &ctx->p_data);
    intt_and_crt(&poly, &tmp);
    dechunk(&lp,&poly);

    add_high( c, &ab, &lp );
}

void ntt_mulmod(num_t *c,
                num_t const *a,
                num_t const *b,
                montmul_ctx_t const * ctx )
{
    ntt_t bntt;
    num_ntt(&bntt, b);

    dbl_num_t  ab;
    dbl_num_t  lp;
    poly_dbl_t poly;
    ntt_t      tmp;

    /**********************************
     * t = (a*b)
     **********************************/
    num_ntt(&tmp,a);
    mul(&tmp,&tmp, &bntt);
    intt_and_crt(&poly, &tmp);
    dechunk( &ab, &poly );

    /**********************************
     * l = (c mod 2**2048) * minpinv
     **********************************/
    lower(&poly.lo, &poly);
    ntt(&tmp, &poly.lo);
    mul_pre(&tmp, &tmp, &ctx->min_p_inv_data);
    intt_and_crt(&poly, &tmp);

    /**********************************
     * lp = l * p
     **********************************/
    lower(&poly.lo, &poly);
    ntt(&tmp, &poly.lo);
    mul_pre(&tmp, &tmp, &ctx->p_data);
    intt_and_crt(&poly, &tmp);
    dechunk(&lp,&poly);

    add_high( c, &ab, &lp );
}
