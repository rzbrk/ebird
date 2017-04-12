# Makefile for scrubbing

SCRB_SCRIPT	= /usr/local/bin/scrubbing
SCRB_CONF	= /etc/scrubbing.conf
SCRB_CRON	= /etc/crontab
SCRB_USER	= motion
SCRB_PERIOD	= 4

.PHONY: help install uninstall

help:
#        @echo "Please use make <target>, where <target> is one of"
#        @echo "  install       install scrubbing with default conf"
#        @echo "  uninstall     uninstall scrubbing"

install:
	cp config/scrubbing.conf $(SCRB_CONF)
	cp scripts/scrubbing $(SCRB_SCRIPT)
	echo "* */$(SCRB_PERIOD) * * * $(SCRB_USER) /usr/bin/nice \
	  -n 10 $(SCRB_SCRIPT)" >> $(SCRB_CRON)
	systemctl restart cron

uninstall:
	rm $(SCRB_SCRIPT)
	mv $(SCRB_CONF) $(SCRB_CONF).old
	cp $(SCRB_CRON) $(SCRB_CRON).old
	sed '/scrubbing/ s/^/# /' $(SCRB_CRON) > $(SCRB_CRON).tmp \
	  && mv $(SCRB_CRON).tmp $(SCRB_CRON)
	systemctl restart cron

