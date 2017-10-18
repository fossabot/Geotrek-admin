FROM ubuntu:xenial
ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND=noninteractive
RUN mkdir -p /code
WORKDIR /code
ADD requirements/ /code/requirements
RUN apt-get update
RUN apt-get install $(grep -vE "^\s*#" /code/requirements/apt/docker.txt  | tr "\n" " ") -y -qq
RUN apt-get install $(grep -vE "^\s*#" /code/requirements/apt/base.txt  | tr "\n" " ") -y -qq
RUN apt-get upgrade -y && apt-get clean all && apt-get autoclean
RUN locale-gen fr_FR.UTF-8
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN rm get-pip.py
RUN pip install virtualenv -U
RUN useradd -ms /bin/bash django --uid 1001
ADD src /code/src
ADD conf /code/conf
ADD etc /code/etc
ADD Makefile /code
ADD docs /code/docs
RUN chown django:django -R /code
USER django
RUN virtualenv /code/venv
RUN /code/venv/bin/pip install --no-cache-dir -r /code/requirements/pip/dev.txt
RUN /code/venv/bin/pip install --no-cache-dir -r /code/requirements/pip/prod.txt