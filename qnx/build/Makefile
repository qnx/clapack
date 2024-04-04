TARGETS = linux-x86_64-o nto-aarch64-le nto-x86_64-o
CLEAN_TARGETS = $(addprefix clean-,$(TARGETS))
# Do not install linux-x86_64-o -- it is only here to help with the build process
INSTALL_TARGETS = $(addprefix install-,$(filter-out linux-x86_64-o,$(TARGETS)))

PASSTHROUGH_ARGS = INSTALL_ROOT_nto=$(INSTALL_ROOT_nto) USE_INSTALL_ROOT=$(USE_INSTALL_ROOT) JLEVEL=$(JLEVEL)

.PHONY: $(TARGETS) clean install

all: $(TARGETS)
clean: $(CLEAN_TARGETS)
install: $(INSTALL_TARGETS)

$(TARGETS): %:
	make -C $@ $(PASSTHROUGH_ARGS)
$(CLEAN_TARGETS): clean-%:
	make -C $* $(PASSTHROUGH_ARGS) clean
$(INSTALL_TARGETS): install-%: %
	make -C $* $(PASSTHROUGH_ARGS) install

# Require host build first
nto-aarch64-le: linux-x86_64-o
nto-x86_64-o: linux-x86_64-o
