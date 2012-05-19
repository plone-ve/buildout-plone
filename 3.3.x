[buildout]
allow-hosts =
    *.plone.org
    *.python.org
extends = http://dist.plone.org/release/3.3.6/versions.cfg
extensions = buildout.bootstrap
extends-cache = .
find-links = http://dist.plone.org/thirdparty/elementtree-1.2.7-20070827-preview.zip
parts = plone
versions = versions

[plone]
recipe = plone.recipe.zope2instance
eggs = 
    Pillow
    Plone
products =
user = admin:admin
zope2-location = ${zope2:location}

[zope2]
recipe = plone.recipe.zope2install
url = ${versions:zope2-url}

[versions]
distribute = 0.6.27
zc.buildout = 1.5.2
