USER = kevinpanaro
EXISTING_KEYBOARDS = 1upkeyboards sofle
NEW_KEYBOARDS = macropad

# keyboard name
NAME_1upkeyboards = 1upkeyboards/1up60hse
NAME_sofle = sofle
NAME_macropad = macropad

# Update QMK submodule and clean up old symlinks
init:
	@git submodule update --init --recursive
	@git submodule update --remote
	@$(foreach kb,$(EXISTING_KEYBOARDS), rm -rf qmk_firmware/keyboards/$(NAME_$(kb))/keymaps/$(USER) && echo "removing $(kb)/keymaps/$(USER)";)
	@$(foreach kb,$(NEW_KEYBOARDS), rm -rf qmk_firmware/keyboards/$(NAME_$(kb)) && echo "removing $(kb)";)


.PHONY: all $(EXISTING_KEYBOARDS) $(NEW_KEYBOARDS) clean init help

all: init $(EXISTING_KEYBOARDS) $(NEW_KEYBOARDS)

define build_existing_keyboards
	# Add new symlinks
	@ln -s $(shell pwd)/$@ qmk_firmware/keyboards/$(NAME_$@)/keymaps/$(USER)
	# Run build
	@make BUILD_DIR=$(shell pwd)/build -j1 -C qmk_firmware $(NAME_$@):$(USER)
	# Cleanup symlinks
	@rm -rf qmk_firmware/keyboards/$(NAME_$@)/keymaps/$(USER)
endef

define build_new_keyboards
	# Add new symlinks
	@ln -s $(shell pwd)/$@ qmk_firmware/keyboards/$(NAME_$@)
	# Run build
	@make BUILD_DIR=$(shell pwd)/build -j1 -C qmk_firmware $(NAME_$@):$(USER)
	# Cleanup symlinks
	@rm -rf qmk_firmware/keyboards/$(NAME_$@)
endef

$(EXISTING_KEYBOARDS): init
	$(call build_existing_keyboards,$@)
	
$(NEW_KEYBOARDS): init
	$(call build_new_keyboards,$@)

clean:
	@$(foreach kb,$(EXISTING_KEYBOARDS), rm -rf qmk_firmware/keyboards/$(NAME_$(kb))/keymaps/$(USER) && echo "removing $(kb)/keymaps/$(USER)";)
	@$(foreach kb,$(NEW_KEYBOARDS), rm -rf qmk_firmware/keyboards/$(NAME_$(kb)) && echo "removing $(kb)";)
	rm -rf ./build/
	rm -rf ./qmk_firmware/

help:
	@echo "Available targets:"
	@echo "  all        : Build all keyboards."
	@echo "  clean      : Remove build artifacts."
	@echo "  init       : Update QMK submodule and clean up old symlinks."
	@echo "  help       : Display this help message."
	@echo ""
	@echo "Individual existing keyboard targets:"
	@$(foreach kb,$(EXISTING_KEYBOARDS), printf "  %-15s: Build %s keyboard.\n" "$(kb)" "$(kb)";)
	@echo "Individual new keyboard targets:"
	@$(foreach kb,$(NEW_KEYBOARDS), printf "  %-15s: Build %s keyboard.\n" "$(kb)" "$(kb)";)

.PHONY: help
