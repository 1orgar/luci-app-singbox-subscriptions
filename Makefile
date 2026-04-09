include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-singbox-subscriptions
PKG_VERSION:=1.0.0
PKG_RELEASE:=1
LUCI_TITLE:=Singbox Subscriptions Manager
# LUCI_DEPENDS:=+luci-base +sing-box
LUCI_PKGARCH:=all
LUCI_LANG.ru:=Русский (Russian)
LUCI_LANG.en:=English

PKG_LICENSE:=GPL-2.0-or-later
LUCI_LANGUAGES:=en ru

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature