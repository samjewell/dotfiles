# Kudos to @gareth for a one-line solution here!
last_test() {
  git status -s test/**/*_test.rb | head -n 1 | awk '{ print $2 }' | xargs -I {} ruby -I lib:test {} $=@
}

test_files_changed() {
  TESTFILESCHANGED=$(gst -s test/**/*_test.rb | awk '{ print $2 }')
  echo "${TESTFILESCHANGED}"
}

test_one_file() {
  # Argument is "test_file_name.rb"
  echo -e "\e[95mnow running\e[0m"
  echo "rake test TEST=$1"
  echo ""
  rake test TEST=$1
}

test_one_method() {
  # Arguments are "test_file_name.rb" and "method_performs_as_desired"
  echo -e "\e[95mnow running\e[0m"
  echo "rake test $1 TESTOPTS='--name=/$2/ -v'"
  echo ""
  rake test $1 TESTOPTS="--name=/$2/ -v"
}

test_em_all() {
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

dubquotes() {
  # dqm is Double Quoted Messages
  # Firts run Haml-lint, and store the errors
  dqm=$(haml-lint app/views/ | grep "Prefer double-quoted strings")
#   dqm="app/views/write_x_essay_words_tasks/edit.html.haml:8 [W] RuboCop: Style/StringLiterals: Prefer double-quoted strings unless you need single quotes to avoid extra backslashes for escaping. (https://www.viget.com/articles/just-use-double-quoted-ruby-strings)
# app/views/write_x_essay_words_tasks/edit.html.haml:14 [W] RuboCop: Style/StringLiterals: Prefer double-quoted strings unless you need single quotes to avoid extra backslashes for escaping. (https://www.viget.com/articles/just-use-double-quoted-ruby-strings)"

  # echo ${dqm} > "dqm.txt"

  # Clean up the errors, so we just store file names and line numbers
  dq=$(echo $dqm | grep -Eo "app/views/.*html.haml:..")
  # dq="app/views/write_x_essay_words_tasks/edit.html.haml:14"

  # echo ${dq} > "dq.txt"

  # Loop over the files, passing their names and numbers into sed:
  while read -r line; do
    echo "running sed for item:"
    lineno=$(echo $line | grep -Eo "[0-9]*$")
    filename=$(echo $line | grep -Eo "app/views/.*html.haml")
    echo "... ${lineno} on ${filename} ..."
    sed -Ei.tmp "${lineno}s_'_\"_g" ${filename}
  done <<< "$dq"
}