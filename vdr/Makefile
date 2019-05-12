#
# Copyright (C) 2011 OpenWrt.org
# Copyright (C) 2017-2018 Tomasz Maciej Nowak <tomek_n@o2.pl>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME := vdr
PKG_VERSION := 2.4.0
PKG_RELEASE := 1

PKG_SOURCE := vdr-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL := ftp://ftp.tvdr.de/vdr
#PKG_SOURCE_URL := ftp://ftp.tvdr.de/vdr/Developer
PKG_HASH := 93af49fe87048073dc38ef5e6c71e9704344d730f21c261afac69e3c937f8cce

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILE := COPYING

PKG_MAINTAINER := Tomasz Maciej Nowak <tomek_n@o2.pl>

PKG_INSTALL := 1

include $(INCLUDE_DIR)/package.mk

define Package/vdr
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := Video Disk Recorder
  URL := http://www.tvdr.de
  DEPENDS := +fontconfig +libcap +libfreetype +libjpeg +librt +libstdcpp +dejavu-fonts-ttf-DejaVuSans +libexecinfo
endef

define Package/vdr/description
 Video Disk Recorder (VDR) is a digital sat-receiver program using Linux and DVB technologies.
 It allows one to record MPEG2 streams, as well as output the stream to TV.
 It is also possible to watch DVDs (hardware accelerated) with some comfort and use an IR remote control.
endef

define Package/vdr-epgtableid0
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := Plugin for handling EPG events with 0x00 table id
  URL := http://www.tvdr.de
  DEPENDS := vdr
endef

define Package/vdr-skincurses
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := VDR curses(text) skin
  URL := http://www.tvdr.de
  DEPENDS := vdr +libncurses +libncursesw
endef

define Build/Configure
	(rm -fR $(PKG_BUILD_DIR)/PLUGINS/src/dvbhddevice \
		$(PKG_BUILD_DIR)/PLUGINS/src/dvbsddevice \
		$(PKG_BUILD_DIR)/PLUGINS/src/hello \
		$(PKG_BUILD_DIR)/PLUGINS/src/osddemo \
		$(PKG_BUILD_DIR)/PLUGINS/src/pictures \
		$(PKG_BUILD_DIR)/PLUGINS/src/rcu \
		$(PKG_BUILD_DIR)/PLUGINS/src/servicedemo \
		$(PKG_BUILD_DIR)/PLUGINS/src/status \
		$(PKG_BUILD_DIR)/PLUGINS/src/svdrpdemo)
endef

MAKE_FLAGS += \
	PREFIX="/usr" \
	VIDEODIR="/mnt/video" \
	CONFDIR="/etc/vdr" \
	CACHEDIR="/mnt/video"

TARGET_LDFLAGS += -lexecinfo

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

define Package/vdr/conffiles
/etc/vdr
endef

define Package/vdr/install
	$(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_FLAGS) DESTDIR=$(1) \
		install-dirs \
		install-bin \
		install-conf

	echo [vdr] > $(1)/etc/vdr/conf.d/00-vdr.conf

	$(INSTALL_DIR) $(1)/etc/vdr/plugins

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/vdr.init $(1)/etc/init.d/vdr

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/vdr.config $(1)/etc/config/vdr
endef

define Package/vdr-epgtableid0/install
	$(MAKE) -C $(PKG_BUILD_DIR)/PLUGINS/src/epgtableid0 $(MAKE_FLAGS) DESTDIR=$(1) install-lib

	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	echo [epgtableid0] > $(1)/etc/vdr/conf.d/01-epgtableid0.conf
endef

define Package/vdr-skincurses/install
	$(MAKE) -C $(PKG_BUILD_DIR)/PLUGINS/src/skincurses $(MAKE_FLAGS) DESTDIR=$(1) install-lib

	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	echo [skincurses] > $(1)/etc/vdr/conf.d/02-skincurses.conf
endef

$(eval $(call BuildPackage,vdr))
$(eval $(call BuildPackage,vdr-epgtableid0))
$(eval $(call BuildPackage,vdr-skincurses))
