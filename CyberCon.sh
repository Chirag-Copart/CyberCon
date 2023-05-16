#!/bin/bash
echo "
   ____           _                      ____                 
  / ___|  _   _  | |__     ___   _ __   / ___|   ___    _ __  
 | |     | | | | | '_ \   / _ \ | '__| | |      / _ \  | '_ \ 
 | |___  | |_| | | |_) | |  __/ | |    | |___  | (_) | | | | |
  \____|  \__, | |_.__/   \___| |_|     \____|  \___/  |_| |_|
          |___/                                               

                   -- by CHIRAG PRAJAPATI
"

help(){
  echo "
Usage: ./CyberCon.sh [options] -d domain.com
Options:
    -h            Display this help message.
    -d            Specify the domain to scan.
  Target:
    

Example:
    ./CyberCon.sh -d copart.com
"
}

POSITIONAL=()

if [[ "$*" != *"-d"* ]]
then
	help
  exit
fi

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -h|--help)
    help
    exit
    ;;
    -d|--domain)
    d="$2"
    shift
    shift
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

echo "Started Working on your Project:  $d"

echo "Creating directory"
set -e
if [ ! -d $PWD/CyberCon ]; then
	mkdir CyberCon
fi
if [ ! -d $PWD/CyberCon/$d ]; then
	mkdir CyberCon/$d
fi
source tokens.txt

echo "Starting our subdomain enumeration force..."



echo "Starting DirSearch"
if [ ! -d $PWD/CyberCon/$d/dirsearch ]; then
	mkdir CyberCon/$d/dirsearch
fi
cd dirsearch/
#python3  dirsearch.py -e php,asp,aspx,jsp,html,zip,jar -w db/dicc.txt -t 80 -u $d | tee $d.txt
python3 dirsearch.py -u $d -e php,asp,aspx,jsp,html,zip,jar -w db/dicc.txt -t 80 -o $d.txt
cd ..

echo "Starting LinkFInder"
cd LinkFinder/
pip3 install -r requirements.txt
python linkfinder.py -i https://$d -d -o results.html
cd ..

echo "Starting Nuclei"
echo $d | nuclei 

echo "Starting CLRFUZZ"
crlfuzz -u https://$d -o results.txt

#echo "Starting CMSmap"
#cd CMSmap/
#python cmsmap.py -u $d -o results.txt
#cd ..

echo "Notifying you on slack"
curl -X POST -H 'Content-type: application/json' --data '{"text":"CyberCon finished scanning: '$d'"}' $slack_url

echo "Finished successfully."
