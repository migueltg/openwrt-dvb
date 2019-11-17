PKG_NAME := v4l-dvb-tbsdtv

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/tbsdtv/media_build.git
PKG_SOURCE_VERSION := 91dc8972d37efdc12499530ce991cbe3cf3cd64a
PKG_SOURCE_DATE := 2019-09-13

V4L_SOURCE_URL := https://github.com/tbsdtv/linux_media.git
V4L_SOURCE_VERSION := 59b57115beb2195d7a0ed11323ca0ee9bf5d5679
V4L_REPO_NAME := linux-media-tbsdtv
V4L_SOURCE_FILE := $(V4L_REPO_NAME)-$(PKG_SOURCE_DATE)-$(shell printf '%.8s' $(V4L_SOURCE_VERSION)).tar.bz2

PATCH_DIR := patches-tbsdtv
