{% set cfg = opts.ms_project %}
{% set data = cfg.data %}

include:
  - makina-states.services.gis.ubuntugis
  - makina-states.services.db.postgresql.client

prepreqs-{{cfg.name}}:
  pkg.installed:
    - watch:
      - mc_proxy: ubuntugis-post-hardrestart-hook
    - pkgs:
      - sqlite3
      - liblcms2-2
      - liblcms2-dev
      - libcairomm-1.0-dev
      - libcairo2-dev
      - libsqlite3-dev
      - apache2-utils
      - autoconf
      - automake
      - build-essential
      - bzip2
      - gettext
      - libpq-dev
      - libmysqlclient-dev
      - git
      - groff
      - libbz2-dev
      - libcurl4-openssl-dev
      - libdb-dev
      - libgdbm-dev
      - libreadline-dev
      - libfreetype6-dev
      - libsigc++-2.0-dev
      - libsqlite0-dev
      - libsqlite3-dev
      - libtiff5
      - libtiff5-dev
      - libwebp5
      - libwebp-dev
      - libssl-dev
      - libtool
      - libxml2-dev
      - libxslt1-dev
      - libopenjpeg-dev
      - m4
      - man-db
      - pkg-config
      - poppler-utils
      - python-dev
      - python-imaging
      - python-setuptools
      - tcl8.4
      - tcl8.4-dev
      - tcl8.5
      - tcl8.5-dev
      - tk8.5-dev
      - cython
      - python-numpy
      - zlib1g-dev
      # geodjango
      - gdal-bin
      - libgdal1-dev
      - libgeos-dev
      - geoip-bin
      - libgeoip-dev
      # py3
      # - libpython3-dev
      # - python3
      # - python3-dev

{{cfg.name}}-dirs:
  file.directory:
    - makedirs: true
    - user: {{cfg.user}}
    - group: {{cfg.group}}
    - watch:
      - pkg: prepreqs-{{cfg.name}}
    - names:
      {% for i in ['cache', 'bin', 'lib', 'etc', 'share', 'include', 'data', 'var', 'local'] %}
      - {{cfg.data_root}}/{{i}}
      {% endfor %}
      {% if data.get('ftp_root', None) and (
            data.get('ftp_users', None) or data.get('ftp_install', False)) %}
      - {{data.ftp_root}}
      {% endif %}

{% for d, i in {
      cfg.project_root+'/local': cfg.data_root+'/local',
      cfg.project_root+'/var': cfg.data_root+'/var',
      cfg.project_root+'/bin': cfg.data_root+'/bin',
      cfg.project_root+'/lib': cfg.data_root+'/lib',
      cfg.project_root+'/etc': cfg.data_root+'/etc',
      cfg.project_root+'/include': cfg.data_root+'/include',
      cfg.project_root+'/share': cfg.data_root+'/share',
      cfg.project_root+'/data': cfg.data_root+'/data',
      cfg.project_root+'/cache': cfg.data_root+'/cache',
}.items() %}
{{cfg.name}}-l-dirs-{{i}}:
  file.symlink:
    - watch:
      - file: {{cfg.name}}-dirs
    - name: {{d}}
    - target: {{i}}
{%endfor %}
