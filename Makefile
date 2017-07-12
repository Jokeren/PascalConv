BINS := sconv_fprop_K64_N64 sconv_bprop_C64_N64 sconv_bprop_C1_N64 sconv_update_C128_K128 \
	sconv_fprop_K128_N128 sconv_bprop_C128_N128
  
TARGETS := $(addsuffix .cubin, $(BINS))
TEMPLATES := $(addsuffix _template.cubin, $(BINS))

all: $(BINS) sconv_fprop

$(BINS):
	nvcc -arch sm_61 -m 64 $@.cu -cubin -O3 -o $@_template.cubin
	maxas.pl -i $@.sass $@_template.cubin $@.cubin

sconv_fprop: sconv_fprop.cu
	nvcc -arch sm_61 -m 64 -o $@ $^ -lcuda -lcudart

clean:
	rm $(TARGETS) $(TEMPLATES) sconv_fprop

.PHONY:
	all clean

#utils
print-% : ; $(info $* is $(flavor $*) variable set to [$($*)]) @true   
