include $(TOPDIR)/rules.mk

LUCI_TITLE:=Singbox Subscription Manager
LUCI_DEPENDS:=+luci-base +sing-box
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk