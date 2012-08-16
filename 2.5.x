[buildout]
allow-hosts =
    *.python.org
    *.plone.org
extensions = buildout.bootstrap
extends-cache = .
find-links = http://dist.plone.org/thirdparty/elementtree-1.2.7-20070827-preview.zip
parts =
    instance
    plone
    zope2
versions = versions

[instance]
recipe = plone.recipe.zope2instance
eggs = 
    Pillow
    Products.PloneHotfix20110531
    Products.PloneHotfix20110720
products = ${plone:location}
user = admin:admin
zope2-location = ${zope2:location}

[plone]
recipe = plone.recipe.distros
urls = http://launchpad.net/plone/2.5/2.5.5/+download/Plone-2.5.5.tar.gz
nested-packages = Plone-2.5.5.tar.gz
version-suffix-packages = Plone-2.5.5.tar.gz

[zope2]
recipe = plone.recipe.zope2install
url = http://www.zope.org/Products/Zope/2.9.12/Zope-2.9.12-final.tgz

[versions]
distribute = 0.6.28
plone.recipe.zope2install = 3.3
plone.recipe.zope2instance = 3.10
zc.buildout = 1.6.0
