BUIL_DIR := ./build
LIBXDISASM_BUILD := ./libxdisasm
CFLAGS := -ldisasm -lbfd -L$(LIBXDISASM_BUILD)/build/lib -Wall
CFLAGS += -I$(LIBXDISASM_BUILD)/include
# CFLAGS +=  -lxdisasm

include $(PRE_INCLUDE)

default:libxdis disassemly_cfg

libxdis:
	cd $(LIBXDISASM_BUILD) && $(MAKE)

disassemly_cfg:
	mkdir -p build
	gcc -g test_cfg.c cfg.c -o $(BUIL_DIR)/test_cfg $(CFLAGS)

clean:
	cd $(LIBXDISASM_BUILD) && $(MAKE) clean
	rm -rf $(BUIL_DIR)

# all:
# 	gcc -Wall -g test_cfg.c cfg.c -o test_cfg -ldisasm -lbfd
# 	gcc -Wall -g sample.c -o sample

# test:
# 	./test_cfg sample
# 	dot -Tpdf graph.simple.dot -o graph.simple.pdf
# 	dot -Tpdf graph.dot -o graph.pdf
# 	dot -Tpng graph.dot -o graph.png
