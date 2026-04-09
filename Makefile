include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-singbox-subscriptions
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

LUCI_TITLE:=Singbox Subscriptions Manager
LUCI_DEPENDS:=+luci-base
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

# Обязательно пустая строка в конце
