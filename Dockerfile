FROM ubuntu:xenial
ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND=noninteractive
RUN mkdir /code
RUN apt-get update
RUN apt-get install -y sudo software-properties-common python-software-properties python
RUN apt-get install -y unzip wget python-pip python-gdal python-software-properties apt-utils git gettext python-virtualenv build-essential python-dev wget less nano curl gdal-bin binutils libproj-dev libpq-dev libxml2-dev libxslt-dev python-lxml libcairo2 libpango1.0-0 libgdk-pixbuf2.0-dev libffi-dev shared-mime-info python-lxml libcairo2 libpango1.0-0 libgdk-pixbuf2.0-dev libffi-dev shared-mime-info libxml2-dev libxslt-dev libxml2-dev libxslt-dev libpq-dev gdal-bin libgdal-dev binutils libproj-dev git gettext python-virtualenv build-essential
RUN apt-get upgrade -y && apt-get clean all && apt-get autoclean
RUN useradd -ms /bin/bash django --uid 1001
RUN chown django:django -R /code
RUN mkdir /var/log/gunicorn
RUN chown django:django -R /var/log/gunicorn
WORKDIR /code
ADD geotrek /code
ADD bulkimport /code
ADD conf /code
ADD install.sh /code
ADD manage.py /code
ADD Makefile /code
ADD VERSION /code
ADD setup.py /code
ADD docs /code
ADD requirements.txt /code
WORKDIR /code
RUN chown django:django -R /code
RUN pip install pip setuptools wheel -U
RUN pip install --no-cache-dir -r ./requirements.txt
USER django