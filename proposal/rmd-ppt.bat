@echo off
set _SCRIPT_PATH=%~p0
set _SCRIPT_DRIVE=%~d0

set var=%1
set file_name=%~n1

if exist %var%.pptx (if exist %var%.bak.pptx (del %var%.bak.pptx))
if exist %var%.pptx (ren %var%.pptx %file_name%.bak.pptx)

if exist %var:~0,-5%.pptx (if exist %var:~0,-5%.bak.pptx (del %var:~0,-5%.bak.pptx))
if exist %var:~0,-5%.pptx (ren %var:~0,-5%.pptx %file_name%.bak.pptx)

Rscript %_SCRIPT_DRIVE%%_SCRIPT_PATH%rmd-ppt.R %1

if exist %var%.pptx (start %var%.pptx) else (start %var:~0,-5%.pptx)
