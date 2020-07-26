@echo off
set _SCRIPT_PATH=%~p0
set _SCRIPT_DRIVE=%~d0

if not exist .\misc\cover.pdf (officetopdf.exe .\misc\cover.docx .\misc\cover.pdf)

for /f "delims=" %%a in ('dir *main.pdf /s /b *.sln') do set "name=%%~nxa"

if exist .\_book\%name:~0,-4%.pdf (if exist .\_book\%name:~0,-4%.bak.pdf (del .\_book\%name:~0,-4%.bak.pdf)) 

if exist .\_book\%name:~0,-4%.pdf (ren .\_book\%name:~0,-4%.pdf %name:~0,-4%.bak.pdf)

Rscript %_SCRIPT_DRIVE%%_SCRIPT_PATH%bookdown-pdf.R %1

del *main.md *main.tex *main.rds *main.thm

if exist .\_book\%name% (sumatra.bat .\_book\%name%) else (sumatra.bat .\_book\%name:~0,-4%.pdf)
