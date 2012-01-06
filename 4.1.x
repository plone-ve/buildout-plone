[buildout]
allow-hosts =
    *.plone.org
    *.python.org
extensions = buildout.bootstrap
extends = http://dist.plone.org/release/4.1.3/versions.cfg
find-links =
    http://dist.plone.org/thirdparty/elementtree-1.2.7-20070827-preview.zip
parts = plone
versions = versions

[plone]
recipe = plone.recipe.zope2instance
eggs =
    Pillow
    Plone
    Products.PloneHotfix20110928
user = admin:admin

[versions]
distribute = 0.6.24
zc.buildout = 1.5.2
