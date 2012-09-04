ifdef TARGET
	TARGET = $$TARGET
else
	TARGET = $$HOME
endif

diff:
	@if [ -n "$$file" ]; then \
		colordiff -u "$$file" "$(TARGET)/$$file" || echo; \
	else \
		FILES=`find . -path ./.git -prune -o -type f -print`; \
		for f in $$FILES; do \
			diff -q $$f $(TARGET)/$$f || echo; \
		done; \
	fi

install-vim: vim-vundle
	cp .vimrc $(TARGET)/
	cp -R .vim $(TARGET)/
	mkdir -p $(TARGET)/.vim/backupdir \
		$(TARGET)/.vim/swapdir \
		$(TARGET)/.vim/undodir

vim-vundle:
	git submodule update --init --recursive

install:
	@if [ -n "$$file" ]; then \
		cp -i "$$file" $(TARGET)/"$$file"; \
	else \
		echo "no file specified"; \
	fi
