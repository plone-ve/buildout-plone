[buildout]
allow-hosts =
    *.plone.org
    *.python.org
extensions = buildout.bootstrap
extends = http://pythonpackages.com/buildout/plone/base.cfg
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
    ${plone:eggs}
products = ${plone:location}
user = admin:admin
zope2-location = ${zope2:location}

[plone]
recipe = plone.recipe.plone

[zope2]
recipe = plone.recipe.zope2install
url = http://www.zope.org/Products/Zope/2.10.9/Zope-2.10.9-final.tgz

[versions]
plone.recipe.plone = 3.0.6
plone.recipe.zope2install = 3.3
plone.recipe.zope2instance = 3.10
