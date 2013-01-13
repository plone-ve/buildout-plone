[buildout]
extends = 
    http://dist.plone.org/release/4.3b1/versions.cfg
    https://raw.github.com/pythonpackages/buildout-plone/master/base.cfg

[plone]
eggs += 
    Products.PloneHotfix20121106
    zope2_bootstrap
zcml +=
    zope2_bootstrap
