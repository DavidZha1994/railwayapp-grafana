#!/bin/sh
set -e

# Bridge Railway PORT to Grafana
export GF_SERVER_HTTP_PORT="${PORT:-3000}"

# Parse DATABASE_URL into individual Grafana database env vars
# Handles both postgres:// and postgresql:// schemes
# Grafana requires type "postgres" (not "postgresql")
if [ -n "$DATABASE_URL" ]; then
    export GF_DATABASE_TYPE="postgres"

    # Strip scheme (postgres:// or postgresql://)
    url_without_scheme="${DATABASE_URL#*://}"

    # Extract user info (everything before @)
    userinfo="${url_without_scheme%%@*}"
    export GF_DATABASE_USER="${userinfo%%:*}"
    export GF_DATABASE_PASSWORD="${userinfo#*:}"

    # Extract host+port and dbname (everything after @)
    hostport_db="${url_without_scheme#*@}"
    export GF_DATABASE_HOST="${hostport_db%%/*}"
    export GF_DATABASE_NAME="${hostport_db#*/}"
fi

exec /run.sh "$@"
