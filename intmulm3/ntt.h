#ifndef _NTTREF_H
#define _NTTREF_H

#include <stdint.h>
#include "params.h"


#if NBITS == 2048
void ntt_12289(int32_t a[NNN], const int32_t b[NNN/2]);
void ntt_pre_12289(int32_t b[NNN], const int32_t a[NNN/2]);
void intt_12289(int32_t a[NNN]);
void basemul_12289(int32_t c[NNN], const int32_t a[NNN], const int32_t b[NNN]);
void basemul_pre_12289(int32_t c[NNN], const int32_t a[NNN], const int32_t b[NNNpre]);
void basesqr_12289(int32_t c[NNN], const int32_t a[NNN]);

#define ntt_q1 ntt_12289
#define ntt_pre_q1 ntt_pre_12289
#define intt_q1 intt_12289
#define basemul_q1 basemul_12289
#define basemul_pre_q1 basemul_pre_12289
#define basesqr_q1 basesqr_12289

#elif NBITS == 4096
void ntt_25601(int32_t a[NNN], const int32_t b[NNN/2]);
void ntt_pre_25601(int32_t b[NNN], const int32_t a[NNN/2]);
void intt_25601(int32_t a[NNN]);
void basemul_25601(int32_t c[NNN], const int32_t a[NNN], const int32_t b[NNN]);
void basemul_pre_25601(int32_t c[NNN], const int32_t a[NNN], const int32_t b[NNNpre]);
void basesqr_25601(int32_t c[NNN], const int32_t a[NNN]);

#define ntt_q1 ntt_25601
#define ntt_pre_q1 ntt_pre_25601
#define intt_q1 intt_25601
#define basemul_q1 basemul_25601
#define basemul_pre_q1 basemul_pre_25601
#define basesqr_q1 basesqr_25601
#endif

void ntt_65537(int32_t a[NNN], const int32_t b[NNN/2]);
void ntt_pre_65537(int32_t b[NNN], const int32_t a[NNN/2]);
void intt_65537(int32_t a[NNN]);
void basemul_65537(int32_t c[NNN], const int32_t a[NNN], const int32_t b[NNN]);
void basemul_pre_65537(int32_t c[NNN], const int32_t a[NNN], const int32_t b[NNNpre]);
void basesqr_65537(int32_t c[NNN], const int32_t a[NNN]);

#define ntt_q2 ntt_65537
#define ntt_pre_q2 ntt_pre_65537
#define intt_q2 intt_65537
#define basemul_q2 basemul_65537
#define basemul_pre_q2 basemul_pre_65537
#define basesqr_q2 basesqr_65537

#endif
