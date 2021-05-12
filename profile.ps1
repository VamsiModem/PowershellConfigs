
# only apply to terminals, don't apply to e.g. ISE.

if ($host.Name -eq 'ConsoleHost') {
    if (!(Get-Module -ListAvailable -Name posh-git)) {
        Install-Module -Name posh-git -Scope CurrentUser
    } 
    if (!(Get-Module -ListAvailable -Name oh-my-posh)) {
        Install-Module -Name oh-my-posh -Scope CurrentUser
    } 
    if (!(Get-Module -ListAvailable -Name PSReadLine )) {
        Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
    } 
    if (!(Get-Module -ListAvailable -Name z )) {
        Install-Module z -AllowClobber
    } 
    

    Import-Module PSReadLine

    # use vi bindings, but selectively re-enable others

    Set-PSReadLineOption -EditMode Vi

    Set-PSReadLineKeyHandler -Key Ctrl+a -Function SelectAll

    Set-PSReadLineKeyHandler -Key Ctrl+c -Function CopyOrCancelLine

    Set-PSReadLineKeyHandler -Key Ctrl+x -Function Cut

    Set-PSReadLineKeyHandler -Key Ctrl+v -Function Paste

    Set-PSReadLineKeyHandler -Key Shift+LeftArrow -Function SelectBackwardChar

    Set-PSReadLineKeyHandler -Key Shift+RightArrow -Function SelectForwardChar

    Set-PSReadLineKeyHandler -Key Ctrl+Shift+LeftArrow -Function SelectBackwardWord

    Set-PSReadLineKeyHandler -Key Ctrl+Shift+RightArrow -Function SelectNextWord

    Set-PSReadLineOption -PredictionSource History

    Set-PSReadLineOption -HistorySearchCursorMovesToEnd

    Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

    Set-PSReadLineKeyHandler -Key Shift+Tab -Function MenuComplete

    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward

    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

    Set-PSReadlineOption -BellStyle None

    Set-PSReadlineKeyHandler -Key Ctrl+Shift+C ` -BriefDescription CopyPathToClipboard ` -LongDescription "Copies the current path to the clipboard" ` -ScriptBlock { (Resolve-Path -LiteralPath $pwd).ProviderPath.Trim() | clip }

    # Make the "Command Predictions" a little more obvious

    Set-PSReadlineOption -Color @{

        "InlinePrediction" = [ConsoleColor]::DarkCyan

    }

    Import-Module oh-my-posh

    Set-PoshPrompt -Theme ~/.oh-my-posh.json

    # jump to frequently used directories with z

    Import-Module z

    # use the coreutils ls instead of Get-ChildItem

    function ls_alias { & 'C:\Program Files\Git\usr\bin\ls' --color=auto -hF $args }

    Set-Alias -Name ls -Value ls_alias -Option Private

    Import-Module "C:\Users\vmode\OneDrive\Documents\PowerShell\Modules\utils.psm1"

    Set-Alias -Name azt -value AZToken

}

