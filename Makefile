bootstrap:
	docker run \
		--rm \
		--privileged hypriot/qemu-register

build: bootstrap
	docker-compose build

clean: stop
	docker-compose rm -f

logs:
	docker-compose logs -f

start:
	docker-compose up -d

stop:
	docker-compose stop

flash:
	flash \
		--bootconf ./hypriot/no-uart-config.txt \
		--device /dev/mmcblk0 \
		--force \
		--hostname raspisms \
		--password survivant75 \
		--ssid RueDesGardes \
		--userdata ./hypriot/wifi-user-data.yml \
		https://github.com/hypriot/image-builder-rpi/releases/download/v1.11.4/hypriotos-rpi-v1.11.4.img.zip
