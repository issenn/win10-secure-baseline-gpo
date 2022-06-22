@echo off
setlocal

set gpo=GPO\{4131AA1E-426D-4FAD-A529-124F5BD646D3}\DomainSysvol\GPO
set machine=%gpo%\Machine\Registry.pol
set user=%gpo%\User\Registry.pol

pushd %~dp0
bin\LGPO.exe /q /parse /m %machine% > lgpo-machine-test.gpo.txt
bin\LGPO.exe /q /parse /u %user% > lgpo-user-test.gpo.txt
popd
