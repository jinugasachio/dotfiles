gbdel() {
  command="git branch | grep -v '*'"
  for branch_name in "$@"; do
    command="${command} | grep -v ${branch_name}"
  done
  echo 'These branches will be deleted.'
  eval ${command}
  verify_execution
  if [ $? -eq 0 ] ; then
    command="${command} | xargs git branch -D"
    eval ${command}
  fi
}

verify_execution() {
  echo "Are you sure[y/n]"
  read answer
  case $answer in
    y)
    true
    ;;
    *)
    false
    ;;
  esac
}
