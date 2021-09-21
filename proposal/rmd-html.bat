@echo off
set _SCRIPT_PATH=%~p0
set _SCRIPT_DRIVE=%~d0

set var=%1
set file_name=%~n1

if exist %var%.html (if exist %var%.bak.html (del %var%.bak.html))
if exist %var%.html (ren %var%.html %file_name%.bak.html)

if exist %var:~0,-5%.html (if exist %var:~0,-5%.bak.html (del %var:~0,-5%.bak.html))
if exist %var:~0,-5%.html (ren %var:~0,-5%.html %file_name%.bak.html)

Rscript %_SCRIPT_DRIVE%%_SCRIPT_PATH%rmd-html.R %1


if exist %var%.html (start %var%.html) else (start %var:~0,-4%.html)


