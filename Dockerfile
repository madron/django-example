FROM madron/uwsgi:latest
MAINTAINER Massimiliano Ravelli <massimiliano.ravelli@gmail.com>

# Requirements
COPY requirements /src/requirements
RUN pip install -r /src/requirements/prod.txt

# Source
COPY . /src

# Nginx site
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf


ENV DJANGO_SETTINGS_MODULE=settings.prod

# Static files
RUN /src/manage.py collectstatic --link --noinput --verbosity=0

VOLUME ["/run/uwsgi", "/sqlite"]

ENTRYPOINT ["/src/docker/entrypoint.sh"]
