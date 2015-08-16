#!/bin/bash
set -e

if [ "$1" = 'uwsgi' ]; then
    chown -R uwsgi:uwsgi /run/uwsgi
    chown -R uwsgi:uwsgi /media
    chown uwsgi:uwsgi /sqlite
    gosu uwsgi /src/manage.py migrate --noinput
    gosu uwsgi /src/manage.py loaddata /src/settings/admin-user.json
    exec gosu uwsgi "$@"
elif [ "$1" = 'nginx' ]; then
    exec nginx "-g daemon off;"
else
    exec "$@"
fi
