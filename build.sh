#!/bin/bash

cd "$(dirname ${BASH_SOURCE[0]})"

FADIR=node_modules/@fortawesome/fontawesome-pro

if [ ! -d $FADIR/scss ]; then
    FADIR=node_modules/@fortawesome/fontawesome-free
    if [ ! -d $FADIR/scss ]; then
        echo Font Awesome files not found!!
        exit
    fi
fi

if [ ! -d resources/webfonts ]; then
    mkdir -p resources/webfonts
fi
cp -f $FADIR/webfonts/*.* resources/webfonts
cp -f $FADIR/scss/*.* sass/etc

sed -i 's/@return unquote("\\"#{ $fa-var }\\"");/@return $fa-var;/g' sass/etc/_variables.scss
sed -i 's/"..\/webfonts" !default/"..\/..\/resources\/font-awesome-pro\/webfonts"/g' sass/etc/_variables.scss
sed -i 's/font-awesome-$FA_VERSION\/webfonts/font-awesome-pro\/webfonts/g' sass/etc/_variables.scss
sed -i 's/$fa-font-path:/@import "v4variables";\r\n\r\n$fa-font-path:/g' sass/etc/_variables.scss
sed -i 's/ \\f/ "\\f/g' sass/etc/_variables.scss
sed -i 's/0;/0";/g' sass/etc/_variables.scss
sed -i 's/1;/1";/g' sass/etc/_variables.scss
sed -i 's/2;/2";/g' sass/etc/_variables.scss
sed -i 's/3;/3";/g' sass/etc/_variables.scss
sed -i 's/4;/4";/g' sass/etc/_variables.scss
sed -i 's/5;/5";/g' sass/etc/_variables.scss
sed -i 's/6;/6";/g' sass/etc/_variables.scss
sed -i 's/7;/7";/g' sass/etc/_variables.scss
sed -i 's/8;/8";/g' sass/etc/_variables.scss
sed -i 's/9;/9";/g' sass/etc/_variables.scss
sed -i 's/a;/a";/g' sass/etc/_variables.scss
sed -i 's/b;/b";/g' sass/etc/_variables.scss
sed -i 's/c;/c";/g' sass/etc/_variables.scss
sed -i 's/d;/d";/g' sass/etc/_variables.scss
sed -i 's/e;/e";/g' sass/etc/_variables.scss
sed -i 's/f;/f";/g' sass/etc/_variables.scss

exit
