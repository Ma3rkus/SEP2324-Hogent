@echo off
REM Post-installation script for winserv1

REM Create a scheduled task to run a PowerShell script on startup
schtasks /create /tn "post-install.ps1" /tr "powershell.exe -ExecutionPolicy Bypass -File 'Z:\winserv2-post-install.ps1'" /sc onstart /ru System /RL HIGHEST

REM Force install the VirtualBox Guest Additions
E:\vboxadditions\VBoxWindowsAdditions.exe /with_autologon /S

REM Check if the first command succeeded, if so reboot the VM
if %ERRORLEVEL% == 0 (
    shutdown /r /t 0
)
