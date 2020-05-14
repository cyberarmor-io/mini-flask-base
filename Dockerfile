FROM registry.access.redhat.com/ubi8/ubi-minimal

LABEL name="Minimalistic Flask app hosting image based on UBI8"
LABEL maintainer="bhirschb@cyberarmor.io"

RUN microdnf update && microdnf install python36
RUN pip3 install --upgrade pip && pip3 install gunicorn flask
COPY app /app
COPY entrypoint.sh /entrypoint.sh

ENV MF_APP_PORT=8080
ENV MF_APP_NPROCS=1
ENV MF_APP_DIR=/app
ENV MF_GUNICORN_INVOKE=service:application

ENTRYPOINT [ "/entrypoint.sh" ]