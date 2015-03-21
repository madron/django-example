#!/bin/bash
set -e

if [ "$1" = 'uwsgi' ]; then
    chown uwsgi:uwsgi /sqlite
    gosu uwsgi /src/manage.py migrate --noinput
    gosu uwsgi /src/manage.py loaddata /src/example/admin-user.json
    exec gosu uwsgi "$@"
fi

exec "$@"
