#!/bin/sh
# disable mobian's MTP services since they break hybris-usb
systemctl disable umtp-responder
systemctl disable mobian-usb-gadget
