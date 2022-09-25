#!/bin/bash

while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo "$package - attempt to capture frames"
      echo " "
      echo "options:"
      echo "-h, --help                show brief help"
      echo "-t=ACTION, --tag=ACTION   specify specific task to execute in plabook, using the attached tag."
      echo "-st, --show-tags          show all available tags in playbook."
      echo "-a, --all                 execute all tasks in the playbook."
      exit 0
      ;;
    -a| --all)
      shift
      if test $# -gt 0; then
        export PROCESS=$1
      else
        echo "no process specified"
        exit 1
      fi
      shift
      ;;
    -o)
      shift
      if test $# -gt 0; then
        export OUTPUT=$1
      else
        echo "no output dir specified"
        exit 1
      fi
      shift
      ;;
    -st| --show-tags)
      echo "playbook can be executed for any of the tags attached to a task."
      echo "to run the entire tasks in the playbook, use the option: tag=all, else replace all with any of the below tags to run specific report."
      ./list_tags.sh
      shift
      ;;
    *)
      break
      ;;
  esac
done
