@echo off

for /f "delims=" %%A in ('cd') do (set foldername=%%~nxA)
if %foldername%==DocFx cd ..

rem **** Build the tools
echo Building the tools
dotnet publish src\TocDocFxCreation -o ./output/tools -r win-x64 /p:PublishSingleFile=true /p:DebugType=None /p:DebugSymbols=false /p:IncludeNativeLibrariesForSelfExtract=true --self-contained false
if errorlevel == 1 goto error
dotnet publish src\DocLinkChecker -o ./output/tools -r win-x64 /p:PublishSingleFile=true /p:DebugType=None /p:DebugSymbols=false /p:IncludeNativeLibrariesForSelfExtract=true --self-contained false
if errorlevel == 1 goto error
del tools\*.xml

rem **** Check for markdown erros
echo Checking markdown syntax
call markdownlint **/*.md
if errorlevel == 1 goto error

rem **** Check the docs folder. On errors, quit processing
echo Checking references and attachments
output\tools\DocLinkChecker.exe -d .\docs -a
if errorlevel == 1 goto error

rem **** Generate the table of contents of the docs folder. On errors, quit processing
echo Generating table of contents
output\tools\TocDocFxCreation.exe -d .\docs -sri
if errorlevel == 1 goto error

rem **** Clean up old generated files
echo Clean up previous generated contents
if exist output rd output /s /q
if exist obj rd obj /s /q

rem **** Generated the website
echo Generating website and PDF
docfx %1

goto end

:error
echo *** ERROR *** 
echo An error occurred. Website was not generated.

:end
if %foldername%==DocFx cd DocFx