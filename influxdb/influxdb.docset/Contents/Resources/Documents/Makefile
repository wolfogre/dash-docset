URL=$(shell yq read dashing.yaml url)
DOMAINS=$(shell yq read dashing.yaml domains)
LOGO=$(shell yq rean dashing.yaml logo)

html:
	# see https://www.linuxjournal.com/content/downloading-entire-web-site-wget
	rm -rf html
	mkdir -p html
	date "+%FT%T%z" > html/download_at.txt
	cd html && wget --recursive --no-clobber --page-requisites --html-extension --convert-links --restrict-file-names=windows --no-parent --domains $(DOMAINS) $(URL)

logo:
	rm -rf logo
	mkdir -p logo
	convert $(LOGO) -resize 32x32 logo/logo.png

build: html logo
	rm -rf *.docset
	yq read -j dashing.yaml | jq > dashing.json
	dashing build | grep -E "^Match"

