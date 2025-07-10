#!/bin/bash

delete_last() {
  # Get the name of the previous branch
  previous_branch=$(git rev-parse --abbrev-ref @{-1})

  # Check if we're on master branch
  current_branch=$(git rev-parse --abbrev-ref HEAD)
  if [ "$current_branch" != "master" ]; then
    echo "Error: You must be on master branch to run this script."
    exit 1
  fi

  # Check for --force flag
  if [ "$1" = "--force" ]; then
    delete_option="-D"
    echo "Force deleting branch: $previous_branch"
  else
    delete_option="-d"
    echo "Attempting to delete branch: $previous_branch"
  fi

  # Attempt to delete the previous branch
  if git branch $delete_option "$previous_branch"; then
    echo "Successfully deleted branch: $previous_branch"
  else
    echo "Failed to delete branch: $previous_branch"
    if [ "$delete_option" = "-d" ]; then
      echo "It may have unmerged changes. Use --force to force delete:"
      echo "delete_last --force"
    fi
  fi
}
