@echo off

rem **** Get the DocFx tools ****
rem choco install docfx-companion-tools -y

rem **** Check for markdown erros
echo Checking markdown syntax
call markdownlint docs/*.md
if errorlevel == 1 goto error

rem **** Check the docs folder. On errors, quit processing
echo Checking references and attachments
doclinkchecker -d ./docs -a
if errorlevel == 1 goto error

rem **** Generate the table of contents
echo Generating table of contents for General
docfxtocgenerator -d ./docs/general -sri
if errorlevel == 1 goto error

echo Generating table of contents for Services
docfxtocgenerator -d ./docs/services -sri
if errorlevel == 1 goto error

rem **** Clean up old generated files
echo Clean up previous generated contents
if exist docs\_site rd docs\_site /s /q
if exist docx\_pdf rd docs\_pdf /s /q
if exist docs\reference rd docs\reference /s /q

rem **** Generated the website
echo Generating website in _site
docfx .\docs\docfx.json %1

goto end

:error
echo *** ERROR *** 
echo An error occurred. Website was not generated.

:end