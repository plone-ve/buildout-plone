[buildout]
allow-hosts =
    *.plone.org
    *.python.org
extensions =
    buildout.bootstrap
    mr.developer
extends = http://dist.plone.org/release/4.2b1/versions.cfg
extends-cache = .
find-links = 
    http://dist.plone.org/thirdparty/elementtree-1.2.7-20070827-preview.zip
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
    repoze.who
products =
user = admin:admin
scripts = paster

[versions]
distribute = 0.6.24
# Error: Setup script exited with error: src/config.h: No such file or directory
# Error: Couldn't install: pycrypto 2.4
pycrypto = 2.3
zc.buildout = 1.5.2

[mod-wsgi]
recipe = collective.recipe.modwsgi
eggs = ${plone:eggs}
config-file = plone.ini

[wsgi-conf]
recipe = collective.recipe.template
url = http://build.pythonpackages.com/buildout/plone/plone.ini.in
output = plone.ini
