.PHONY: build check serve

build:
	hugo

serve:
	hugo server --disableFastRender

check:
	hugo && lychee --output static/dead_links.json --format json --exclude "\.css$" public/ && hugo
