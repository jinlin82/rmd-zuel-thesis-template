@echo off
set _SCRIPT_PATH=%~dp0

Rscript %_SCRIPT_PATH%rmd-beamer.R %1


set var=%1

if exist %var%_beamer.pdf (sumatra.bat %var%_beamer.pdf) else (sumatra.bat %var:~0,-4%_beamer.pdf)