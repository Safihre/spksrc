#!/bin/sh

# Package
PACKAGE="bazarr"
DNAME="Bazarr"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"
PYTHON_DIR="/usr/local/python"
GIT_DIR="/usr/local/git"
BAZARR_DIR="${INSTALL_DIR}/share/${PACKAGE}"

export PATH="${INSTALL_DIR}/bin:${PYTHON_DIR}/bin:${GIT_DIR}/bin:${PATH}"
VAR_DIR="${INSTALL_DIR}/var";
PID_FILE="${VAR_DIR}/bazarr.pid"
PYTHON="${PYTHON_DIR}/bin/python"
BASH="/bin/bash"

USER="sc-bazarr"

start_daemon ()
{
    pushd "${BAZARR_DIR}" >/dev/null \
        && start-stop-daemon -S -q -m -b -N 10 -p "${PID_FILE}" -x "${PYTHON}" -a "${BASH}" -- \
            -c "exec \"${PYTHON}\" bazarr.py --config \"${VAR_DIR}/data\">>\"${VAR_DIR}/bazarr.log\" 2>&1" \
        && popd >/dev/null;
}

stop_daemon ()
{
    local current_pid
    local children_processes
    current_pid=$(cat "${PID_FILE}");
    children_processes=$(ps --ppid "${current_pid}" -o pid=,user= | grep -E " ${USER}\$" | sed '/^[[:space:]]*$/d' | cut -d ' ' -f 1 )
    if [ ! -z "${children_processes}" ]; then 
        kill ${children_processes}; 
    fi; 
    start-stop-daemon -u "${USER}" -K -q -p "${PID_FILE}" -x "${PYTHON}"
    wait_for_status 1 20 || start-stop-daemon -K -s 9 -q -p "${PID_FILE}" -x "${PYTHON}"
}

daemon_status ()
{
    start-stop-daemon -u "${USER}" -K -q -t -p "${PID_FILE}" -x "${PYTHON}"
}

wait_for_status ()
{
    counter=$2
    while [ ${counter} -gt 0 ]; do
        daemon_status
        [ $? -eq $1 ] && return
        let counter=counter-1
        sleep 1
    done
    return 1
}


case $1 in
    start)
        if daemon_status; then
            echo ${DNAME} is already running
        else
            echo Starting ${DNAME} ...
            start_daemon
        fi
        ;;
    stop)
        if daemon_status; then
            echo Stopping ${DNAME} ...
            stop_daemon
        else
            echo ${DNAME} is not running
        fi
        ;;
    status)
        if daemon_status; then
            echo ${DNAME} is running
            exit 0
        else
            echo ${DNAME} is not running
            exit 1
        fi
        ;;
    log)
        exit 1
        ;;
    *)
        exit 1
        ;;
esac
