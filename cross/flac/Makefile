PKG_NAME = flac
PKG_VERS = 1.3.2
PKG_EXT = tar.xz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://downloads.sourceforge.net/project/flac/$(PKG_NAME)-src
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = cross/libogg

HOMEPAGE = http://flac.sourceforge.net/
COMMENT  = Free Lossless Audio Codec
LICENSE  = GPL

GNU_CONFIGURE = 1

# Required for linking microbench/util.c on cross toolchains
ADDITIONAL_LDFLAGS = -lrt

CONFIGURE_ARGS = --disable-thorough-tests --disable-doxygen-docs --disable-oggtest

include ../../mk/spksrc.cross-cc.mk

ifeq ($(findstring $(ARCH),$(PPC_ARCHS)),$(ARCH))
# avoid error: AltiVec and SPE instructions cannot coexist
CONFIGURE_ARGS += --disable-altivec
endif
