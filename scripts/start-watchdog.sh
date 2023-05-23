#!/bin/bash
killpid="$(pidof hbbs hbbr)"

tail --pid=${killpid// / --pid=} -f /dev/null