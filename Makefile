include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-singbox-subscriptions
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

LUCI_TITLE:=Singbox Subscriptions Manager
LUCI_DEPENDS:=+luci-base +sing-box
LUCI_PKGARCH:=all

define Package/$(PKG_NAME)/conffiles
/etc/config/singbox_subscriptions
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
