#!/bin/bash

URL=""
AVATAR="https://avatars.githubusercontent.com/u/1821794?v=4"
TITLE="Nick's Bot Test"
MESSAGE="This message came from the Bot."

display_help()
{
   echo "Usage: ./run.sh [options...]"
   echo "-u, --url            The url of webhook (requirement)"
   echo "--avatar             The url of avatar"
   echo "-t, --title          The title"
   echo "-m, --message        The message"
   echo "-h, --help           Get help for commands (requirement)"
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
      "--avatar")
         AVATAR=$2
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

curl -X POST $URL \
-H 'Content-Type: application/json' \
-d "{ \"avatar_url\": \"$AVATAR\", \"username\": \"$TITLE\", \"content\": \"$MESSAGE\" }"
