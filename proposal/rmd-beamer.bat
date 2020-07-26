@echo off
set _SCRIPT_PATH=%~p0
set _SCRIPT_DRIVE=%~d0

set var=%1
set file_name=%~n1

if exist %var%_beamer.pdf (if exist %var%_beamer.bak.pdf (del %var%_beamer.bak.pdf))
if exist %var%_beamer.pdf (ren %var%_beamer.pdf %file_name%_beamer.bak.pdf)

if exist %var:~0,-4%_beamer.pdf (if exist %var:~0,-4%_beamer.bak.pdf (del %var:~0,-4%_beamer.bak.pdf))
if exist %var%_beamer.pdf (ren %var:~0,-4%_beamer.pdf %file_name%_beamer.bak.pdf)

Rscript %_SCRIPT_DRIVE%%_SCRIPT_PATH%rmd-beamer.R %1

if exist %var%_beamer.pdf (sumatra.bat %var%_beamer.pdf) else (sumatra.bat %var:~0,-4%_beamer.pdf)
