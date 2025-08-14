#!/usr/bin/env bash
set -euo pipefail

# DBus può servire per gestione/segnali di Ganesha
mkdir -p /var/run/dbus /var/lib/dbus
dbus-uuidgen --ensure

# Assicura il punto di export
mkdir -p /export

# Avvia DBus in foreground (senza pidfile)
dbus-daemon --system --address=unix:path=/var/run/dbus/system_bus_socket --nofork --nopidfile &

# Avvia Ganesha in foreground e logga su file
exec ganesha.nfsd -F -L /var/log/ganesha/ganesha.log -f /etc/ganesha/ganesha.conf

