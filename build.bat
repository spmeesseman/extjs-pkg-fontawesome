
@echo off
cd %~dp0

set FADIR=node_modules\@fortawesome\fontawesome-pro

if not exist %FADIR%\scss  (
    set FADIR=node_modules\@fortawesome\fontawesome-free
    if not exist %FADIR%\scss  (
        echo Font Awesome files not found!!
        exit
    )
)

mkdir resources
mkdir resources\webfonts
xcopy %FADIR%\webfonts\* resources\webfonts /s /i /y

xcopy %FADIR%\scss\* sass\etc /s /i /y

setlocal EnableDelayedExpansion
set LF=^


cscript //B script\substitute.vbs "@return unquote('\'#{ $fa-var }\'');" "@return $fa-var;" sass\etc\_variables.scss > sass\etc\_variables.scss.1
cscript //B script\substitute.vbs "'../webfonts' ^!default" "'../../resources/fontawesome/webfonts'" sass\etc\_variables.scss.1 > sass\etc\_variables.scss
cscript //B script\substitute.vbs "font-awesome-${FontAwesomeVersion}/webfonts" "fontawesome/webfonts" sass\etc\_variables.scss > sass\etc\_variables.scss.1
cscript //B script\substitute.vbs $fa-font-path: "@import 'v4variables';!LF!!LF!$fa-font-path:" sass\etc\_variables.scss.1 > sass\etc\_variables.scss
cscript //B script\substitute.vbs " \f" " '\f" sass\etc\_variables.scss > sass\etc\_variables.scss.1
cscript //B script\substitute.vbs "0;" "0';" sass\etc\_variables.scss.1 > sass\etc\_variables.scss
cscript //B script\substitute.vbs "1;" "1';" sass\etc\_variables.scss > sass\etc\_variables.scss.1
cscript //B script\substitute.vbs "2;" "2';" sass\etc\_variables.scss.1 > sass\etc\_variables.scss
cscript //B script\substitute.vbs "3;" "3';" sass\etc\_variables.scss > sass\etc\_variables.scss.1
cscript //B script\substitute.vbs "4;" "4';" sass\etc\_variables.scss.1 > sass\etc\_variables.scss
cscript //B script\substitute.vbs "5;" "5';" sass\etc\_variables.scss > sass\etc\_variables.scss.1
cscript //B script\substitute.vbs "6;" "6';" sass\etc\_variables.scss.1 > sass\etc\_variables.scss
cscript //B script\substitute.vbs "7;" "7';" sass\etc\_variables.scss > sass\etc\_variables.scss.1
cscript //B script\substitute.vbs "8;" "8';" sass\etc\_variables.scss.1 > sass\etc\_variables.scss
cscript //B script\substitute.vbs "9;" "9';" sass\etc\_variables.scss > sass\etc\_variables.scss.1
cscript //B script\substitute.vbs "a;" "9';" sass\etc\_variables.scss.1 > sass\etc\_variables.scss
cscript //B script\substitute.vbs "b;" "b';" sass\etc\_variables.scss > sass\etc\_variables.scss.1
cscript //B script\substitute.vbs "c;" "c';" sass\etc\_variables.scss.1 > sass\etc\_variables.scss
cscript //B script\substitute.vbs "d;" "d';" sass\etc\_variables.scss > sass\etc\_variables.scss.1
cscript //B script\substitute.vbs "e;" "e';" sass\etc\_variables.scss.1 > sass\etc\_variables.scss
cscript //B script\substitute.vbs "f;" "f';" sass\etc\_variables.scss > sass\etc\_variables.scss.1

move /Y sass\etc\_variables.scss.1 sass\etc\_variables.scss
