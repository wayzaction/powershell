function Counter {

[CmdletBinding()]

param(
[Parameter(ValueFromPipeline=$true)]
$Tekst
     )


BEGIN {
$global:Letters = 0
      }


PROCESS {
$global:Letters = $Tekst.Length
Write-Output "$($global:Letters): $Tekst"
        }


END {
Write-Host "Done" -ForegroundColor Green
    }
    
                }

"TON", "Jupiter", "ATLAS" | Counter
