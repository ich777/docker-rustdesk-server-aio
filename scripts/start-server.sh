
#!/bin/bash
if [ "${HBBS_ENABLED}" != "true" ] && [ "${HBBR_ENABLED}" != "true" ]; then
  echo "---hbbs and hbbr disabled, please enable at least one, putting container into sleep mode!---"
  sleep infinity
fi

cd ${DATA_DIR}
echo "---Starting RustDesk-Server-AiO---"
if [ "${HBBS_ENABLED}" == "true" ]; then
  echo "---Starting hbbs---"
  /usr/bin/hbbs ${HBBS_PARAMS} & > ${DATA_DIR}/hbb.log
else
  echo "---hbbs disabled!---"
fi

if [ "${HBBR_ENABLED}" == "true" ]; then
  echo "---Starting hbbr---"
  /usr/bin/hbbr ${HBBR_PARAMS} & > ${DATA_DIR}/hbb.log
else
  echo "---hbbr disabled!---"
fi

/opt/scripts/start-watchdog.sh &

tail -f ${DATA_DIR}/hbb.log