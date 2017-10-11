FROM ubuntu:xenial

#
#  PhantomJS
#...
RUN apt-get update
RUN apt-get install -y wget git unzip bzip2 libfreetype6 fontconfig python-dev python-pip build-essential python-virtualenv
RUN rm -rf /opt/*phantomjs*/
RUN wget --quiet https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2 -O /opt/phantomjs.tar.bz2
RUN tar -xavf /opt/phantomjs.tar.bz2 -C /opt/
RUN rm /opt/phantomjs.tar.bz2
RUN ln -sf /opt/*phantomjs*/bin/phantomjs /usr/bin/

#
#  CasperJS
#...
RUN rm -rf /opt/*casperjs*/
RUN wget --quiet https://github.com/n1k0/casperjs/archive/1.1-beta3.zip -O /opt/casperjs.zip
RUN unzip -o /opt/casperjs.zip -d /opt/ > /dev/null
RUN rm /opt/casperjs.zip
RUN ln -sf /opt/*casperjs*/bin/casperjs /usr/bin/

#
#  Screamshotter
#...
ADD . /opt/apps/screamshotter
WORKDIR /opt/apps/screamshotter

RUN virtualenv .
RUN ./bin/pip install Pillow django==1.8.17 gunicorn
RUN ./bin/python setup.py develop