from .prod import *


# Necessary block of config when maps are not from Geotrek Tilecache :
LEAFLET_CONFIG['SRID'] = 3857
LEAFLET_CONFIG['TILES'] = [
    (gettext_noop('Scan Express'),
     'http://gpp3-wxs.ign.fr/9s64n7xq9dz1fhxe56113pan/geoportail/wmts?LAYER=GEOGRAPHICALGRIDSYSTEMS.MAPS.SCAN-EXPRESS.STANDARD&EXCEPTIONS=image/jpeg&FORMAT=image/jpeg&SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetTile&STYLE=normal&TILEMATRIXSET=PM&TILEMATRIX={z}&TILEROW={y}&TILECOL={x}',
     '&copy; IGN - GeoPortail'),
    (gettext_noop('Scan'),
     'http://gpp3-wxs.ign.fr/9s64n7xq9dz1fhxe56113pan/geoportail/wmts?LAYER=GEOGRAPHICALGRIDSYSTEMS.MAPS&EXCEPTIONS=image/jpeg&FORMAT=image/jpeg&SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetTile&STYLE=normal&TILEMATRIXSET=PM&TILEMATRIX={z}&TILEROW={y}&TILECOL={x}',
     '&copy; IGN - GeoPortail'),
    (gettext_noop('Ortho'), 'http://gpp3-wxs.ign.fr/9s64n7xq9dz1fhxe56113pan/geoportail/wmts?LAYER=ORTHOIMAGERY.ORTHOPHOTOS&EXCEPTIONS=image/jpeg&FORMAT=image/jpeg&SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetTile&STYLE=normal&TILEMATRIXSET=PM&TILEMATRIX={z}&TILEROW={y}&TILECOL={x}',
     '&copy; IGN - GeoPortail'),
#    (gettext_noop('Cadastre'),
#     'http://gpp3-wxs.ign.fr/9s64n7xq9dz1fhxe56113pan/geoportail/wmts?LAYER=CADASTRALPARCELS.PARCELS&EXCEPTIONS=image/jpeg&FORMAT=image/png&SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetTile&STYLE=normal&TILEMATRIXSET=PM&TILEMATRIX={z}&TILEROW={y}&TILECOL={x}',
#     '&copy; IGN - GeoPortail'),
    (gettext_noop('OSM'), 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', '(c) OpenStreetMap Contributors'),
]
LEAFLET_CONFIG['OVERLAYS'] = [
    (gettext_noop('Cadastre'), 'http://gpp3-wxs.ign.fr/9s64n7xq9dz1fhxe56113pan/geoportail/wmts?LAYER=CADASTRALPARCELS.PARCELS&EXCEPTIONS=image/jpeg&FORMAT=image/png&SERVICE=WMTS&VERSION    =1.0.0&REQUEST=GetTile&STYLE=normal&TILEMATRIXSET=PM&TILEMATRIX={z}&TILEROW={y}&TILECOL={x}',
     {'attribution': '&copy; IGN - GeoPortail', 'opacity': .5}),
]

SPLIT_TREKS_CATEGORIES_BY_PRACTICE = True
