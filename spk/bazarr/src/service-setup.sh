#!/bin/sh

# Package
PACKAGE="bazarr"
DNAME="Bazarr"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"
PYTHON_DIR="/usr/local/python3"
PATH="${INSTALL_DIR}/env/bin:${INSTALL_DIR}/bin:${PYTHON_DIR}/bin:${PATH}"
VAR_DIR="${INSTALL_DIR}/var"
PYTHON3="${PYTHON_DIR}/bin/python3"

SC_USER="sc-${PACKAGE}"
GROUP="sc-download"

service_postinst ()
{
    # Link
    ln -s ${SYNOPKG_PKGDEST} ${INSTALL_DIR};

    mkdir -p "${VAR_DIR}/data";
    
    set_unix_permissions "${VAR_DIR}" >> "${INST_LOG}"
    
    set_unix_permissions "${VAR_DIR}/data" >> "${INST_LOG}"

    echo "Setting up python installation..."  >> "${INST_LOG}"

    # Create a Python virtualenv
    "${PYTHON3}" -m venv --system-site-packages ${INSTALL_DIR}/env >> "${INST_LOG}"

    # Install the wheels

    echo "Installing python requirements..."  >> "${INST_LOG}"

    ${INSTALL_DIR}/env/bin/pip install \
        --no-deps --no-index -U --force-reinstall \
        -f ${INSTALL_DIR}/share/wheelhouse ${INSTALL_DIR}/share/wheelhouse/*.whl >> "${INST_LOG}"

    echo "Running busybox installation..."  >> "${INST_LOG}"

    # Install busybox
    ${PYTHON_DIR}/bin/busybox --install ${INSTALL_DIR}/bin
}
