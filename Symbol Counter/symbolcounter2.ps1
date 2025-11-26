function Counter {

[CmdletBinding()]

param(
[Parameter(ValueFromPipeline=$true)]
$Text
     )


BEGIN {
$global:Letters = 0
Write-Host "String".PadRight(10),"Length"
      }


PROCESS {
$global:Letters = $Text.Length
Write-Host $Text.PadRight(10) $global:Letters
        }


END {
Write-Host "Done" -ForegroundColor Green
    }
                }

"Hollow", "Precise" | Counter
