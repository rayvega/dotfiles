
# edit mode
Set-PSReadlineOption -EditMode Emacs

# git
<# if install using choco and encounter issues then remove the import command below. 
   this will resolve the issue since the command will automatically be added to this 
   file and reference an absolute path instead of the module name. #>
Import-Module posh-git

# chocolatey
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# docker
Import-Module posh-docker

# dotnet core cli 
<# https://github.com/dotnet/cli/blob/master/Documentation/general/tab-completion.md#powershell #>
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($commandName, $wordToComplete, $cursorPosition)
        dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
           [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}