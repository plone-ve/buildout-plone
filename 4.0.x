[buildout]
allow-hosts =
    *.plone.org
    *.python.org
extensions = buildout.bootstrap
extends =
    http://dist.plone.org/release/4.0.8/versions.cfg 
    http://pythonpackages.com/buildout/plone/base.cfg
extends-cache = .
find-links = http://dist.plone.org/thirdparty/elementtree-1.2.7-20070827-preview.zip
parts = plone
versions = versions

[plone]
recipe = plone.recipe.zope2instance
eggs =
    Pillow
    Plone
    Products.PloneHotfix20110928

products =
user = admin:admin
