# Makefile for lighttpd installation/config


.PHONY: help install uninstall disable test

help:
	@echo "Please use 'make <target>', where <target> is one of"
	@echo "  install	install/configure wlan access point"
	@echo "  uninstall	uninstall wlan access point"
	@echo "  disable	disable wlan access point"
	@echo

install:
	apt-get update && apt-get install hostapd dnsmasq
	# install iptables
	# configure network
	# dnsmasq conf
	# hostapd conf
	# iptables conf
	systemctl enable dnsmasq
	systemctl enable hostapd 
	systemctl restart dnsmasq
	systemctl restart hostapd

uninstall:
	systemctl stop hostapd
	systemctl stop dnsmasq
	systemctl disable hostapd
	systemctl disable dnsmasq

disable:

test:

