# Kudos to @gareth for a one-line solution here!
last_test() {
  git status -s test/**/*_test.rb | head -n 1 | awk '{ print $2 }' | xargs -I {} ruby -I lib:test {} $=@
}

test_files_changed() {
  # Returns all ruby test files in repo that have git changes
  TESTFILESCHANGED=$(gst -s test/**/*_test.rb | awk '{ print $2 }')
  echo "${TESTFILESCHANGED}"
}

test_one_file() {
  # Argument is "test_file_name.rb"
  echo -e "\e[95mnow running\e[0m"
  echo "rake test $1"
  echo ""
  rake test $1
}

test_one_method() {
  # Arguments are "test_file_name.rb" and "test_method_text"
  echo -e "\e[95mnow running\e[0m"
  echo "rake test $1 TESTOPTS='--name=/$2/ -v'"
  echo ""
  rake test $1 TESTOPTS="--name=/$2/ -v"
}

test_em_all() {
  # Runs all ruby test files in repo that have git changes
  # Optional argument is "test_method_text"
  echo -e "\e[95mnow running\e[0m"
  if [[ $1 ]]; then
    test_files_changed | xargs -I {} echo "rake test" {} "TESTOPTS='--name=/$1/ -v'"
    echo ""
    test_files_changed | xargs -I {} rake test {} TESTOPTS="--name=/$1/ -v"
  else
    test_files_changed | xargs -I {} echo "rake test" {}
    echo ""
    test_files_changed | xargs -I {} rake test {}
  fi
}