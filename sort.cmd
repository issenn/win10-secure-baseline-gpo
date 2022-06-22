@echo off
setlocal

pushd %~dp0
bin\gpx.exe sort lgpo-machine.gpo.txt lgpo-user.gpo.txt
popd
