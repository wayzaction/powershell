function Counter {

[CmdletBinding()]

param(
[Parameter(ValueFromPipeline=$true)]
$Text
     )


BEGIN {
$global:Letters = 0 #Initialization
      }


PROCESS {
$global:Letters = $Text.Length
Write-Output "$($global:Letters): $Text"
        }


END {
Write-Host "Done" -ForegroundColor Green
    }
    
                }

"TON", "Jupiter", "ATLAS" | Counter
