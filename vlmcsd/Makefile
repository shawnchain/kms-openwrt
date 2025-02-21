include $(TOPDIR)/rules.mk

PKG_NAME:=vlmcsd
PKG_VERSION:=20250101
PKG_RELEASE:=2

PKG_MAINTAINER:=anonymous <anonymous@gmail.com>
PKG_LICENSE:=SHIT
PKG_LICENSE_FILES:=LICENSE

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/shawnchain/kms-srv
PKG_SOURCE_VERSION:=main
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/vlmcsd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=vlmcsd for OpenWRT
  DEPENDS:=+libpthread
endef

define Package/vlmcsd/description
  vlmcsd is a KMS Emulator in C.
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	rm $(PKG_BUILD_DIR)/GNUmakefile
endef

define Package/vlmcsd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/vlmcsd $(1)/usr/bin/vlmcsd
	$(INSTALL_DIR) $(1)/etc/vlmcsd
	$(INSTALL_BIN) ./files/vlmcsd.ini $(1)/etc/vlmcsd/vlmcsd.ini
endef

$(eval $(call BuildPackage,vlmcsd))
