## How to use this image

# Start uwsgi backend

```console
$ docker run -d --name backend -v /media -e DEBUG=True madron/django-example
```

# Connect nginx to uwsgi backend through http protocol

```console
$ docker run -d --name frontend-http -p 8000:80 --link backend:uwsgi --volumes-from backend madron/django-example nginx
```

# Connect nginx to uwsgi backend through uwsgi protocol over tcp

```console
$ docker run -d --name frontend-uwsgi-tcp -p 8001:81 --link backend:uwsgi --volumes-from backend madron/django-example nginx
```

# Connect nginx to uwsgi backend through uwsgi protocol over unix socket

```console
$ docker run -d --name frontend-uwsgi-socket -p 8002:82  --link backend:uwsgi --volumes-from backend madron/django-example nginx
```
