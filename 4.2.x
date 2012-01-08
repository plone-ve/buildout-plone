[buildout]
allow-hosts =
    *.plone.org
    *.python.org
extensions = buildout.bootstrap
extends = http://dist.plone.org/release/4.2b1/versions.cfg
find-links = http://dist.plone.org/thirdparty/elementtree-1.2.7-20070827-preview.zip
parts =
    mod-wsgi
    plone
    wsgi-conf
versions = versions

[plone]
recipe = plone.recipe.zope2instance
eggs =
    PasteScript
    Pillow
    Plone
    Products.PloneHotfix20110928
    WebError
    repoze.retry
    repoze.tm2
    repoze.vhm
products =
user = admin:admin
scripts = paster

[versions]
distribute = 0.6.24
zc.buildout = 1.5.2

[mod-wsgi]
recipe = collective.recipe.modwsgi
eggs = ${plone:eggs}
config-file = plone.ini

[wsgi-conf]
recipe = collective.recipe.template
url = http://build.pythonpackages.com/buildout/plone/plone.ini.in
output = plone.ini

[versions]
Zope2 = 2.13.11
