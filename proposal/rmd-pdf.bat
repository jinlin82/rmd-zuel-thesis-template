@echo off
set _SCRIPT_PATH=%~p0
set _SCRIPT_DRIVE=%~d0

set var=%1
set file_name=%~n1

if exist %var%.pdf (if exist %var%.bak.pdf (del %var%.bak.pdf))
if exist %var%.pdf (ren %var%.pdf %file_name%.bak.pdf)

if exist %var:~0,-4%.pdf (if exist %var:~0,-4%.bak.pdf (del %var:~0,-4%.bak.pdf))
if exist %var:~0,-4%.pdf (ren %var:~0,-4%.pdf %file_name%.bak.pdf)

Rscript %_SCRIPT_DRIVE%%_SCRIPT_PATH%rmd-pdf.R %1

if exist %var%.pdf (sumatra.bat %var%.pdf) else (sumatra.bat %var:~0,-4%.pdf)
