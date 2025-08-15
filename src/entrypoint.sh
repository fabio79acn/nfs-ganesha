#!/usr/bin/env bash
set -Eeuxo pipefail

# Assicura il punto di export
mkdir -p /export

# Avvia Ganesha in foreground, usando la tua configurazione.
# -F = foreground (comportamento "da container")
# -f = percorso del file di configurazione
# -L /dev/stdout = log su stdout (visibile con 'oc logs')
exec ganesha.nfsd -F -f /etc/ganesha/ganesha.conf -L /dev/stdout

