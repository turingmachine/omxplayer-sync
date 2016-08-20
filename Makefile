deploy:
	scp omxplayer-sync root@192.168.2.100:/usr/bin/omxplayer-sync
	scp omxplayer-sync root@192.168.2.102:/usr/bin/omxplayer-sync

watch: deploy watchloop

watchloop:
	while inotifywait -e close_write omxplayer-sync; do make deploy; done

default: deploy
