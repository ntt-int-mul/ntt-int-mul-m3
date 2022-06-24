#include "gmpwrap.h"
#include <gmp.h>
#include <string.h>

void gmpmulmod(uint32_t cint[N], const uint32_t aint[N], const uint32_t bint[N],
               const uint32_t pint[N]){
    mpz_t a, b, p, rinv;
    mpz_t c;
    mpz_init(a);
    mpz_import(a, N*sizeof(uint32_t), -1, 1, -1, 0, aint);
    mpz_init(b);
    mpz_import(b, N*sizeof(uint32_t), -1, 1, -1, 0, bint);
    mpz_init(p);
    mpz_import(p, N*sizeof(uint32_t), -1, 1, -1, 0, pint);
    mpz_init(c);

    // compute r^-1 mod p
    mpz_init_set_ui(rinv, 2);
    mpz_pow_ui(rinv, rinv, NBITS);
    mpz_invert(rinv, rinv, p);


    // compute a * b r^-1 mod p
    mpz_mul(c, a, b);
    mpz_mod(c, c, p);
    mpz_mul(c, c, rinv);
    mpz_mod(c, c, p);

    // convert back to binary
    size_t c_size;
    memset(cint, 0, sizeof(uint32_t)*N);
    mpz_export(cint, &c_size, -1, 1, -1, 0, c);

    // free memory
    mpz_clear(a);
    mpz_clear(b);
    mpz_clear(p);
    mpz_clear(c);
    mpz_clear(rinv);
}


void gmpexpmod(uint32_t cint[N], const uint32_t aint[N], const uint32_t bint[N],
               const uint32_t pint[N]){
    mpz_t a, b, p;
    mpz_t c;
    mpz_init(a);
    mpz_import(a, N*sizeof(uint32_t), -1, 1, -1, 0, aint);
    mpz_init(b);
    mpz_import(b, N*sizeof(uint32_t), -1, 1, -1, 0, bint);
    mpz_init(p);
    mpz_import(p, N*sizeof(uint32_t), -1, 1, -1, 0, pint);
    mpz_init(c);

    // compute a^b mod p
    mpz_powm(c, a, b, p);

    // convert back to binary
    size_t c_size;
    memset(cint, 0, sizeof(uint32_t)*N);
    mpz_export(cint, &c_size, -1, 1, -1, 0, c);

    // free memory
    mpz_clear(a);
    mpz_clear(b);
    mpz_clear(p);
    mpz_clear(c);
}

void gmpinvmod(uint32_t pinvint[N], const uint32_t pint[N]){
    mpz_t p;
    mpz_t r;
    mpz_t pinv;


    mpz_init(p);
    mpz_import(p, N*sizeof(uint32_t), -1, 1, -1, 0, pint);
    mpz_init(pinv);

    // compute r = 2^NBITS
    mpz_init_set_ui(r, 2);
    mpz_pow_ui(r, r, NBITS);

    // compute inverse p^-1 mod r (exists because p is odd)
    mpz_invert(pinv, p, r);

    // convert back to binary
    size_t pinv_size;
    memset(pinvint, 0, sizeof(uint32_t)*N);
    mpz_export(pinvint, &pinv_size, -1, 1, -1, 0, pinv);

    // free memory
    mpz_clear(p);
    mpz_clear(r);
    mpz_clear(pinv);
}

void gmptomont(uint32_t dst[N], const uint32_t src[N], const uint32_t pint[N]) {
    mpz_t a, p;

    mpz_init(a);
    mpz_import(a, N*sizeof(uint32_t), -1, 1, -1, 0, src);

    mpz_init(p);
    mpz_import(p, N*sizeof(uint32_t), -1, 1, -1, 0, pint);


    // compute a * 2^NBITS mod p
    mpz_mul_2exp(a, a, NBITS);
    mpz_mod(a, a, p);

    // convert back to binary
    size_t dst_size;
    memset(dst, 0, sizeof(uint32_t)*N);
    mpz_export(dst, &dst_size, -1, 1, -1, 0, a);

    // free memory
    mpz_clear(a);
    mpz_clear(p);

}

void gmpfrommont(uint32_t dst[N], const uint32_t src[N], const uint32_t pint[N]) {
    uint32_t one[N] = {0};
    one[0] = 1;
    gmpmulmod(dst, src, one, pint);
}


void gmpgetrsqr(uint32_t dst[N], const uint32_t pint[N]) {
    mpz_t r, p;

    mpz_init(p);
    mpz_import(p, N*sizeof(uint32_t), -1, 1, -1, 0, pint);

    // compute r = 2^(2*NBITS) mod p
    mpz_init_set_ui(r, 2);
    mpz_pow_ui(r, r, 2*NBITS);
    mpz_mod(r, r, p);

    // convert back to binary
    size_t dst_size;
    memset(dst, 0, sizeof(uint32_t)*N);
    mpz_export(dst, &dst_size, -1, 1, -1, 0, r);


    // free memory
    mpz_clear(r);
    mpz_clear(p);
}

void gmpgetr(uint32_t dst[N], const uint32_t pint[N]) {
    mpz_t r, p;

    mpz_init(p);
    mpz_import(p, N*sizeof(uint32_t), -1, 1, -1, 0, pint);

    // compute r = 2^NBITS mod p
    mpz_init_set_ui(r, 2);
    mpz_pow_ui(r, r, NBITS);
    mpz_mod(r, r, p);

    // convert back to binary
    size_t dst_size;
    memset(dst, 0, sizeof(uint32_t)*N);
    mpz_export(dst, &dst_size, -1, 1, -1, 0, r);


    // free memory
    mpz_clear(r);
    mpz_clear(p);
}

void gmpmodp(uint32_t rint[N], const uint32_t pint[N]){
    mpz_t r, p;

    mpz_init(p);
    mpz_import(p, N*sizeof(uint32_t), -1, 1, -1, 0, pint);

    mpz_init(r);
    mpz_import(r, N*sizeof(uint32_t), -1, 1, -1, 0, rint);

    mpz_mod(r, r, p);

    // convert back to binary
    size_t dst_size;
    memset(rint, 0, sizeof(uint32_t)*N);
    mpz_export(rint, &dst_size, -1, 1, -1, 0, r);

    // free memory
    mpz_clear(r);
    mpz_clear(p);
}