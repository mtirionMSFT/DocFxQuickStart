@echo off

rem **** Get the DocFx tools ****
rem choco install docfx-companion-tools -y

rem **** Check for markdown erros
echo Checking markdown syntax
call markdownlint **/docs/*.md
if errorlevel == 1 goto error

rem **** Check the docs folder. On errors, quit processing
echo Checking references and attachments
doclinkchecker -d ./docs -a
if errorlevel == 1 goto error

rem **** Generate the table of contents of the docs folder. On errors, quit processing
echo Generating table of contents
docfxtocgenerator -d ./docs -sri
if errorlevel == 1 goto error

rem **** Clean up old generated files
echo Clean up previous generated contents
if exist _site rd _site /s /q
if exist _pdf rd _pdf /s /q
if exist obj rd obj /s /q
if exist docs\reference rd docs\reference /s /q

rem **** Generated the website
echo Generating website in _site
docfx %1

goto end

:error
echo *** ERROR *** 
echo An error occurred. Website was not generated.

:end