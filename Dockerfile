FROM gcr.io/tensorflow/tensorflow:latest-gpu-py3

LABEL maintainer="Mihail Chirita <mihailrc@google.com>"

RUN apt-get update \
    && apt-get install -y protobuf-compiler

COPY . /tensorflow/models

RUN cd /tensorflow/models/research \
    && protoc object_detection/protos/*.proto --python_out=.

ENV PYTHONPATH=$PYTHONPATH:/tensorflow/models/research:/tensorflow/models/research/slim

WORKDIR "/tensorflow/models/research/object_detection"
