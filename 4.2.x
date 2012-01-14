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
    plone-mod-wsgi
    plone-paste
versions = versions

[mod-wsgi]
recipe = collective.recipe.modwsgi
eggs = ${plone:eggs}
config-file = plone.ini

[plone]
recipe = plone.recipe.zope2instance
eggs =
    PasteScript
    Pillow
    Plone
    WebError
    repoze.retry
    repoze.tm2
    repoze.vhm
products =
user = admin:admin
scripts = paster

[plone-mod-wsgi]
recipe = collective.recipe.template
url = http://build.pythonpackages.com/buildout/plone/plone-mod-wsgi.ini.in
output = ${buildout:directory}/plone-mod-wsgi.ini

[plone-paste]
recipe = collective.recipe.template
url = http://build.pythonpackages.com/buildout/plone/plone-paste.ini.in
output = ${buildout:directory}/plone-paste.ini

[versions]
distribute = 0.6.24
zc.buildout = 1.5.2
Zope2 = 2.13.11
