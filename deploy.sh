#!/bin/bash
set -e

# Get parameters
POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    -u|--username)
    USERNAME="$2"
    shift # past argument
    shift # past value
    ;;
    -h|--host)
    HOST="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

echo -e "\n🚀  STARTING DEPLOYMENT...\n"

echo -e "${USERNAME}@${HOST}\n"

# Move old build to folder with current date
ssh ${USERNAME}@${HOST} 'bash -e -s' <<'ENDSSH'
  if [ -d "./Desktop/Build" ]; then
    cd ./Desktop && mv Build Build-Old-$(date +"%Y-%m-%d-%H%M%S")
  fi
ENDSSH

# Copy Build data
scp -pr ./Build arco@172.21.35.171:./Desktop

# Echo deploy data in Build
ssh ${USERNAME}@${HOST} 'bash -e -s' <<'ENDSSH'
  cd ./Desktop/Build && echo $(date +"%Y-%m-%d %H:%M:%S") > deploy-date.txt
ENDSSH

if [[ $? != 0 ]]; then
  exit 1
fi

echo -e "\n🍀  ALL DONE\n"
