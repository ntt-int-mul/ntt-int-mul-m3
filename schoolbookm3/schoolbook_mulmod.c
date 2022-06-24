#include "schoolbook_mulmod.h"

#include <stddef.h>
#include <string.h>

extern void multi_limb_mont_16_asm(uint32_t *r, uint16_t *a, uint16_t *b, uint16_t *p, uint16_t pinv);


static void csubp(uint32_t *a, const uint32_t *p){
  uint32_t tmp[N];
  uint32_t t;
  uint32_t carry = 0;
  uint32_t mask;
  for(int i=0; i<N; i++){
    t = a[i] - carry;
    if(t > a[i]) {
      carry = 1;
    } else {
      carry = 0;
    }

    // can have at most one carry
    tmp[i] = t - p[i];
    if(tmp[i] > t){
      carry = 1;
    } else {
      carry = 0;
    }
  }
  mask = -(1-carry);
  for (int i = 0;i < N; i++) {
    a[i] ^= mask & (tmp[i] ^ a[i]);
  }
}

void schoolbook_sqrmod(uint32_t c[N+1], const uint32_t a[N], const uint32_t p[N], uint16_t pinv){
    multi_limb_mont_16_asm(c, (uint16_t *)a, (uint16_t *)a, (uint16_t *)p, pinv);
    csubp(c, p);
}

void schoolbook_mulmod(uint32_t c[N+1], const uint32_t a[N], const uint32_t b[N], const uint32_t p[N], uint16_t pinv){
    multi_limb_mont_16_asm(c, (uint16_t *)a, (uint16_t *)b, (uint16_t *)p, pinv);
    csubp(c, p);
}


void tbl_lookup(uint32_t *res, const uint32_t tbl[(1U<<EXP_WINDOWSIZE)][N], uint8_t idx);

void schoolbook_expmod(uint32_t c[N+1], const uint32_t a[N], const uint32_t b[N], const uint32_t p[N], uint16_t pinv,
                       const uint32_t rsqr[N], const uint32_t r[N], const uint32_t one[N]){
    uint32_t tbl[(1U<<EXP_WINDOWSIZE)][N];

    {
        // 1) Convert a to Montgomery domain
        uint32_t amont[N+1];
        schoolbook_mulmod(amont, a, rsqr, p, pinv);

        // 2) Precompute table (1, a, a^2, ..., a^(2^w-1))
        memcpy(&tbl[0], r, N*sizeof(uint32_t));
        memcpy(&tbl[1], amont, N*sizeof(uint32_t));
        for(size_t i=2;i<(1<<EXP_WINDOWSIZE);i++){
            schoolbook_mulmod(&tbl[i][0], amont, &tbl[i-1][0], p, pinv);
        }
    }

    // 3) Fixed-window Exp
    long i = (N*32-1) / EXP_WINDOWSIZE * EXP_WINDOWSIZE;

    size_t idx = b[i/32] >> i%32;
    tbl_lookup(c, tbl, idx);

    while ((i -= EXP_WINDOWSIZE) >= 0) {
        uint32_t res[N];

        // lookup
        if (i%32 < 32-EXP_WINDOWSIZE) {
            idx = (b[i/32] >> i%32) % (1<<EXP_WINDOWSIZE);
        }
        else {
            uint64_t tmp = * (uint64_t *) (b + i/32);
            idx = (tmp >> i%32) % (1<<EXP_WINDOWSIZE);
        }
        tbl_lookup(res, tbl, idx);

        // square
        for (size_t k = 0; k<EXP_WINDOWSIZE; k++)
            schoolbook_sqrmod(c, c, p, pinv);

        // multiply
        schoolbook_mulmod(c, c, res, p, pinv);
    }

    // 4) Convert back to normal domain
    schoolbook_mulmod(c, c, one, p, pinv);
}

void schoolbook_expmod_public(uint32_t c[N+1], const uint32_t a[N], uint32_t b, const uint32_t p[N], uint16_t pinv,
                       const uint32_t rsqr[N], const uint32_t r[N], const uint32_t one[N]){
    int i;
    uint32_t amont[N+1];

    // 1) Convert a to Montgomery domain, then NTT domain
    schoolbook_mulmod(amont, a, rsqr, p, pinv);

    // 2) Initialize return value to Montgomery 1
    memcpy(c, r, N*sizeof(*c));
    if (!b) return;

    // 3) Square-and-multiply loop
    for (i = 31; !(b >> i); --i);
    for (      ; i >= 0   ; --i) {
        schoolbook_sqrmod(c, c, p, pinv);
        if ((b >> i) & 1)
            schoolbook_mulmod(c, c, amont, p, pinv);
    }
    // 4) Convert back to normal domain
    schoolbook_mulmod(c, c, one, p, pinv);
}
