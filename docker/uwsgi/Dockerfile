FROM madron/uwsgi:latest
MAINTAINER Massimiliano Ravelli <massimiliano.ravelli@gmail.com>

# Requirements
COPY ./requirements/ /src/requirements/
RUN pip install -r /src/requirements/prod.txt

# Source
COPY . /src/

ENV DJANGO_SETTINGS_MODULE=settings.prod

# Static files
RUN /src/manage.py collectstatic --link --noinput --verbosity=0

VOLUME ["/sqlite"]

ENTRYPOINT ["/src/docker/uwsgi/entrypoint.sh"]
CMD ["uwsgi", "--master", "--processes", "4", "--threads", "2", "/src/docker/uwsgi/uwsgi.ini"]
