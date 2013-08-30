# Author: Martin Grenfell [http://github.com/scrooloose]
# License:
#
#  This program is free software. It comes without any warranty, to
#  the extent permitted by applicable law. You can redistribute it
#  and/or modify it under the terms of the Do What The Fuck You Want
#  To Public License, Version 2, as published by Sam Hocevar. See
#  http://sam.zoy.org/wtfpl/COPYING for more details.
#
# This script hijacks calls to svn and adds color and pagination to
# some svn commands. Source it from your bashrc.
#
# colordiff must be installed.
#-------------------------------------------------------------------

case `uname` in
  Linux)
    SED=sed
    ;;
  Darwin)
    SED=gsed
    ;;
esac

# intercept calls to svn
svn () {

  # bail if the user didnt specify which subversion command to invoke
  if [ $# -lt 1 -o ! -t 1 ]; then
    command svn "$@"
    return
  fi

  local sub_cmd=$1
  shift

  # intercept svn diff commands
  if [ $sub_cmd == diff ]; then

    # colorize the diff
    # remove stupid ^M dos line endings
    # page it if there's more one screen
    command svn diff "$@" | colordiff | ${SED} -e 's/\r//g' | less -RF

  # add some color to svn status output and page if needed:
  # M = blue
  # A = green
  # D/!/~ = red
  # C = magenta
  #
  # note that C and M can be preceded by whitespace - see $svn help status
  elif [[ $sub_cmd =~ ^(status|st)$ ]]; then
    command svn status "$@" | ${SED} -e 's/^\(\([A-Z]\s\+\(+\s\+\)\?\)\?C .*\)$/\o33\[1;35m\1\o33[0m/' \
      -e 's/^\(\s*M.*\)$/\o33\[1;34m\1\o33[0m/' \
      -e 's/^\(A.*\)$/\o33\[1;32m\1\o33[0m/' \
      -e 's/^\(\(D\|!\|~\).*\)$/\o33\[1;31m\1\o33[0m/' | less -RF

  # page some stuff I often end up paging manually
  elif [[ $sub_cmd =~ ^(blame|help|h|cat)$ ]]; then
    command svn $sub_cmd "$@" | less -F

  # colorize and page svn log
  # rearrange the date field from:
  #  2010-10-08 21:19:24 +1300 (Fri, 08 Oct 2010)
  # to:
  #  2010-10-08 21:19 (Fri, +1300)
  elif [[ $sub_cmd == log ]]; then
    command svn log "$@" | ${SED} -e 's/^\(.*\)|\(.*\)| \(.*\) \(.*\):[0-9]\{2\} \(.*\) (\(...\).*) |\(.*\)$/\o33\[1;32m\1\o33[0m|\o33\[1;34m\2\o33[0m| \o33\[1;35m\3 \4 (\6, \5)\o33[0m |\7/' | less -RF

  # let svn handle it as normal
  else
    command svn $sub_cmd "$@"
  fi
}

# vi:sw=2:et:sts=2
