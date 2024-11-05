ifdef TARGET
	TARGET = $$TARGET
else
	TARGET = $$HOME
endif

.PHONY: diff
diff:
	@if [ -n "$$file" ]; then \
		colordiff -u "$$file" "$(TARGET)/$$file" || echo; \
	else \
		FILES=`find . -path ./.git -prune -o -type f -print`; \
		for f in $$FILES; do \
			diff -q $$f $(TARGET)/$$f || echo; \
		done; \
	fi

.PHONY: install-beep
install-beep: $(TARGET)/.local/share/beep/beep-07.wav $(TARGET)/bin/beep

$(TARGET)/bin/beep: bin/beep
	mkdir -p $(shell dirname $@)
	cp $< $@

$(TARGET)/.local/share/beep/beep-07.wav: .local/share/beep/beep-07.wav
	mkdir -p $(shell dirname $@)
	cp $< $@

.PHONY: install-vim
install-vim: vim-vundle
	cp .vimrc $(TARGET)/
	cp -R .vim $(TARGET)/
	mkdir -p $(TARGET)/.vim/backupdir \
		$(TARGET)/.vim/swapdir \
		$(TARGET)/.vim/undodir
	mkdir -p $(TARGET)/.config/nvim
	cp .config/nvim/init.vim $(TARGET)/.config/nvim/

.PHONY: vim-vundle
vim-vundle:
	mkdir -p .vim/bundle
	cd .vim/bundle && git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git vundle

.PHONY: install
install:
	@if [ -n "$$file" ]; then \
		cp -i "$$file" $(TARGET)/"$$file"; \
	else \
		echo "no file specified"; \
	fi
