#!/bin/bash

while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo "$package - attempt to capture full details"
      echo " "
      echo "options:"
      echo "-h, --help                show brief help"
      echo "-t=ACTION, --tag=ACTION   specify specific task to execute in plabook, using the attached tag."
      echo "-st, --show-tags          show all available tags in playbook."
      echo "-a, --all                 execute all tasks in the playbook."
      exit 0
      ;;
     -t| --tags)
         if [ "$2" ]; then
            tags=$2
             ./run_report $tags false
              shift
              else
                   echo 'ERROR: "-t | --tags" requires a non-empty option argument.'
                  exit 1
              fi
               shift
              ;;

     --skip-tags)
         if [ "$2" ]; then
            skip_tags=$2
             ./run_report false $skip_tags
              shift
              else
                   echo 'ERROR: "--skip-tags" requires a non-empty option argument.'
                  exit 1
              fi
               shift
              ;;

    -a| --all)
      ./run_report all
      shift
      ;;

      "")
        echo "empty space"
        ./run_report all
        shift
        ;; 

    -st| --show-tags)
      echo "playbook can be executed for any of the tags attached to a task."
      echo "to run the entire tasks in the playbook, use the option: tag=all, else replace all with any of the below tags to run specific report."
      ./list_tags.sh
      shift
      ;;
    *)
        if test $# = 0 ; then
          #./run_report
          empty string
      else
      echo "Invalid option entered"
      exit 1
       fi 
      break
      ;;
  esac
done
