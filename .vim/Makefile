all: cscope.out system_tags

cscope.out: cscope.files
	cscope -b

cscope.files:
	ls -1 /usr/include/*.h > cscope.files

system_tags: cscope.files
	if [ -f $@ ]; then rm -f $@; fi
	xargs -n100 ctags -f $@ -a < cscope.files

# vim: noet
