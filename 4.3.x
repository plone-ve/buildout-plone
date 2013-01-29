[buildout]
extends = 
    http://dist.plone.org/release/4.3b2/versions.cfg
    https://raw.github.com/pythonpackages/buildout-plone/master/base.cfg

[plone]
eggs += 
    zope2_bootstrap
zcml +=
    zope2_bootstrap
