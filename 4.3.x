[buildout]
extends = 
    https://raw.github.com/pythonpackages/buildout-plone/master/base.cfg
    http://dist.plone.org/release/4.3a2/versions.cfg

[plone]
recipe = plone.recipe.zope2instance
eggs =
    Pillow
    Plone
    Products.PloneHotfix20121106
    zope2_bootstrap
user = admin:admin
zcml = zope2_bootstrap

[supervisor]
recipe = collective.recipe.supervisor
programs =
# prio name proc parameters
    0 plone ${buildout:directory}/bin/plone [ console ]
