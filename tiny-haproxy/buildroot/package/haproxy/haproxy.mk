################################################################################
#
# haproxy
#
################################################################################

HAPROXY_VERSION = 1.4.24
HAPROXY_SOURCE = haproxy-$(HAPROXY_VERSION).tar.gz
HAPROXY_SITE = http://haproxy.1wt.eu/download/1.4/src
HAPROXY_DEPENDENCIES = pcre

#HAPROXY_MAKE_OPT = TARGET=lin2628 CPU=$(BR2_ARCH) USE_STATIC_PCRE=1

HAPROXY_LIB_GCC_OPT = -I$(@D)/include -I$(@D)/ebtree -Wall -O2 -g -fno-strict-aliasing -DENABLE_POLL -DCONFIG_HAPROXY_VERSION=\"$(HAPROXY_VERSION)\" -DCONFIG_HAPROXY_DATE=\"2013/06/17\"

HAPROXY_MAIN_GCC_OPT = -I$(@D)/include -I$(@D)/ebtree -Wall -O2 -g -fno-strict-aliasing -DENABLE_POLL -DCONFIG_HAPROXY_VERSION=\"$(HAPROXY_VERSION)\" -DCONFIG_HAPROXY_DATE=\"2013/06/17\" -DBUILD_TARGET='"lin2628"' -DBUILD_ARCH='""' -DBUILD_CPU='"generic"' -DBUILD_CC='"gcc"' -DBUILD_CFLAGS='"-O2 -g -fno-strict-aliasing"' -DBUILD_OPTIONS='"USE_POLL=default"'

# this is a long drawn out #hack just to make it work for my circumstances... 
# it works for me because of the choices i made, 
# but is not the right way to to do buildroot packages

define HAPROXY_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_MAIN_GCC_OPT) -c -o $(@D)/src/haproxy.o $(@D)/src/haproxy.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/sessionhash.o $(@D)/src/sessionhash.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/base64.o $(@D)/src/base64.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/protocols.o $(@D)/src/protocols.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/uri_auth.o $(@D)/src/uri_auth.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/standard.o $(@D)/src/standard.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/buffers.o $(@D)/src/buffers.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/log.o $(@D)/src/log.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/task.o $(@D)/src/task.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/time.o $(@D)/src/time.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/fd.o $(@D)/src/fd.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/pipe.o $(@D)/src/pipe.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/regex.o $(@D)/src/regex.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/cfgparse.o $(@D)/src/cfgparse.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/server.o $(@D)/src/server.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/checks.o $(@D)/src/checks.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/queue.o $(@D)/src/queue.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/client.o $(@D)/src/client.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/proxy.o $(@D)/src/proxy.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/stick_table.o $(@D)/src/stick_table.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/proto_uxst.o $(@D)/src/proto_uxst.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/proto_http.o $(@D)/src/proto_http.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/stream_sock.o $(@D)/src/stream_sock.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/appsession.o $(@D)/src/appsession.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/backend.o $(@D)/src/backend.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/lb_chash.o $(@D)/src/lb_chash.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/lb_fwlc.o $(@D)/src/lb_fwlc.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/lb_fwrr.o $(@D)/src/lb_fwrr.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/lb_map.o $(@D)/src/lb_map.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/stream_interface.o $(@D)/src/stream_interface.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/dumpstats.o $(@D)/src/dumpstats.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/proto_tcp.o $(@D)/src/proto_tcp.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/session.o $(@D)/src/session.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/hdr_idx.o $(@D)/src/hdr_idx.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/ev_select.o $(@D)/src/ev_select.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/signal.o $(@D)/src/signal.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/acl.o $(@D)/src/acl.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/pattern.o $(@D)/src/pattern.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/memory.o $(@D)/src/memory.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/freq_ctr.o $(@D)/src/freq_ctr.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/auth.o $(@D)/src/auth.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/src/ev_poll.o $(@D)/src/ev_poll.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/ebtree/ebtree.o $(@D)/ebtree/ebtree.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/ebtree/eb32tree.o $(@D)/ebtree/eb32tree.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/ebtree/eb64tree.o $(@D)/ebtree/eb64tree.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/ebtree/ebmbtree.o $(@D)/ebtree/ebmbtree.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/ebtree/ebsttree.o $(@D)/ebtree/ebsttree.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/ebtree/ebimtree.o $(@D)/ebtree/ebimtree.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) $(HAPROXY_LIB_GCC_OPT) -c -o $(@D)/ebtree/ebistree.o $(@D)/ebtree/ebistree.c
	$(TARGET_MAKE_ENV) $(TARGET_CC) -g -o $(@D)/haproxy $(@D)/src/haproxy.o $(@D)/src/sessionhash.o $(@D)/src/base64.o $(@D)/src/protocols.o $(@D)/src/uri_auth.o $(@D)/src/standard.o $(@D)/src/buffers.o $(@D)/src/log.o $(@D)/src/task.o $(@D)/src/time.o $(@D)/src/fd.o $(@D)/src/pipe.o $(@D)/src/regex.o $(@D)/src/cfgparse.o $(@D)/src/server.o $(@D)/src/checks.o $(@D)/src/queue.o $(@D)/src/client.o $(@D)/src/proxy.o $(@D)/src/stick_table.o $(@D)/src/proto_uxst.o $(@D)/src/proto_http.o $(@D)/src/stream_sock.o $(@D)/src/appsession.o $(@D)/src/backend.o $(@D)/src/lb_chash.o $(@D)/src/lb_fwlc.o $(@D)/src/lb_fwrr.o $(@D)/src/lb_map.o $(@D)/src/stream_interface.o $(@D)/src/dumpstats.o $(@D)/src/proto_tcp.o $(@D)/src/session.o $(@D)/src/hdr_idx.o $(@D)/src/ev_select.o $(@D)/src/signal.o $(@D)/src/acl.o $(@D)/src/pattern.o $(@D)/src/memory.o $(@D)/src/freq_ctr.o $(@D)/src/auth.o $(@D)/src/ev_poll.o $(@D)/ebtree/ebtree.o $(@D)/ebtree/eb32tree.o $(@D)/ebtree/eb64tree.o $(@D)/ebtree/ebmbtree.o $(@D)/ebtree/ebsttree.o $(@D)/ebtree/ebimtree.o $(@D)/ebtree/ebistree.o   
endef

define HAPROXY_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/haproxy $(TARGET_DIR)/usr/sbin/haproxy
endef

$(eval $(generic-package))



