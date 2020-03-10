@echo off
set _SCRIPT_PATH=%~dp0

Rscript %_SCRIPT_PATH%rmd-doc.R %1

set var=%1

if exist %var%.docx (start %var%.docx) else (start %var:~0,-4%.docx)
