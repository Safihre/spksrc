PATH="${SYNOPKG_PKGDEST}/bin:${PATH}"
SSLH="${SYNOPKG_PKGDEST}/bin/sslh"
CFG_FILE="${SYNOPKG_PKGDEST}/var/sslh.cfg"
SERVICE_COMMAND="${SSLH} -v -F${CFG_FILE}"