###############################################################################
<#
.SYNOPSIS
Imports all GenXdev PowerShell modules into the global scope.

.DESCRIPTION
Scans the parent directory for GenXdev modules and imports each one into the
global scope. Uses location stack management to preserve the working directory
and provides visual feedback for successful and failed imports. Tracks function
count changes during the import process.

.PARAMETER DebugFailedModuleDefinitions
When enabled, provides detailed debug output for modules that fail to import.

.EXAMPLE
Import-GenXdevModules -DebugFailedModuleDefinitions
Imports modules with debug output for failures

.EXAMPLE
reloadgenxdev
Imports all modules using the alias
#>
function Import-GenXdevModules {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        'PSUseSingularNouns', ''
    )]
    [Alias('reloadgenxdev')]
    ################################################################################
    param(
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Enable debug output for failed module definitions'
        )]
        [Switch] $DebugFailedModuleDefinitions
    )
    ################################################################################

    begin {

        # store current location for later restoration
        Microsoft.PowerShell.Utility\Write-Verbose 'Saving current location to location stack'
        Microsoft.PowerShell.Management\Push-Location

        # prepare console output variables
        $esc = [char]0x1b
        Microsoft.PowerShell.Utility\Write-Output (
            "$esc[36m$('## Reloading genXdev..'.PadRight([Console]::WindowWidth - 1, ' '))" +
            "$esc[0m"
        )

        # capture initial function count
        [int] $functionCountBefore = @(GenXdev.Helpers\Get-GenXDevCmdlets).Length
    }


    process {

        try {
            # navigate to modules parent directory
            Microsoft.PowerShell.Utility\Write-Verbose 'Changing to parent module directory'
            Microsoft.PowerShell.Management\Set-Location "$PSScriptRoot\..\..\..\.."

            # find and process each genxdev module
            Microsoft.PowerShell.Utility\Write-Verbose 'Scanning for GenXdev modules'
            Microsoft.PowerShell.Management\Get-ChildItem '.\GenXdev*' -dir |
                Microsoft.PowerShell.Core\ForEach-Object {

                    $name = $PSItem.Name
                    try {
                        # attempt module import
                        Microsoft.PowerShell.Utility\Write-Verbose "Importing module: $name"
                        $importError = $null

                        $null = Microsoft.PowerShell.Core\Import-Module -Name $name `
                            -Scope Global `
                            -ErrorVariable ImportError `
                            -Force

                        if (($null -ne $importError) -and ($importError.Length -gt 0)) {
                            throw ($ImportError | Microsoft.PowerShell.Utility\ConvertTo-Json -Depth 4 -ErrorAction SilentlyContinue -WarningAction SilentlyContinue)
                        }

                        # show success message
                        Microsoft.PowerShell.Utility\Write-Output (
                            "$esc[32m$("- [✅] $name".PadRight([Console]::WindowWidth - 1, ' '))" +
                            "$esc[0m"
                        )
                    }
                    catch {
                        if ($DebugFailedModuleDefinitions) {
                            # debug mode: validate and retry import
                            GenXdev.Coding\Assert-ModuleDefinition -ModuleName $name
                            $importError = $null

                            $null = Microsoft.PowerShell.Core\Import-Module $name `
                                -Scope Global `
                                -ErrorVariable ImportError `
                                -Force

                            if (($null -ne $importError) -and ($importError.Length -gt 0)) {
                                Microsoft.PowerShell.Utility\Write-Output (
                                    "$esc[91m$("- [❌] $importError".PadRight(
                                [Console]::WindowWidth - 1, ' '
                            ))$esc[0m"
                                )
                            }
                        }
                        else {
                            # show failure message
                            Microsoft.PowerShell.Utility\Write-Verbose "Failed to import module: $name"
                            Microsoft.PowerShell.Utility\Write-Output (
                                "$esc[91m$("- [❌] $name".PadRight(
                            [Console]::WindowWidth - 1, ' '
                        ))$esc[0m"
                            )
                        }
                    }
                }
        }
        finally {
            # restore original location
            Microsoft.PowerShell.Utility\Write-Verbose 'Restoring original location'
            Microsoft.PowerShell.Management\Pop-Location
        }
    }

    end {

        # calculate and display function count changes
        [int] $functionCountAfter = @(GenXdev.Helpers\Get-GenXDevCmdlets).Length
        $functionsAdded = $functionCountAfter - $functionCountBefore

        $text = $functionsAdded -lt 0 ? (
            ", removed $($functionsAdded * -1) functions"
        ) : (
            $functionsAdded -eq 0 ? '' : ", added $functionsAdded functions"
        )

        Microsoft.PowerShell.Utility\Write-Output (
            "$esc[36m$("## Reloaded genXdev$text".PadRight(
                [Console]::WindowWidth - 1, ' '
            ))$esc[0m"
        )
    }
}