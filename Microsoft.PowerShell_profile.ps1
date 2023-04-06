$CONFIGDIR = "(Get-Item $PROFILE).Directory.fullname"
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/blueish.omp.json" | Invoke-Expression

Import-Module 'C:\Users\mhaikala\AppData\Local\vcpkg\scripts\posh-vcpkg'
nvs use lts > NUL

Set-Alias -Name lg -Value lazygit
Set-Alias -Name vim -Value nvim

function Get-IP
{
  Get-NetIPAddress | Where-Object -Property AddressFamily -eq IPv4 | Select-Object -Property IPAddress
}
