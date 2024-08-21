PKG_NAME = par2cmdline-turbo
PKG_VERS = 1.1.1
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-v$(PKG_VERS)-src.$(PKG_EXT)
PKG_DIST_SITE = https://github.com/animetosho/par2cmdline-turbo/archive/v$(PKG_VERS)
PKG_DIST_FILE = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS =

HOMEPAGE = https://github.com/animetosho/par2cmdline-turbo
COMMENT  = This is a simple fork of par2cmdline which replaces core computation routines with ParPars processing backend, improving par2cmdlines performance on x86/ARM platforms. par2cmdline is a PAR 2.0 compatible file verification and repair tool.
LICENSE  = GPL

# Ensure C++11 compatibility
UNSUPPORTED_ARCHS = $(ARMv5_ARCHS) $(OLD_PPC_ARCHS)

GNU_CONFIGURE = 1
ADDITIONAL_CFLAGS = -std=c11

PRE_CONFIGURE_TARGET = myPreConfigure
POST_INSTALL_TARGET = myPostInstall

include ../../mk/spksrc.cross-cc.mk

PAR2_TOOLS = par2create par2repair par2verify

.PHONY: myPreConfigure
myPreConfigure:
	$(RUN) ./automake.sh

.PHONY: myPostInstall
myPostInstall:
	(cd $(INSTALL_DIR)/$(INSTALL_PREFIX)/bin ; \
	for tool in $(PAR2_TOOLS); \
	do \
		rm $${tool} ; \
		ln -sf par2 $${tool} ; \
	done \
	)
