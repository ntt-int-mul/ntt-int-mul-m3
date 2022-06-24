#ifndef _HELPER_H
#define _HELPER_H
#include <stdint.h>
#include "params.h"
#include "nttmulmod.h"

// chop up into 11-bit chunks
void chunk(poly_t *, num_t const *);

// evaluate at 2^11
void dechunk(dbl_num_t *, poly_dbl_t const *);
void dechunk_single(num_t *dst, poly_t const *src);

// equivalent to: dechunk(), extract lower half, chunk()
void lower(poly_t *, poly_dbl_t const *);

// c -= p if >= p; c = a.hi - b.hi in [0;p); c = a.hi + b.hi in [0;2p)
void fix_modp(num_t *c, num_t const *a, num_t const *p);
void sub_high(num_t *, dbl_num_t const *a, dbl_num_t const *b, num_t const *p);
void add_high(num_t *, dbl_num_t const *a, dbl_num_t const *b);

// constant-time table lookup
void tbl_lookup(num_t *res, const num_t *tbl, uint8_t idx);

static inline void num_pre(pre_t *out, num_t const *in)
{
    poly_t chunked;
    chunk(&chunked, in);
    ntt_pre(out, &chunked);
}

static inline void num_ntt(ntt_t *out, num_t const *in)
{
    poly_t chunked;
    chunk(&chunked, in);
    ntt(out, &chunked);
}

#endif
