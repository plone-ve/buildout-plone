[buildout]
allow-hosts =
    dist.plone.org
    pypi.python.org
extensions = buildout.bootstrap
extends = http://dist.plone.org/release/4.1.2/versions.cfg
extends-cache = .
find-links =
    http://dist.plone.org/thirdparty/elementtree-1.2.7-20070827-preview.zip
parts =
    host
    plone
versions = versions

[host]
# Fabric automation
recipe = collective.hostout

[plone]
recipe = plone.recipe.zope2instance
eggs =
    Pillow
    Plone
    Products.PloneHotfix20110928
products =
user = admin:admin

[versions]
collective.hostout = 1.0a5
# py2.4 regression in 2.0
distribute = 0.6.24
zc.buildout = 1.5.2
pycrypto = 2.3
