ifndef QCONFIG
QCONFIG=qconfig.mk
endif
include $(QCONFIG)

include $(MKFILES_ROOT)/qmacros.mk

NAME=clapack

DIST_BASE=$(PROJECT_ROOT)/../../

#choose Release or Debug
CMAKE_BUILD_TYPE ?= Debug

ALL_DEPENDENCIES = clapack_all
.PHONY: clapack_all install check clean

CFLAGS += $(FLAGS)

include $(MKFILES_ROOT)/qtargets.mk

MAKE_ARGS ?= -j $(firstword $(JLEVEL) 1)

clapack_all:
	@mkdir -p build
	@cd build && cmake $(CMAKE_ARGS) $(DIST_BASE)
	@cd build && make VERBOSE=1 all $(MAKE_ARGS)

install check: clapack_all
	@echo Installing...
	@cd build && make VERBOSE=1 install $(MAKE_ARGS)
	@echo Done.

clean iclean spotless:
	rm -rf build

uninstall:

