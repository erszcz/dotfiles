ifdef TARGET
	TARGET = $$TARGET
else
	TARGET = $$HOME
endif

diff:
	@if [ -n "$$file" ]; then \
		FILES=$$file; \
	else \
		FILES=`find . -path ./.git -prune -o -type f -print`; \
	fi; \
	for f in $$FILES; do \
		diff -u $$f $(TARGET)/$$f || echo; \
	done
