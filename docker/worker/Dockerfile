FROM python:3.6

ENV PYTHONUNBUFFERED 1

RUN mkdir /code
WORKDIR /code

ENV PYTHONPATH /code:$PYTHONPATH

ADD ./docker/web/requirements.txt /code/
RUN pip install -r requirements.txt

RUN useradd -ms /bin/bash django

ADD . /code/

RUN chown -R django:django /code

USER django
