html:
	# see https://www.linuxjournal.com/content/downloading-entire-web-site-wget
	rm -rf html
	mkdir -p html
	cd html && wget --recursive --no-clobber --page-requisites --html-extension --convert-links --restrict-file-names=windows  --no-parent --domains docs.influxdata.com https://docs.influxdata.com/influxdb/v1.7/query_language/ || true

logo:
	rm -rf logo
	mkdir -p logo
	convert html/docs.influxdata.com/img/favicon.ico -resize 32x32 logo/logo.png

build: html logo
	rm -rf influxql.docset
	dashing build inflxuql

