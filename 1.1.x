[buildout]
allow-hosts =
    *.plone.org
    *.python.org
extensions = buildout.bootstrap
extends-cache = .
versions = versions
parts = 
    zopepy
    plone
    zope2
    compile
    cmf
    qi
    ai
    editor
    symlink
    euser
    scriptingcmf
    supervisor
find-links = http://dist.plone.org/thirdparty/elementtree-1.2.7-20070827-preview.zip

[editor]
recipe = hexagonit.recipe.download
url = http://www.zope.org/Members/Caseman/ExternalEditor/0.8/ExternalEditor-0.8-src.tgz

[ai]
recipe = hexagonit.recipe.download
url = http://www.zope.org/Members/tseaver/CMFActionIcons/CMFActionIcons-0.9/CMFActionIcons-0.9.tar.gz
strip-top-level-dir = true

[qi]
recipe = hexagonit.recipe.download
url = http://downloads.sourceforge.net/project/collective/QuickInstaller/1.0/CMFQuickInstallerTool_1.0.tgz
strip-top-level-dir = true

[cmf]
recipe = hexagonit.recipe.download
url = http://www.zope.org/Products/CMF/CMF-1.4/CMF-1.4.tar.gz
strip-top-level-dir = true

[plone]
recipe = hexagonit.recipe.download
url = http://dist.plone.org/archive/CMFPlone1.1.tar.gz
strip-top-level-dir = true

[zope2]
recipe = hexagonit.recipe.download
url = http://www.zope.org/Products/Zope/2.6.4/Zope-2.6.4-src.tgz
strip-top-level-dir = true

[versions]
distribute = 0.6.27

[zopepy]
recipe = zc.recipe.egg
eggs =
interpreter = zopepy
extra-paths = ${zope2:location}/lib/python

[compile]
recipe = plone.recipe.command
command = 
    cd ${zope2:location}
    ../../bin/zopepy w_pcgi.py
update-command = ${:command}

[euser]
recipe = plone.recipe.command
command = 
    cd ${zope2:location}
    ../../bin/zopepy zpasswd.py -u euser -p euser access
update-command = ${:command}

[scriptingcmf]
recipe = hexagonit.recipe.download
url = http://plone.org/products/scriptingcmf/releases/0.1/scriptingcmf-0_1.tgz

[symlink]
recipe = plone.recipe.command
command = 
    cd ${zope2:location}/lib/Python/Products; ln -sf ${plone:location}/CMFPlone
    cd ${zope2:location}/lib/Python/Products; ln -sf ${cmf:location}/CMFCore
    cd ${zope2:location}/lib/Python/Products; ln -sf ${cmf:location}/CMFDefault
    cd ${zope2:location}/lib/Python/Products; ln -sf ${cmf:location}/CMFTopic
    cd ${zope2:location}/lib/Python/Products; ln -sf ${cmf:location}/CMFCalendar
    cd ${zope2:location}/lib/Python/Products; ln -sf ${qi:location} CMFQuickInstallerTool
    cd ${zope2:location}/lib/Python/Products; ln -sf ${cmf:location}/DCWorkflow
    cd ${zope2:location}/lib/Python/Products; ln -sf ${plone:location}/Formulator
    cd ${zope2:location}/lib/Python/Products; ln -sf ${ai:location}/CMFActionIcons 
    cd ${zope2:location}/lib/Python/Products; ln -sf ${editor:location}/ExternalEditor
    cd ${zope2:location}/lib/Python/Products; ln -sf ${scriptingcmf:location}/ScriptingCMF
    touch ${scriptingcmf:location}/ScriptingCMF/__init__.py
update-command = ${:command}

[supervisor]
recipe = collective.recipe.supervisor
programs = 
    0 plone ${zope2:location}/start
