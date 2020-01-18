bootstrap:
	docker run \
		--rm \
		--privileged hypriot/qemu-register

build: bootstrap
	docker-compose build

clean: stop
	docker-compose rm -f

flash:
	flash \
		--bootconf ./etc/hypriot/no-uart-config.txt \
		--device /dev/sdg \
		--force \
		--password survivant75 \
		--ssid RueDesGardes \
		--userdata ./etc/hypriot/wifi-user-data.yml \
		https://github.com/hypriot/image-builder-rpi/releases/download/v1.11.4/hypriotos-rpi-v1.11.4.img.zip

logs:
	docker-compose logs -f

purge: clean
	docker volume rm raspisms_db

restart: stop start

start:
	docker-compose up --remove-orphans -d

stop:
	docker-compose stop
