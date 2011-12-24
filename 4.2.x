[buildout]
allow-hosts =
    *.plone.org
    *.python.org
extensions = 
    buildout.bootstrap
    mr.developer
extends = http://dist.plone.org/release/4.2a2/versions.cfg
extends-cache = .
find-links = 
    http://dist.plone.org/thirdparty/elementtree-1.2.7-20070827-preview.zip
parts =
    host
    modwsgi
    plone
    wsgi-conf
versions = versions

[host]
# Fabric automation
recipe = collective.hostout

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
zc.buildout = 1.5.2

#Getting distribution for 'pycrypto>=2.1'.
#error: Setup script exited with error: src/config.h: No such file or directory
#An error occurred when trying to install pycrypto 2.4. Look above this message for any errors that were output by easy_install.
#While:
#  Installing.
#  Getting section host.
#  Initializing section host.
#  Installing recipe collective.hostout.
#  Getting distribution for 'pycrypto>=2.1'.
#Error: Couldn't install: pycrypto 2.4
pycrypto = 2.3

[modwsgi]
recipe = collective.recipe.modwsgi
eggs = ${plone:eggs}
config-file = plone.ini

[wsgi-conf]
recipe = collective.recipe.template
url = http://x.aclark.net/plone/4.2.x/plone.ini.in
output = plone.ini
