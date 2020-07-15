database-backup:
	echo "balena exec \$$(balena container ls -q -f label=io.balena.service-name=db) sh -c 'mysqldump -v -A -proot '; exit;" | balena ssh 383cfedf0b9abc42213e35d246971d93 | tee ./tusci/snapshot_$$(date +"%Y%m%d_%s").sql 1>/dev/null
