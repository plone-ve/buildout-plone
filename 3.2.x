[buildout]
allow-hosts =
    *.plone.org
    *.python.org
extends = 
    http://dist.plone.org/release/3.2.3/versions.cfg
    https://raw.github.com/pythonpackages/buildout-plone/master/base.cfg
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
    Products.PloneHotfix20121106
products =
user = admin:admin
zope2-location = ${zope2:location}

[zope2]
recipe = plone.recipe.zope2install
url = ${versions:zope2-url}
