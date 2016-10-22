echo_one() {
  echo $1
}

echo_and_return_one() {
  echo $1
  return 1
}

echo_all() {
  echo $@
  if [[ $@ ]]; then
    echo "found an arg"
    return 1
  else
    echo "no args found"
    return 0
  fi
}
