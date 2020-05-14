# Minimalistic Flask images base on UBI

## Goals
This is a mini project whose goal is to create an alternative production grade container images to complicated Flask hosting systems. 

## Basics
This image is based on Python3/Flask with (Gunicorn)[https://gunicorn.org], note that it is based on UBI8-minimal (you need to use *microdnf* package manager). Pip3 is installed and can be used to install more python modules.
 
## Usage

### Application code directory
The image assumes by default that the application code is at `/app`. This can be overriden by `MF_APP_DIR` environment variable.
In basic use case, put the code of your Flask application into `/app` directory.

### Applicatio invocation
By default your application should contain a file `service.py` which contains an attribute called `application` which is a Flask application object. 

Example:
```
from flask import Flask
application = Flask(__name__)
```

If you want to customize it, use `MF_GUNICORN_INVOKE` environment variable which is set to `service:application` by default.

### Server configuration
* `MF_APP_PORT` can be user to overwrite listening port
* `MF_APP_NPROCS` sets the number of worker processes
* `MF_GUNICORN_EXTRA_ARGS` can be used to add extra arguments to Gunicorn

## Example
```
docker run -d -p 8080:8080 minimal-flask-ubi8:latest
```




