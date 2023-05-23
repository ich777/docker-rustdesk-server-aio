#!/bin/bash
if [ "${HBBS_ENABLED}" != "true" ] && [ "${HBBR_ENABLED}" != "true" ]; then
  echo "---hbbs and hbbr disabled, please enable at least one, putting container into sleep mode!---"
  sleep infinity
fi

echo "---Starting RustDesk-Server-AiO---"
if [ "${HBBS_ENABLED}" == "true" ]; then
  echo "---Starting hbbs---"
  /usr/bin/hbbs ${HBBS_PARAMS} &
else
  echo "---hbbs disabled!---"
fi

if [ "${HBBR_ENABLED}" == "true" ]; then
  echo "---Starting hbbr---"
  /usr/bin/hbbr ${HBBR_PARAMS} &
else
  echo "---hbbr disabled!---"
fi

/opt/scripts/start-watchdog.sh