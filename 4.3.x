[buildout]
extends = 
    http://dist.plone.org/release/4.3a2/versions.cfg
    https://raw.github.com/pythonpackages/buildout-plone/master/base.cfg

[plone]
eggs += Products.PloneHotfix20121106
