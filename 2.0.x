[buildout]
allow-hosts =
    *.plone.org
    *.python.org
extensions = buildout.bootstrap
extends-cache = .
find-links = http://dist.plone.org/thirdparty/elementtree-1.2.7-20070827-preview.zip
parts =
    instance
    plone
versions = versions

[instance]
recipe = plone.recipe.zope2instance
eggs = Pillow
products = ${plone:location}
user = admin:admin
zope2-location = ${zope2:location}

[plone]
recipe = hexagonit.recipe.download
url = http://dist.plone.org/archive/Plone-2.0.5.tar.gz
strip-top-level-dir = true

[zope2]
recipe = plone.recipe.zope2install
url = http://old.zope.org/Products/Zope/2.7.8/Zope-2.7.8-final.tgz

[versions]
distribute = 0.6.28
plone.recipe.zope2install = 3.3
plone.recipe.zope2instance = 3.10
zc.buildout = 1.5.2
