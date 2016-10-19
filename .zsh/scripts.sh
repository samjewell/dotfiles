#!/bin/sh

# Kudos to @gareth for a one-line solution here!
last_test() {
  git status -s test/**/*_test.rb | head -n 1 | awk '{ print $2 }' | xargs -I {} ruby -I lib:test {} $=@
}

testit() {
  TESTFILESCHANGED=($(gst --porcelain | grep -Eo "test.*"))  # (..) = array

  echo "these test files have uncommitted changes:"
  echo -e "\e[95m${TESTFILESCHANGED}\e[0m"
  echo ""

  echo -e "Now running \e[95mrake test ${TESTFILESCHANGED[1]}\e[0m"
  rake test ${TESTFILESCHANGED[1]}
}

testSAM() {
  TESTFILESCHANGED=($(gst --porcelain | grep -Eo "test.*"))  # (..) = array

  echo "these test files have uncommitted changes:"
  echo -e "\e[95m${TESTFILESCHANGED}\e[0m"
  echo ""

  # TODO: Pass "SAM" as an argument, and merge this with testit()
  echo -e "Now running \e[95mruby -I lib:test ${TESTFILESCHANGED[1]} -n /SAM/\e[0m"

  ruby -I lib:test ${TESTFILESCHANGED[1]} -n /SAM/
}

dubquotes() {
  set -e

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