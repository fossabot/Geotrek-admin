{% set cfg = opts.ms_project %}

include:
  - makina-projects.{{cfg.name}}.include.configs

geotrek-install:
  cmd.run:
    - name: {{cfg.project_root}}/install.sh --prod --noinput
    - cwd: {{cfg.project_root}}
    - use_vt: true
    - env:
      - LC_ALL: fr_FR.UTF-8
    - require:
      - mc_proxy: {{cfg.name}}-configs-after
