function Counter {

[CmdletBinding()]

param(

[Parameter(ValueFromPipeline=$true)]

$Text

     )


BEGIN {

$global:Letters = 0
Write-Host "String        Length"

      }


PROCESS {

$global:Letters = $Text.Length

Write-Host "$Text            $global:Letters"

        }


END {

Write-Host "Done" -ForegroundColor Green

    }

                }

"Hollow", "Precise" | Counter
