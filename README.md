# bash_study

# [echo -e](https://github.com/TonyHo722/bash_study/blob/master/bash_builtins_read/echo-genfile.sh)
echo -e "one\ntwo\nthree\c" > file-double-quotes-e.txt

# [while read line](https://github.com/TonyHo722/bash_study/blob/master/bash_builtins_read/dumpline-all.sh)
while read line || [ -n "$line" ] ; do echo "$line" ; done < $1

# [set -xv](https://github.com/TonyHo722/bash_study/blob/master/bash_builtins_read/setxv.sh)
- debug

# [PS4](https://github.com/TonyHo722/bash_study/blob/master/ps4/ps4.sh)
- PS4='${LINENO}: '
  - debug by PS4

# [bashdb](https://github.com/TonyHo722/bash_study/tree/master/bashdb)
- bash --debugger ./fibonacci.sh
  - this is fail
