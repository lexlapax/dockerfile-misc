################################################################################
#
# mosquitto
#
################################################################################

MOSQUITTO_VERSION = 1.2.3
MOSQUITTO_SOURCE = mosquitto-$(MOSQUITTO_VERSION).tar.gz
MOSQUITTO_SITE = http://mosquitto.org/files/source/$(MOSQUITTO_SOURCE)
MOSQUITTO_DEPENDENCIES = openssl zlib
MOSQUITTO_CONF_OPT = -DCMAKE_INSTALL_PREFIX=/usr


$(eval $(cmake-package))
