@echo off
set _SCRIPT_PATH=%~p0
set _SCRIPT_DRIVE=%~d0

set var=%1
set file_name=%~n1

if exist %var%.docx (if exist %var%.bak.docx (del %var%.bak.docx))
if exist %var%.docx (ren %var%.docx %file_name%.bak.docx)

if exist %var:~0,-5%.docx (if exist %var:~0,-5%.bak.docx (del %var:~0,-5%.bak.docx))
if exist %var:~0,-5%.docx (ren %var:~0,-5%.docx %file_name%.bak.docx)

Rscript %_SCRIPT_DRIVE%%_SCRIPT_PATH%rmd-doc.R %1

if exist %var%.docx (start %var%.docx) else (start %var:~0,-4%.docx)
