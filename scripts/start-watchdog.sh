#!/bin/bash
killpid="$(pidof hbbs hbbr)"

tail --pid=${killpid// / --pid=} -f /dev/null
kill $(pidof tail)
exit 0