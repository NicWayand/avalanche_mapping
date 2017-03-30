#!/bin/bash

# Converts a input geojson file to a shapfile in UTM zone 11, then rasterizes to a 5x5m geotiff file

geojsonFile=$1
filename="${geojsonFile%.*}"
shpFile=$filename".shp"
geoFile=$filename".tif"

ogr2ogr -nlt POLYGON -t_srs EPSG:2153 -skipfailures $shpFile $geojsonFile  OGRGeoJSON

gdal_rasterize -at -tr 5 5 -burn 1 -ot Int16 $shpFile $geoFile

gdalinfo -stats $geoFile

echo "Done"
