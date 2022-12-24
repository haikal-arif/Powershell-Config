$SHORTENED_DIRS = [PSCustomObject]@{
'A:'='A';'B:'='B';'C:'='C';'D:'='D';'E:'='E';'F:'='F';'G:'='G';'H:'='H';'I:'='I';'J:'='J';'K:'='K';'L:'='L';'M:'='M';
'N:'='N';'O:'='O';'P:'='P';'Q:'='Q';'R:'='R';'S:'='S';'T:'='T';'U:'='U';'V:'='V';'W:'='W';'X:'='X';'Y:'='Y';'Z:'='Z'
AppData='AppData'
Documents='Docs'
projects='proj'
Images='Imgs'
Downloads='Dwnlds'
Pictures='Pics'
Videos='Vids'
Users='Usrs'
OneDrive='Drv'
personal='pers'
vscode='vsc'
extensions='exts'
'Program Files'='Prgrms'
'Program Files (x86)'='Prgrmsx86'
'Program Data'='PrgrmDat'
Windows='Win'
}
$HOMEDRIVE = $env:HOMEDRIVE
$SHORTENED_DIRS."$HOMEDRIVE" = ''

Function Get-ShortenedPath {param([string]$prop,[boolean]$long)
$shrt = $SHORTENED_DIRS."$prop"
	If ($shrt -ne $null) {$shrt}
	ElseIf ($long) {@($prop[0];$prop.Substring(1).ToCharArray() | %{if($_ -notlike "[aeiou]") {$_}}) -join ''} 
	Else {$prop[0]}
}

Function prompt {
	$pre = $((''+$PWD.Path).replace($HOME, '~'))
	$dirs = $pre.Split("\")
	$shrt = @($dirs | %{$i=1}{
		If ($i -eq $dirs.Length) {"$_"}
		ElseIf ($dirs.Length -le 4) {"$_"}
		Else {Get-ShortenedPath "$_" ($i -eq ($dirs.Length-1))}
		$i++
	})
	$prmpt = $shrt -join "\"
	$UNAME = "$([char]27)[34m$Env:UserName@$Env:Computername$([char]27)[0m"
	$prmpt = "$([char]27)[35m$prmpt$([char]27)[0m"
	"`r`n┌──($UNAME)-[$prmpt] `r`n└─$ "
}

function initPath () {
    Set-Alias -Name putty -Value "C:\Program Files\PuTTY\putty.exe"
    Set-Alias -Name nvim -Value "C:\Program Files\Neovim\bin\nvim.exe"
    Set-Alias -Name grep -Value Select-String
    Set-Alias gnuplot 'C:\Program Files\gnuplot\bin\gnuplot.exe'
    Set-Alias -Name vcpkg -Value C:\Users\mhaikala\AppData\Local\vcpkg\vcpkg.exe
}
# oh-my-posh init pwsh | Invoke-Expression
# Import-Module posh-git

