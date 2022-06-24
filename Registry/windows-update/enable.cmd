@echo off
setlocal


call "%~dp0common.cmd"

REGEDIT /S "%~dp001-common-group-policy.reg"
REGEDIT /S "%~dp011-common-service.reg"
REGEDIT /S "%~dp021-common-control-panel.reg"
REGEDIT /S "%~dp031-common-settings.reg"
REGEDIT /S "%~dp041-common-miscellaneous.reg"
REGEDIT /S "%~dp099-enable.reg"
