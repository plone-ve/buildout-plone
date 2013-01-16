[buildout]
allow-hosts =
    *.plone.org
    *.python.org
    *.sourceforge.net
extensions = buildout.bootstrap
extends = 
    http://dist.plone.org/release/4.2.3/versions.cfg
    https://raw.github.com/pythonpackages/buildout-plone/master/base.cfg
find-links = 
    http://dist.plone.org/thirdparty/elementtree-1.2.7-20070827-preview.zip
    http://downloads.sourceforge.net/project/docutils/docutils/0.9/docutils-0.9.tar.gz
parts = plone supervisor
versions = versions

[plone]
recipe = plone.recipe.zope2instance
eggs =
    Pillow
    Plone
    zope2_bootstrap
user = admin:admin
zcml = zope2_bootstrap

[supervisor]
recipe = collective.recipe.supervisor
programs =
# prio name proc parameters
    0 plone ${buildout:directory}/bin/plone [ console ]
