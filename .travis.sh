#!/bin/sh
for VER in 4.3.x 4.2.x 4.1.x 4.0.x
do
    echo --------------------------------------------------------------------------------
    echo Buildout Plone $VER...
    echo --------------------------------------------------------------------------------
    buildout -c $VER-travis
    echo Buildout Plone $VER... done.
done
