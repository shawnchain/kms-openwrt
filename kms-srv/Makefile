#
# Copyright (C) 2019 Tony Feng <fengtons@gmail.com>
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=kms-srv
PKG_VERSION:=20250101
PKG_RELEASE:=1

PKG_MAINTAINER:=Anonymous
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/shawnchain/kms-srv
PKG_SOURCE_VERSION:=main
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/kms-srv
	SECTION:=net
	CATEGORY:=Network
	TITLE:=kmsd for OpenWRT
	URL:=http://github.com/
	DEPENDS:=+libpthread
endef

define Package/kms-srv/description
	kmsd is a KMS Emulator in C.
endef

define Package/kms-srv/postrm
#!/bin/sh
. /lib/functions.sh

remove_srvhost() {
    local section=$1
    [ "${section%%_*}" = "kmsd" ] && uci_remove dhcp "$section"
}

config_load dhcp
config_foreach remove_srvhost srvhost
uci_commit dhcp
/etc/init.d/dnsmasq reload
exit 0
endef

define Package/kms-srv/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/vlmcs $(1)/usr/bin/kmsc
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/vlmcsd $(1)/usr/bin/kmsd

	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) ./files/etc/kms/kmsd.ini $(1)/etc/kmsd.ini

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/etc/config/kmsd $(1)/etc/config/kmsd

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/kmsd $(1)/etc/init.d/kmsd
endef

$(eval $(call BuildPackage,kms-srv))
