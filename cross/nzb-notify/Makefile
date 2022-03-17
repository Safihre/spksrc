PKG_NAME = nzb-notify
PKG_VERS = 1.0.0
PKG_EXT = tar.gz
PKG_DIST_NAME = v$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/caronc/$(PKG_NAME)/archive
PKG_DIST_FILE = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS =

HOMEPAGE = https://github.com/caronc/nzb-notify
COMMENT  = Usenet binary downloader
LICENSE  = GPL

INSTALL_TARGET = nzbnotify_install

include ../../mk/spksrc.install-resources.mk

# Need to replace the path to python in the shebang of sabnzbd-notify.py
nzbnotify_install:
	mkdir -p $(STAGING_INSTALL_PREFIX)/share/SABnzbd/scripts
	tar -cf - -C $(WORK_DIR)/$(PKG_DIR) . | tar -xf - -C $(STAGING_INSTALL_PREFIX)/share/SABnzbd/scripts
	sed -i '1s/\/usr\/bin/\/usr\/local/' $(STAGING_INSTALL_PREFIX)/share/SABnzbd/scripts/sabnzbd-notify.py
