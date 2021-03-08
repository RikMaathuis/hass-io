#!/usr/bin/with-contenv bashio
declare -a options
bashio::log.info 'Starting the Music daemon...'
echo "starting!"
/bin/sh -c "chmod u+s /dev/vchiq"
bashio::log.info 'fuckk'
#else msg='/bin/sh -c "chmod u+s /dev/vchiq"';
# Read from STDIN aliases to play  file
while read -r input; do
    # removing JSON stuff
    input="$(echo "$input" | jq --raw-output '.')"
	
    echo "[Info] Read alias: $input"
	
    if ! msg="$(omxplayer -o local $input)"; then
    	echo "[Error] Playing failed -> $msg"
    fi
done