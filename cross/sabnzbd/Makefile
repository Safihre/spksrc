PKG_NAME = SABnzbd
REPO_NAME = sabnzbd
PKG_VERS = 3.6.0-develop
PKG_EXT = tar.gz
PKG_DOWNLOAD_METHOD = git
PKG_GIT_HASH = 4b41eca8df480b3eef759455e75ad964949fc88e
PKG_DIST_SITE = https://github.com/sabnzbd/$(REPO_NAME).git
PKG_DIST_FILE = $(PKG_NAME)-git$(PKG_GIT_HASH).$(PKG_EXT)
PKG_DIR = $(PKG_NAME)-git$(PKG_GIT_HASH)

DEPENDS =

HOMEPAGE = https://sabnzbd.org
COMMENT  = Usenet binary downloader
LICENSE  = GPL

INSTALL_TARGET = sabnzbd_install

include ../../mk/spksrc.install-resources.mk

# The tests and po folders take 5MB of space and is not used
# Need to replace the path to python in the shebang of Deobfuscate.py
sabnzbd_install:
	mkdir -p $(STAGING_INSTALL_PREFIX)/share/SABnzbd
	tar -cf - -C $(WORK_DIR)/$(PKG_DIR) . | tar -xf - -C $(STAGING_INSTALL_PREFIX)/share/SABnzbd
	rm -rf $(STAGING_INSTALL_PREFIX)/share/SABnzbd/tests
	rm -rf $(STAGING_INSTALL_PREFIX)/share/SABnzbd/po
