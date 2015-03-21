# django-example


Build ::

    docker build -t madron/django-example -f docker/uwsgi/Dockerfile .


Run ::

    docker run -it --rm --name django-example -p 80:8000 -p 81:9191 madron/django-example
