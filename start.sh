#!/bin/bash

echo "Starting ProofMe TURN/STUN server"
EXTERNAL_IP=$(curl -4 https://icanhazip.com 2>/dev/null)
echo "Listening on ${EXTERNAL_IP}"
turnserver -v -L $EXTERNAL_IP --external-ip="${EXTERNAL_IP}" --server-name "${TURN_SERVER_NAME}" --no-cli --static-auth-secret="${TURN_SECRET}" --realm=${TURN_REALM}  -p ${TURN_PORT} --min-port ${TURN_PORT_START} --max-port ${TURN_PORT_END} -q ${USER_QUOTA} -Q ${TOTAL_QUOTA} ${TURN_EXTRA}
