Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco upgrade chocolatey
choco install oh-my-posh
choco upgrade oh-my-posh
Install-Module oh-my-posh -Scope CurrentUser
Install-Module posh-git -Scope CurrentUser

$ProfileContet = @("Import-Module posh-git", "Import-Nodule oh-my-posh", "Set-PoshPrompt -Theme Paradox")

Set-Content -Path "C:\Users\$env:USERNAME\Documents\PowerShell\Microsoft.PowerShell_profile_2.ps1" -Value $ProfileContet

Invoke-WebRequest -Uri "https://github.com/microsoft/cascadia-code/releases/download/v2110.31/CascadiaCode-2110.31.zip" -OutFile "C:\Users\$env:USERNAME\Desktop\CascadiaCode-2110.31.zip"
Expand-Archive -Path "C:\Users\$env:USERNAME\Desktop\CascadiaCode-2110.31.zip" -DestinationPath "C:\Users\$env:USERNAME\Desktop\CascadiaCode-2110.31"
Get-ChildItem -Path "C:\Users\$env:USERNAME\Desktop\CascadiaCode-2110.31\ttf\" -Filter "*.ttf" | Copy-Item -Destination "C:\Windows\Fonts\"

