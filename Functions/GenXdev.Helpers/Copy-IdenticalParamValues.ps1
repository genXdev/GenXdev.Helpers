﻿###############################################################################
<#
.SYNOPSIS
Copies parameter values from bound parameters to a new hashtable based on
another function's possible parameters.

.DESCRIPTION
This function creates a new hashtable containing only the parameter values that
match the parameters defined in the specified target function.
This can then be used to invoke the function using splatting.

Switch parameters are only included in the result if they were explicitly provided
and set to $true in the bound parameters. Non-present switch parameters are
excluded from the result to maintain proper parameter semantics.

.PARAMETER BoundParameters
The bound parameters from which to copy values, typically $PSBoundParameters.

.PARAMETER FunctionName
The name of the function whose parameter set will be used as a filter.

.PARAMETER DefaultValues
Default values for non-switch parameters that are not present in BoundParameters.

.EXAMPLE
function Test-Function {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string] $Path,
        [Parameter(Mandatory = $false)]
        [switch] $Recurse
    )

    $params = GenXdev.Helpers\Copy-IdenticalParamValues -BoundParameters $PSBoundParameters `
        -FunctionName 'Get-ChildItem'

    Get-ChildItem @params
}

.NOTES
- Switch parameters are only included if explicitly set to $true
- Default values are only applied to non-switch parameters
- Common PowerShell parameters are automatically filtered out
#>
function Copy-IdenticalParamValues {

    [CmdletBinding()]
    [OutputType([hashtable])]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    param(
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'Source bound parameters to copy from'
        )]
        [ValidateNotNull()]
        [object[]] $BoundParameters,
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 1,
            HelpMessage = 'Target function name to filter parameters'
        )]
        [ValidateNotNullOrEmpty()]
        [string] $FunctionName,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = 'Default values for parameters'
        )]
        [System.Management.Automation.PSVariable[]] $DefaultValues = @()
        ########################################################################
    )

    begin {

        # define common parameters to filter out
        $filter = @(
            'input',
            'MyInvocation',
            'null',
            'PSBoundParameters',
            'PSCmdlet',
            'PSCommandPath',
            'PSScriptRoot',
            'Verbose',
            'Debug',
            'ErrorAction',
            'ErrorVariable',
            'WarningAction',
            'WarningVariable',
            'InformationAction',
            'InformationVariable',
            'OutVariable',
            'OutBuffer',
            'PipelineVariable',
            'WhatIf',
            'Confirm',
            'OutVariable',
            'ProgressAction',
            'ErrorVariable',
            'Passthru',
            'PassThru'
        )

        # initialize results hashtable
        [hashtable] $results = @{}

        # create hashtable of default parameter values
        [hashtable] $defaults = (& {
                $defaultsHash = @{}

                $DefaultValues |
                    Microsoft.PowerShell.Core\Where-Object -Property Options -EQ 'None' |
                    Microsoft.PowerShell.Core\ForEach-Object {
                        if ($filter.IndexOf($_.Name) -lt 0) {

                            if (-not ($_.Value -is [string] -and
                                    [string]::IsNullOrWhiteSpace($_.Value))) {

                                if ($null -ne $_.Value) {

                                    $defaultsHash."$($_.Name)" = $_.Value
                                }
                            }
                        }
                    }

                $defaultsHash
            })

        # get function info for parameter validation
        Microsoft.PowerShell.Utility\Write-Verbose "Getting command info for function '$FunctionName'"
        $functionInfo = Microsoft.PowerShell.Core\Get-Command -Name $FunctionName -ErrorAction SilentlyContinue

        # validate function exists
        if ($null -eq $functionInfo -or $null -eq $functionInfo.Parameters) {

            Microsoft.PowerShell.Utility\Write-Error "Function '$FunctionName' not found"
            return
        }

        Microsoft.PowerShell.Utility\Write-Verbose "Found function with $($functionInfo.Parameters.Count) parameters"
    }


    process {

        # iterate through all parameters of the target function
        $functionInfo.Parameters.Keys | Microsoft.PowerShell.Core\ForEach-Object {

            # get parameter name
            $paramName = $_
            $paramInfo = $functionInfo.Parameters[$paramName]

            # check if parameter exists in bound parameters
            if ($BoundParameters.ContainsKey($paramName)) {

                Microsoft.PowerShell.Utility\Write-Verbose "Copying value for parameter '$paramName'"
                $value = $BoundParameters[0].GetEnumerator() |
                    Microsoft.PowerShell.Core\Where-Object -Property Key -EQ $paramName |
                    Microsoft.PowerShell.Utility\Select-Object -Property 'Value'

                    $paramValue = $value.Value

                    # For switch parameters, only include if explicitly set to $true
                    if ($paramInfo.ParameterType -eq [System.Management.Automation.SwitchParameter]) {
                        if ($paramValue -eq $true) {
                            $results."$paramName" = $paramValue
                            Microsoft.PowerShell.Utility\Write-Verbose "Including switch parameter '$paramName' (explicitly set to true)"
                        }
                        else {
                            Microsoft.PowerShell.Utility\Write-Verbose "Excluding switch parameter '$paramName' (not set or false)"
                        }
                    }
                    else {
                        $results."$paramName" = $paramValue
                    }
                }
                else {
                    # Only add default values for non-switch parameters
                    if ($paramInfo.ParameterType -ne [System.Management.Automation.SwitchParameter]) {
                        $defaultValue = $defaults."$paramName"

                        if ($null -ne $defaultValue) {

                            $results."$paramName" = $defaultValue

                            Microsoft.PowerShell.Utility\Write-Verbose ("Using default value for '$paramName': " +
                            ($defaultValue | Microsoft.PowerShell.Utility\ConvertTo-Json -Depth 1 -WarningAction SilentlyContinue -ErrorAction SilentlyContinue))
                        }
                    }
                    else {

                        $defaultValue = $defaults."$paramName"

                        if ($true -eq $defaultValue) {

                            $results."$paramName" = $True

                            Microsoft.PowerShell.Utility\Write-Verbose ("Using default value for '$paramName': `$True")
                        }
                    }
                }
            }
        }

        end {

            Microsoft.PowerShell.Utility\Write-Verbose "Returning hashtable with $($results.Count) parameters"
            $results
        }
    }