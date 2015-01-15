################################################################################
#
# mosquitto
#
################################################################################

MOSQUITTO_VERSION = 1.3.5
MOSQUITTO_SOURCE = mosquitto-$(MOSQUITTO_VERSION).tar.gz
MOSQUITTO_SITE = http://mosquitto.org/files/source/$(MOSQUITTO_SOURCE)
MOSQUITTO_DEPENDENCIES = openssl zlib
MOSQUITTO_CONF_OPT = -DCMAKE_INSTALL_PREFIX=/usr


define MOSQUITTO_USERS
	mosquitto -1 mosquitto -1 * - - - mosquitto mqtt daemon
endef

$(eval $(cmake-package))
