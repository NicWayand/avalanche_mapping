#!/bin/bashs

ogr2ogr -nlt POLYGON -skipfailures polygons.shp Avy_paths_Kcountry.geojson  OGRGeoJSON
