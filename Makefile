# Stow dotfiles management
STOW_PACKAGES = git zsh tmux vim nvim ipython
TEST_HOME = /tmp/dotfiles-test

test-dry-run:
	@echo "Testing stow packages (dry run)..."
	@mkdir -p $(TEST_HOME)
	@for package in $(STOW_PACKAGES); do \
		if [ -d "stow/$$package" ]; then \
			echo "\n=== Testing $$package package ==="; \
			stow -d stow -t $(TEST_HOME) $$package --simulate --verbose=2; \
		fi; \
	done
	@echo "\nDry run complete. Check $(TEST_HOME) for expected file structure."

test-install:
	@echo "Installing stow packages to test directory..."
	@mkdir -p $(TEST_HOME)
	@for package in $(STOW_PACKAGES); do \
		if [ -d "stow/$$package" ]; then \
			echo "Installing $$package package to $(TEST_HOME)"; \
			stow -d stow -t $(TEST_HOME) $$package --verbose=2; \
		fi; \
	done
	@echo "\nTest install complete. Files created in $(TEST_HOME)"

test-clean:
	@echo "Cleaning test directory..."
	@rm -rf $(TEST_HOME)
	@echo "Test directory cleaned."

install:
	@echo "Installing dotfiles with stow..."
	@for package in $(STOW_PACKAGES); do \
		if [ -d "stow/$$package" ]; then \
			echo "Installing $$package package"; \
			stow -d stow -t ~ $$package --verbose=2; \
		fi; \
	done

uninstall:
	@echo "Removing dotfiles symlinks..."
	@for package in $(STOW_PACKAGES); do \
		if [ -d "stow/$$package" ]; then \
			echo "Removing $$package package"; \
			stow -d stow -t ~ $$package --delete --verbose=2; \
		fi; \
	done

# Legacy targets (kept for compatibility)
update-subtrees:
	git subtree pull --prefix vim https://github.com/abraithwaite/dotvim.git master --squash

update-submodules:
	git submodule update --init --recursive

.PHONY: test-dry-run test-install test-clean install uninstall update-subtrees update-submodules
