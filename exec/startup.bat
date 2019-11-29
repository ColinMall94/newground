@echo off

for /f "skip=1 delims={}, " %%A in ('wmic nicconfig get ipaddress') do for /f "tokens=1" %%B in ("%%~A") do set "IP=%%~B"
for /f "tokens=1 delims=:" %%j in ('ping %computername% -4 -n 1 ^| findstr Reply') do (
    set localip=%%j
)

echo To access scoreboard, type the following into a browser: %localip:~11%:3000

cd C:\***INSERT REPO LOCATION HERE***
npm start

pause
