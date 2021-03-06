clean:
	python event_cleanup.py

create:
	python create_index.py

discover:
	python discovery.py

daily:
	make clean
	make discover
	make create

event_count:
	ls -l jsondump/ | wc -l

automatic:
	git pull
	make daily
	git add index.html
	git commit -m "daily run"
	git push
