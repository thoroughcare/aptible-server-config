#! /bin/bash
supercronic ./crontab &
vault server -dev -config=/vault/config -dev-root-token-id="$VAULT_DEV_ROOT_TOKEN_ID" -dev-listen-address="${VAULT_DEV_LISTEN_ADDRESS:-"0.0.0.0:8200"}"
