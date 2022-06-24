#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <stdint.h>


#ifdef KARATSUBA
#define intmul intmul_ka
#else
#define intmul intmul_sb
#endif
#define intmul_low intmul_low_sb

#define KARA_LIMIT 64

extern void intmul (uint32_t *z, uint32_t *x, uint32_t *y, int N);
extern void intmul_low (uint32_t *z, uint32_t *x, uint32_t *y, int N);
extern void intmul_4nx4(uint32_t *z, uint32_t *x, uint32_t *y, int N);
extern uint32_t hensel32(uint32_t a);
extern void int_addto(uint32_t *d, uint32_t *a, int dl, int l);
extern void int_add(uint32_t *d, uint32_t *a, uint32_t, int l);
extern void int_addl(uint32_t *d, uint32_t *a, uint32_t, int l);
extern void int_negto(uint32_t *d, int l); // negate in place


int hensel(uint32_t *d, uint32_t *a, uint32_t *b, int nw) {
  // b is a buffer that needs to be 2* nw wide

  int bb[nw+2];
  int i, j;
  int w=1;
  d[0] = hensel32(a[0]);
  while(w<=nw/2) {
    if (w<=8) {
      intmul(b, a, d, w);
    }
    else { // w>=2 and we have intmul(b, a, d, w/2);
      intmul(b+w, a+w/2, d+w/2, w/2);
      int_addl(bb, a+w/2, a, w/2);
      int_addl(bb+w/2+1, d+w/2, d, w/2);
      intmul(b+2*w, bb, bb+w/2+1, w/2+1);
      int_subto(b+2*w, b+w, 2, w);
      int_subto(b+2*w, b, 2, w);
      int_addto(b+w/2, b+2*w, w/2-1, w+1);
    }
    intmul_low(d+w, a+w, d, w);
    int_add(b+2*w, d+w, b+w, w);
    intmul_low(d+w, d, b+2*w, w);
    int_negto(d+w, w);
    w += w;
  }
  if (w<nw) { // assume that the excess is small
    for (i=w; i<nw; i++) d[i]=0;
    if (w+4==nw) {
      // want to achieve intmul_low(b, a, d, nw);
      // have intmul(b, a, d, w/2)
      intmul_4nx4(b+2*w, a, d+w/2, w/2);
      for (i=w; i<nw; i++) b[i]=0;
      int_addto(b+w/2, b+2*w, 0, w/2+4);
      intmul_low(b+2*w, a, d+w/2+4, w/2);
      int_addto(b+w/2+4, b+2*w, 0, w/2);
      intmul_low(b+2*w, a+w/2, d, w/2+4);
      int_addto(b+w/2, b+2*w, 0, w/2+4);
    } else if (w+2==nw) {
      b[w] = d[w/2]; b[w+1]=d[w/2+1];
      b[w+2]=0; b[w+3]=0;
      intmul_4nx4(b+2*w, a, b+w, w/2);
      for (i=w; i<nw; i++) b[i]=0;
      int_addto(b+w/2, b+2*w, 0, w/2+2);
      intmul_low(b+2*w, a, d+w/2+2, w/2);
      int_addto(b+w/2+2, b+2*w, 0, w/2);
      intmul_low(b+2*w, a+w/2, d, w/2+2);
      int_addto(b+w/2, b+2*w, 0, w/2+2);
    } else intmul_low(b, a, d, nw);
    intmul_low(d+w, d, b+w, nw-w);
    int_negto(d+w, nw-w);
  }
  return(0);
}
