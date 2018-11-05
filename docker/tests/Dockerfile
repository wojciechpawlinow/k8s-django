FROM python:3.6-alpine as base
FROM base as builder

ENV PYTHONBUFFERED=1 PYTHONDONTWRITEBYTECODE=1 INSIDE_DOCKER=1

RUN mkdir /install
WORKDIR /install

RUN apk update \
    && apk add --no-cache \
       gcc \
       curl \
       musl-dev \
       zlib-dev \
       jpeg-dev \
       libxslt-dev \
       libxml2-dev \
       postgresql-client \
       postgresql-dev \
       jpeg \
       gettext \
       tzdata \
       git

ADD ./docker/tests/requirements.txt /requirements.txt

RUN pip install --upgrade pip \
    && pip install --install-option="--prefix=/install" -r /requirements.txt

FROM builder

COPY --from=builder /install /usr/local

RUN mkdir /code
WORKDIR /code

ENV PYTHONPATH /code:$PYTHONPATH

RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > "/usr/local/bin/cc-test-reporter" \
    && chmod +x "/usr/local/bin/cc-test-reporter"

ADD . /code/
