#!/bin/bash

URL=""
TITLE="Alert"
MESSAGE="The description of alert"
USERNAME="Discord Bot"
TAG=""
AVATAR=""
COLOR=15844367

display_help()
{
   echo "Usage: ./run.sh [options...]"
   echo "-u, --url            The url of webhook (requirement)"
   echo "-t, --title          The title"
   echo "-m, --message        The message (requirement)"
   echo "-h, --help           Get help for commands"
   echo
   echo
   echo "--username           The name of Bot"
   echo "--tag                For user mentions"
   echo "--avatar             The url of avatar"
   echo "--color              The integer of color, default is gold(15844367)"
   echo
   exit 1
}

while :
do
   case "$1" in
      "-u" | "--url")
         URL=$2
         shift 2
         ;;
      "-t" | "--title")
         TITLE=$2
         shift 2
         ;;
      "-m" | "--message")
         MESSAGE=$2
         shift 2
         ;;
      "-h" | "--help")
         display_help
         exit 0
         ;;
      "--username")
         USERNAME=$2
         shift 2
         ;;
      "--tag")
         TAG=$2
         shift 2
         ;;
      "--avatar")
         AVATAR=$2
         shift 2
         ;;
      "--color")
         COLOR=$2
         shift 2
         ;;
      -*)
          echo "Error: Unknown option: $1" >&2
          echo "try './run.sh --help' for more information"
          exit 1 
          ;;
      *) # No more options
         break
         ;;
   esac
done

if [ -z "$URL" ]
then 
    display_help
    exit 1
fi

OBJ="{\"title\":\"$TITLE\", \"type\": \"rich\", \"color\": $COLOR, \"description\": \"$MESSAGE\"}"
curl -X POST $URL \
-H 'Content-Type: application/json' \
-d "{ \"avatar_url\": \"$AVATAR\", \"username\": \"$USERNAME\", \"content\": \"$TAG\", \"embeds\": [$OBJ] }"
