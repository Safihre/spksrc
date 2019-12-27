SPK_NAME = bazarr

BAZARR_VERSION = 0.8.4

SPK_VERS = $(BAZARR_VERSION)
SPK_REV = 1

SPK_ICON = src/bazarr.png

REQUIRED_DSM = 6.1

BUILD_DEPENDS = cross/python3 cross/setuptools cross/wheel

BETA = 1

DEPENDS = cross/$(SPK_NAME)

WHEELS = 
SPK_DEPENDS = "python3>=3.6"

MAINTAINER = SynoCommunity

DESCRIPTION = "Bazarr is a companion application to Sonarr and Radarr. It manages and downloads subtitles based on your requirements. You define your preferences by TV show or movies and Bazarr takes care of everything for you."
RELOAD_UI = no
DISPLAY_NAME = Bazarr
STARTABLE = yes
CHANGELOG = "Initial release"

HOMEPAGE = https://www.bazarr.media
LICENSE = GPLv3

SERVICE_USER  = auto
SERVICE_SETUP = src/service-setup.sh
SSS_SCRIPT    = src/dsm-control.sh
SERVICE_PORT  = 6767
SERVICE_PORT_TITLE = $(DISPLAY_NAME)

# Admin link for in DSM UI
ADMIN_PORT = $(SERVICE_PORT)

include ../../mk/spksrc.spk.mk
