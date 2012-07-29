[buildout]
allow-hosts =
    *.plone.org
    *.python.org
    *.sourceforge.net
extensions = buildout.bootstrap
extends = http://dist.plone.org/release/4.2/versions.cfg
find-links = 
    http://dist.plone.org/thirdparty/elementtree-1.2.7-20070827-preview.zip
    http://downloads.sourceforge.net/project/docutils/docutils/0.9/docutils-0.9.tar.gz
parts = plone
versions = versions

[plone]
recipe = plone.recipe.zope2instance
eggs =
    Pillow
    Plone
    readline
    zope2_bootstrap
user = admin:admin
zcml = zope2_bootstrap

[versions]
distribute = 0.6.28
zc.buildout = 1.5.2
