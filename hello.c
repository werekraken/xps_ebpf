#include <linux/bpf.h>
#include "bpf_helpers.h"

#ifdef RET0
  #define TAG "xps (RET 0)"
  #define RET 0

#elif defined(RET1)
  #define TAG "xps (RET 1)"
  #define RET 1

#elif defined(RET2)
  #define TAG "xps (RET 2)"
  #define RET 2

#else
  #define TAG "xps (RET -1)"
  #define RET -1

#endif

SEC("hello")
int _hello(struct __sk_buff *skb) {
  char fmt[] = TAG ": Hello, World!\n";
  bpf_trace_printk(fmt, sizeof(fmt));

  return RET;
}

char _license[] SEC("license") = "Dual MIT/GPL";
