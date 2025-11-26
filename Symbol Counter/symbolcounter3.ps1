function Counter {

<#

.SYNOPSIS

Character counter.


.DESCRIPTION

This function is a character counter of inserted words, creating a new row every word for better readability


.EXAMPLE

"We", "Are", "Online" | Counter


.EXAMPLE

"Yet", "Another", "Example", "Yeah" | Counter


.NOTES

Author: wayzaction

#>


[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact=”High”)]


param(
[Parameter(ValueFromPipeline=$true)]
$Text
     )


BEGIN {
$global:Letters = 0
Write-Host "String".PadRight(10),"Length"                   
      }


PROCESS {

if ($PSCmdlet.ShouldProcess("Should Process?")) {
$global:Letters = $Text.Length
Write-Host $Text.PadRight(10) $global:Letters
                               }
        }


END {
Write-Host "Done" -ForegroundColor Green
    }
                }

"Physics", "Redlight", "Fierce" | Counter
