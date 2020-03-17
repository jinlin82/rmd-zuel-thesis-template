@echo off
set _SCRIPT_PATH=%~p0

if not exist .\misc\cover.pdf (officetopdf.exe .\misc\cover.docx .\misc\cover.pdf)

Rscript %_SCRIPT_PATH%\bookdown-pdf.R %1

del *main.md *main.tex *main.rds *main.thm

for /f "delims=" %%a in ('dir *main.pdf /s /b *.sln') do set "name=%%~nxa"
sumatra.bat .\_book\%name%
