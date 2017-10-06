FROM ubuntu:xenial
ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND=noninteractive
RUN mkdir /code
WORKDIR /code
ADD requirements/ /code/requirements
RUN apt-get update
RUN apt search gdal-bin
RUN apt-get install $(grep -vE "^\s*#" /code/requirements/apt/docker.txt  | tr "\n" " ") -y -qq
RUN apt-get install $(grep -vE "^\s*#" /code/requirements/apt/base.txt  | tr "\n" " ") -y -qq
RUN apt-get upgrade -y && apt-get clean all && apt-get autoclean
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN rm get-pip.py
RUN pip install virtualenv -U
RUN useradd -ms /bin/bash django --uid 1001
RUN chown django:django -R /code
RUN mkdir /var/log/gunicorn
RUN chown django:django -R /var/log/gunicorn
ADD geotrek /code/geotrek
ADD bulkimport /code/bulkimport
ADD conf /code/conf
ADD install.sh /code
ADD manage.py /code
ADD Makefile /code
ADD VERSION /code
ADD setup.py /code
ADD docs /code/docs
RUN chown django:django -R /code
RUN gdal-config --version
USER django
RUN virtualenv /code/venv
RUN /code/venv/bin/pip install --no-cache-dir -r /code/requirements/pip/dev.txt
RUN /code/venv/bin/pip install --no-cache-dir -r /code/requirements/pip/prod.txt
USER django