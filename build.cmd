@echo off
setlocal

set gpo=GPO\{4131AA1E-426D-4FAD-A529-124F5BD646D3}\DomainSysvol\GPO
set machine=%gpo%\Machine\Registry.pol
set user=%gpo%\User\Registry.pol

pushd %~dp0
bin\LGPO.exe /q /r lgpo-machine.gpo.txt /w %machine%
bin\LGPO.exe /q /r lgpo-user.gpo.txt /w %user%
bin\gpx.exe polfix %machine% %user%
popd
