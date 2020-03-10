@echo off
set _SCRIPT_PATH=%~dp0

Rscript %_SCRIPT_PATH%rmd-pdf.R %1

set var=%1

if exist %var%.pdf (sumatra.bat %var%.pdf) else (sumatra.bat %var:~0,-4%.pdf)
