@ECHO ON
copy Startup.cmd "%USERPROFILE%\Startup.cmd"
copy tony_doskey d:\bashrc
PUSHD "%USERPROFILE%"
Startup.cmd /install
POPD