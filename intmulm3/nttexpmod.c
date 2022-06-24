#include "nttmulmod.h"
#include <string.h>
#include "helper.h"

// c : result (a^b mod p)
// a : base
// b : exponent
void ntt_expmod(num_t *c,
                num_t const *a,
                num_t const *b,
                montmul_ctx_t const *ctx )
{
    num_t tbl[(1U<<EXP_WINDOWSIZE)];

    {
        pre_t a_pre;
        tbl[0] = ctx->r;
        to_mont_domain(&tbl[1],a,ctx);
        num_pre( &a_pre, &tbl[1]);
        for(size_t i=2;i<(1<<EXP_WINDOWSIZE);i++)
            ntt_mulmod_core(&tbl[i], &tbl[i-1], &a_pre, ctx );
    }

    // Fixed-window Exp
    long i = (N*32-1) / EXP_WINDOWSIZE * EXP_WINDOWSIZE;

    size_t idx = b->v[i/32] >> i%32;
    tbl_lookup(c, tbl, idx);

    while ((i -= EXP_WINDOWSIZE) >= 0) {
        num_t res;

        // lookup
        if (i%32 < 32-EXP_WINDOWSIZE) {
            idx = (b->v[i/32] >> i%32) % (1<<EXP_WINDOWSIZE);
        }
        else {
            uint64_t tmp = * (uint64_t *) (b->v + i/32);
            idx = (tmp >> i%32) % (1<<EXP_WINDOWSIZE);
        }
        tbl_lookup(&res, tbl, idx);

        // square
        for(size_t k=0; k<EXP_WINDOWSIZE; k++)
            ntt_sqrmod(c, c, ctx);

        // multiply
        ntt_mulmod(c, c, &res, ctx);
    }

    // Convert back to normal domain
    from_mont_domain(c,c,ctx);
}

void ntt_expmod_public(
                num_t *c,
                num_t const *a,
                uint32_t b,
                montmul_ctx_t const * ctx)
{

    // 1) Convert a to Montgomery domain, then NTT domain
    num_t amont;
    to_mont_domain(&amont, a, ctx);


    // 2) Initialize return value to Montgomery 1
    *c = ctx->r;
    if (!b) return;

    // 3) Square-and-multiply loop
    int i;
    for (i = 31; !(b >> i); --i);
    for (      ; i >= 0   ; --i) {
        ntt_sqrmod(c, c, ctx);

        // If we expect this to happen more than once, one
        // could buffer num_pre(a), but since we mainly care
        // about 65537, it doesn't matter
        if ((b >> i) & 1)
            ntt_mulmod(c, c, &amont, ctx);
    }

    // 4) Convert back to normal domain
    from_mont_domain( c, c, ctx);
}
