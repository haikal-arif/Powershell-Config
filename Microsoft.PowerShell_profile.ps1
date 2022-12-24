$CONFIGDIR = "(Get-Item $PROFILE).Directory.fullname"
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/blueish.omp.json" | Invoke-Expression
