FROM python:3.6-alpine as base
FROM base as builder

ENV PYTHONBUFFERED=1 PYTHONDONTWRITEBYTECODE=1 INSIDE_DOCKER=1

RUN mkdir /install
WORKDIR /install

RUN apk update \
    && apk add --no-cache \
       gcc \
       musl-dev \
       zlib-dev \
       jpeg-dev \
       libxslt-dev \
       libxml2-dev \
       postgresql-client \
       postgresql-dev \
       jpeg \
       gettext \
       tzdata

ADD ./docker/web/requirements.txt /requirements.txt

RUN pip install --upgrade pip \
    && pip install --install-option="--prefix=/install" -r /requirements.txt

FROM builder

COPY --from=builder /install /usr/local

RUN mkdir /code
WORKDIR /code

ENV PYTHONPATH /code:$PYTHONPATH

RUN adduser -D -g '' -s /bin/bash django

ADD . /code/

RUN chown -R django:django /code

USER django
