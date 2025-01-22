FROM quay.io/scottharwell/cloud-ee:latest

USER root

RUN pip3 install --upgrade pip

RUN pip3 install --no-cache-dir google-cloud-container

USER 1000