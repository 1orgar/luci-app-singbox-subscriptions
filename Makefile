include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-singbox-subscriptions
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=Singbox Subscriptions Manager
  DEPENDS:=+luci-base
  PKGARCH:=all
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(CP) ./root/usr/share/luci/menu.d/* $(1)/usr/share/luci/menu.d/
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(CP) ./root/usr/share/rpcd/acl.d/* $(1)/usr/share/rpcd/acl.d/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./root/usr/bin/singbox-update $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/config
	$(CP) ./root/etc/config/singbox_subscriptions $(1)/etc/config/
	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/singbox
	$(CP) ./htdocs/luci-static/resources/view/singbox/*.js $(1)/www/luci-static/resources/view/singbox/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
