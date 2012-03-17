diff:
	for file in `find . -path ./.git -prune -o -type f -print`; \
		do diff -u $$file ~/$$file; \
	done
