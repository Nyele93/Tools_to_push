#!/bin/bash

        BASE_DIR=/etc/mariadb_rdba/mariadb_tool
        CONFIGNAME=deploy.conf
        CONFIGFILE=$BASE_DIR/$CONFIGNAME
        token_key=`cat .token_key`

req_pckg="git ansible"
which $req_pckg > /dev/null 2>&1
if [ $? == 0 ]
then
echo "Prerequisite packages: [$req_pckg] already installed. Proceeding with setup"
else 
   echo "Prerequisite packages not installed. Kindly install below packages to proceed:"
   echo "[+] git"
   echo "[+] ansible" 

   exit 1
fi


install_tool(){
     if [ ! -d $BASE_DIR ]; then 
        mkdir -p $BASE_DIR
        cd $BASE_DIR
        git clone https://$token_key@github.com/Nyele93/Tools_to_push.git

        echo "Setup Process completed. please confirm files in $BASE_DIR and adjust config file accordingly."
    else 
           echo "Installation already existing. Check base directory: $BASE_DIR" 
    fi 
}

cleanup_dir(){
     rm -f $BASE_DIR/Tools_to_push/setup.sh
     rm -f $BASE_DIR/Tools_to_push/README.md
}

install_tool;
cleanup_dir;

exit 0
