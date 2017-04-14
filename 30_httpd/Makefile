# Makefile for lighttpd installation/config

EBIRD_CAM_DIR	= /home/pi/cam
EBIRD_HTML	= /var/www/html/

.PHONY: help install uninstall test

help:
	@echo "Please use 'make <target>', where <target> is one of"
	@echo "  install	install/configure lighttpd"
	@echo "  uninstall	deactivate lighttpd"
	@echo

install:
	apt-get update && apt-get install lighttpd python
	cp -r html/* $(EBIRD_HTML)*
#	if [ ! -d $(EBIRD_CAM_DIR) ]; then mkdir $(EBIRD_CAM_DIR); fi
#	chgrp motion $(EBIRD_CAM_DIR)
	ln -s $(EBIRD_CAM_DIR) $(EBIRD_HTML)cam
	cp -r lighttpd-conf /etc/lighttpd/conv-enabled/.
	lighty-enable-mod accesslog
	lighty-enable-mod fastcgi
	systemctl enable lighttpd
	systemctl restart lighttpd

uninstall:
	systemctl stop lighttpd
	systemctl disable lighttpd
	cp -r $(EBIRD_HTML) $(EBIRD_HTML)_old

test:

