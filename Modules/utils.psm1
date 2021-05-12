function AZToken {
[alias("azt")]
    param (
        [Parameter(Mandatory=$false,
                    HelpMessage="Error from computer.")] 
        [switch]$graph
    )
    BEGIN {
        if ($graph){
            $graphToken = az account get-access-token --resource-type ms-graph | ConvertFrom-Json
            $graphToken.accessToken | Set-Clipboard
            Write-Output "Copied graph token to clipboard!"
        } else {
            $token = az account get-access-token | ConvertFrom-Json
            $token.accessToken | Set-Clipboard
            Write-Output "Copied access token to clipboard!"
        }
    }
}
Export-ModuleMember -Function AZToken