FROM madron/uwsgi:latest
MAINTAINER Massimiliano Ravelli <massimiliano.ravelli@gmail.com>

# Copy only requirements to reuse cache for pip install
COPY requirements /src/requirements/

RUN pip install -r /src/requirements/prod.txt

COPY . /src/

RUN /src/manage.py collectstatic --link --noinput --verbosity=0

VOLUME ["/sqlite"]

ENTRYPOINT ["/src/docker/uwsgi/entrypoint.sh"]
CMD ["uwsgi", "--master", "--processes", "4", "--threads", "2", "/src/docker/uwsgi/uwsgi.ini"]
