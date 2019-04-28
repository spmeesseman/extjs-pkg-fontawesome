# ExtJs Package Open Tooling Package Wrapper for Font Awesome

[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)
[![Build Status](https://dev.azure.com/spmeesseman/extjs-pkg-fontawesome/_apis/build/status/spmeesseman.extjs-pkg-fontawesome?branchName=master)](https://dev.azure.com/spmeesseman/extjs-pkg-fontawesome/_build/latest?definitionId=2&branchName=master)
[![Known Vulnerabilities](https://snyk.io/test/github/spmeesseman/extjs-pkg-fontawesome/badge.svg)](https://snyk.io/test/github/spmeesseman/extjs-pkg-fontawesome)
[![Average time to resolve an issue](https://isitmaintained.com/badge/resolution/spmeesseman/extjs-pkg-fontawesome.svg)](https://isitmaintained.com/project/spmeesseman/extjs-pkg-fontawesome "Average time to resolve an issue")
[![Percentage of issues still open](https://isitmaintained.com/badge/open/spmeesseman/extjs-pkg-fontawesome.svg)](https://isitmaintained.com/project/spmeesseman/extjs-pkg-fontawesome "Percentage of issues still open")

## Description

> This package provides an ExtJS package wrapper for the Font Awesome icon set.  The build is set to use the free version.

## Packaged version

5.8.1

## Install

To install this package, run the following command:

    npm install @spmeesseman/extjs-pkg-fontawesome

## Usage

To include the package in an ExtJS application build, be sure to add the package name to the list of required packages in the app.json file:

    "requires": [
         "fontawesome",
        ...
    ]

For an open tooling build, also add the node_modules path to the workspace.json packages path array:

     "packages": {
        "dir": "...${package.dir}/node_modules/@spmeesseman/extjs-pkg-fontawesome"
    }

Simply use the icons with the default ExtJS syntax:

    items: [
    {
        xtype: 'panel',
        iconCls: 'far fa-plus'
    }]

## Feedback & Contributing

* Please report any bugs, suggestions or documentation requests via the
  [Issues](https://github.com/spmeesseman/extjs-pkg-fontawesome/issues)
* Feel free to submit
  [pull requests](https://github.com/spmeesseman/extjs-pkg-fontawesome/pulls)
* [Contributors](https://github.com/spmeesseman/extjs-pkg-fontawesome/graphs/contributors)

## Build Notes (old / need to edit)

To use package with ExtJS, some finagling of both some framework files and the original
FontAwesome package was necessary.

These changes are listed below:

First, to use the external package, the following file must be edited in the ExtJS framework 
directory:

    ext/sass/etc/font-awesome-variables.scss

Add the following line to the end of the file (needs to be the last line so that all new
definitions override the legacy definitions).  Note the original import of the legacy variables
needs to remain so that default references embdeed within the base themes will have a valid
reference:

    @import "../../../packages/remote/fontawesome/sass/etc/_variables.scss";

If using the Triton classic toolkit theme, the following file needs to be modified to remove
the legacy package dependency:

    ext/src/classic/theme-triton/package.json

Remove the legacy "font-awesome" package from the 'requires' config, it should look like:

    "requires": [
           "font-ext"
       ],

If using a modern toolkit theme, the following file should be modified to remove the legacy
package dependency:

    ext/src/modern/theme-neptune/package.json

Remove the legacy "font-awesome" package from the 'requires' config, it should look like:

    "requires": [
           "font-ext"
       ],

The fa-content() function in _variables.sss strips the slash and needed to be changed.  It 
previously returned 'unquote("\"#{ $fa-var }\"");'.  It was changed to return only '$fa-var'.

UPDATE 11/16/2018 - The below comments about quoting the values in _variables.css is now handled
in the build script.  This no longer needs to be done manually.  Skip to the lines starting
with "To include the package in the build".  The below comments are left for reference.

The _variables.scss file in the 5.1 Pro version also came packaged with unquoted values.  This 
needed to be edited as well as, manually quoting all of the listd values of the property/value
pairs.

For example, out of the box, values were defined like the following:

    $fa-var-address-card: \f2bb;

This needed to be changed to:

    $fa-var-address-card: "\f2bb";

If these values are not quoted, improper conversion in compilation occurs in the css, and
the icon content gets defined without the required preceding '\', like so:

    content: "f2bb"

The value needs to be:

    content: "\f2bb"

To include the package in the build, be sure to add the package name to the list of required
packages in the application's app.json file (and removing the original "font-awesome" package):

    "requires": [
        "fontawesome",
        ...
    ]

Set the value $fa-font-path in the _variables.scss file to :

    ../../resources/fontawesome/webfonts

    IMPORTANT:  The "!default" tag must be removed or the orig f-font-path value
    set by Ext toolkit will not get overridden

## Builds by spmeesseman

|Package|Use Case|Repository|Marketplace|
|-|-|-|-|
|code-package|Code Dev Environment|[GitHub](https://github.com/spmeesseman/code-package)|[GIthub Releases](https://github.com/spmeesseman/code-package/releases)|
|conventional-changelog-spm|Semantic-Release|[GitHub](https://github.com/spmeesseman/conventional-changelog-spm)|[Npmjs.org Registry](https://www.npmjs.com/package/conventional-changelog-spm)|
|extjs-pkg-fontawesome|ExtJS Open Tooling|[GitHub](https://github.com/spmeesseman/extjs-pkg-fontawesome)|[Npmjs.org Registry](https://www.npmjs.com/package/extjs-pkg-fontawesome)|
|extjs-pkg-fontawesome-pro|ExtJS Open Tooling|[GitHub](https://github.com/spmeesseman/extjs-pkg-fontawesome-pro)|[Npmjs.org Private Registry](https://www.npmjs.com/package/@spmeesseman/extjs-pkg-fontawesome-pro)|
|extjs-pkg-plyr|ExtJS Open Tooling|[GitHub](https://github.com/spmeesseman/extjs-pkg-plyr)|[Npmjs.org Registry](https://www.npmjs.com/package/extjs-pkg-plyr)|
|extjs-pkg-tinymce|ExtJS Open Tooling|[GitHub](https://github.com/spmeesseman/extjs-pkg-tinymce)|[Npmjs.org Registry](https://www.npmjs.com/package/extjs-pkg-tinymce)|
|extjs-pkg-websocket|ExtJS Open Tooling|[GitHub](https://github.com/spmeesseman/extjs-pkg-websocket)|[Npmjs.org Registry](https://www.npmjs.com/package/extjs-pkg-websocket)|
|extjs-pkg-webworker|ExtJS Open Tooling|[GitHub](https://github.com/spmeesseman/extjs-pkg-webworker)|[Npmjs.org Registry](https://www.npmjs.com/package/extjs-pkg-webworker)|
|extjs-server-net|ExtJS Open Tooling|SVN (Private)|Private|
|extjs-theme-graphite-small|ExtJS Open Tooling|[GitHub](https://github.com/spmeesseman/extjs-theme-graphite-small)|[Npmjs.org Private Registry](https://www.npmjs.com/package/@spmeesseman/extjs-theme-graphite-small)|
|extjs-theme-amethyst|ExtJS Open Tooling|[GitHub](https://github.com/spmeesseman/extjs-theme-amethyst)|[Npmjs.org Registry](https://www.npmjs.com/package/extjs-theme-amethyst)|
|svn-scm-ext|Visual Studio Code|[GitHub](https://github.com/spmeesseman/svn-scm-ext)|[Visual Studio Marketplace](https://marketplace.visualstudio.com/itemdetails?itemName=spmeesseman.svn-scm-ext)|
|vscode-taskexplorer|Visual Studio Code|[GitHub](https://github.com/spmeesseman/vscode-taskexplorer)|[Visual Studio Marketplace](https://marketplace.visualstudio.com/itemdetails?itemName=spmeesseman.vscode-taskexplorer)|
|vscode-vslauncher|Visual Studio Code|[GitHub](https://github.com/spmeesseman/vscode-vslauncher)|[Visual Studio Marketplace](https://marketplace.visualstudio.com/itemdetails?itemName=spmeesseman.vscode-vslauncher)|
