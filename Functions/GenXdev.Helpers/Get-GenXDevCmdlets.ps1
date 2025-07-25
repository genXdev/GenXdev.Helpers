###############################################################################
<#
.SYNOPSIS
Retrieves and lists all GenXdev cmdlets and their details.

.DESCRIPTION
Searches through installed GenXdev modules and script files to find cmdlets,
their aliases, and descriptions. Can filter by name pattern and module name.

.PARAMETER Filter
Pattern to match cmdlet names or aliases. Supports wildcards (*).

.PARAMETER BaseModuleName
One or more GenXdev module names to search. Can omit GenXdev prefix.

.PARAMETER NoLocal
Skip searching in local module paths.

.PARAMETER OnlyPublished
Limit search to published module paths only.

.PARAMETER FromScripts
Search in script files instead of module files.

.PARAMETER OnlyReturnModuleNames
Only return unique module names instead of full cmdlet details.

.EXAMPLE
Get-GenXDevCmdlets -CmdletName "Get-*" -BaseModuleName "Console" -NoLocal

.EXAMPLE
gcmds Get-*

.EXAMPLE
Get-GenXDevCmdlets -OnlyReturnModuleNames
#>
function Get-GenXDevCmdlets {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', 'Get-GenXDevCmdlets')]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidTrailingWhitespace', '')]

    [Alias('gcmds')]
    param(
        ########################################################################
        [parameter(
            Position = 0,
            Mandatory = $false,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'Search pattern to filter cmdlets'
        )]
        [ValidateNotNull()]
        [Alias('Filter', 'CmdLet', 'Cmd', 'FunctionName', 'Name')]
        [SupportsWildcards()]
        [string] $CmdletName = '*',
        ########################################################################
        [parameter(
            Position = 1,
            Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'GenXdev module names to search'
        )]
        [ValidateNotNullOrEmpty()]
        [Alias('Module', 'ModuleName')]
        [ValidatePattern('^(GenXdev|GenXde[v]\*|GenXdev(\.\w+)+)+$')]
        [string[]] $BaseModuleName = @('GenXdev*'),
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Skip searching in local module paths'
        )]
        [switch] $NoLocal,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Only search in published module paths'
        )]
        [switch] $OnlyPublished,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Search in script files instead of modules'
        )]
        [switch] $FromScripts,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Only return unique module names'
        )]
        [switch] $OnlyReturnModuleNames,
        ########################################################################
        [switch] $ExactMatch
    )

    begin {

        # log search criteria for diagnostics
        Microsoft.PowerShell.Utility\Write-Verbose ("Searching for cmdlets matching '$CmdletName' in modules: " +
            "$($BaseModuleName -join ',')")

        # resolve path to scripts directory
        $scriptFilePath = GenXdev.FileSystem\Expand-Path `
            -FilePath "$PSScriptRoot\..\..\..\..\..\Scripts\*.ps1" `
            -CreateDirectory
    }


    process {

        if ($FromScripts) {

            $CmdletName = GenXdev.FileSystem\Expand-Path "$([IO.Path]::GetDirectoryName($ScriptFilePath))\$CmdletName.ps1"

            # process all ps1 files in scripts directory
            Microsoft.PowerShell.Management\Get-ChildItem $CmdletName -File -ErrorAction SilentlyContinue | Microsoft.PowerShell.Core\ForEach-Object {

                # skip test files to avoid processing test code
                if ($_.Name -like '*.Tests.ps1') { return }
                if ($_.Name -like '_AssertGenXdevUnitTests.ps1') { return }

                # read entire function content for processing
                $functionContent = [IO.File]::ReadAllText($_.FullName)

                # determine function definition start line
                $lineNo = GenXdev.Helpers\Get-FunctionStartLine -Content $functionContent

                # extract function aliases from content
                $aliases = GenXdev.Helpers\Get-FunctionAliases `
                    -FileName ($_.FullName) `
                    -FunctionContent $functionContent

                $scriptFilePath = $_.FullName
                # build path for corresponding test file
                $functionTestFilePath = GenXdev.FileSystem\Expand-Path `
                    -FilePath ([IO.Path]::ChangeExtension($_.FullName, '.Tests.ps1'))

                # return object with function details
                [PSCustomObject]@{
                    Name               = [IO.Path]::GetFileNameWithoutExtension(
                        $_.Name)
                    ModuleName         = 'GenXdev.Scripts'
                    BaseModule         = 'GenXdev.Scripts'
                    LineNo             = $lineNo
                    Description        = GenXdev.Helpers\Get-FunctionDescription `
                        -FileName ($_.FullName) `
                        -FunctionContent $functionContent
                    Aliases            = $aliases -join ', '
                    ScriptFilePath     = $scriptFilePath
                    ScriptTestFilePath = $functionTestFilePath
                }
            } | Microsoft.PowerShell.Utility\Sort-Object { $_.BaseModule + '_' + $_.ModuleName + '_' + $_.Name } | Microsoft.PowerShell.Core\ForEach-Object {
                if ($OnlyReturnModuleNames) {
                    $_.ModuleName
                } else {
                    $_
                }
            } | Microsoft.PowerShell.Core\ForEach-Object {
                $results = @($_)
                if ($OnlyReturnModuleNames) {
                    $results | Microsoft.PowerShell.Utility\Select-Object -Unique
                } else {
                    $results
                }
            }

            return
        }

        # handle single cmdlet test scenario
        if (-not [string]::IsNullOrWhiteSpace($CmdletName) -and ($CmdletName -ne '*')) {
            # If CmdletName doesn't contain wildcards, add them to search for partial matches
            $searchPattern = $CmdletName
            if ((-not $ExactMatch) -and
                    (-not ($CmdletName.Contains('*') -or $CmdletName.Contains('?')))
            ) {
                $searchPattern = "*$CmdletName*"
            }

            if ($OnlyReturnModuleNames) {
                # Return only unique module names
                Microsoft.PowerShell.Core\Get-Command -Name $searchPattern -CommandType @('Cmdlet', 'Function', 'Alias') -ErrorAction SilentlyContinue | Microsoft.PowerShell.Core\ForEach-Object {
                    $cmd = $_
                    [string] $BaseModule = $cmd.ModuleName
                    if ($BaseModule -notlike 'GenXdev*') { return }

                    # Check if BaseModule matches any of the BaseModuleName patterns
                    $moduleMatches = $false
                    foreach ($pattern in $BaseModuleName) {
                        if ($BaseModule -like $pattern) {
                            $moduleMatches = $true
                            break
                        }
                    }
                    if (-not $moduleMatches) { return }

                    $BaseModule
                } | Microsoft.PowerShell.Utility\Select-Object -Unique
            } else {
                # Return full cmdlet objects
                Microsoft.PowerShell.Core\Get-Command -Name $searchPattern -CommandType @('Cmdlet', 'Function', 'Alias') -ErrorAction SilentlyContinue | Microsoft.PowerShell.Core\ForEach-Object {

                    $cmd = $_

                    [string] $BaseModule = $cmd.ModuleName

                    if ($BaseModule -notlike 'GenXdev*') { return }

                    # Check if BaseModule matches any of the BaseModuleName patterns
                    $moduleMatches = $false
                    foreach ($pattern in $BaseModuleName) {
                        if ($BaseModule -like $pattern) {
                            $moduleMatches = $true
                            break
                        }
                    }
                    if (-not $moduleMatches) { return }

                    if ($cmd -is [System.Management.Automation.AliasInfo]) {
                        $cmd = $cmd.ResolvedCommand
                    }

                    $functionPath = GenXdev.FileSystem\Find-Item "$PSScriptRoot\..\..\..\..\..\Modules\$($BaseModule)\1.216.2025\Functions\*\$($cmd.Name).ps1" -PassThru | Microsoft.PowerShell.Core\ForEach-Object FullName

                    if ($null -eq $functionPath) { return }

                    Microsoft.PowerShell.Management\Get-ChildItem ($functionPath) -File -Recurse -ErrorAction SilentlyContinue | Microsoft.PowerShell.Core\ForEach-Object {

                        if ($_.Name -like '_AssertGenXdevUnitTests.ps1') { return }

                        # prepare function details
                        $functionContent = [IO.File]::ReadAllText($_.FullName)
                        if ([string]::IsNullOrWhiteSpace($functionContent)) { return }
                        $lineNo = GenXdev.Helpers\Get-FunctionStartLine -Content $functionContent
                        $aliases = GenXdev.Helpers\Get-FunctionAliases `
                            -FileName ($_.FullName) `
                            -FunctionContent $functionContent
                        $scriptFilePath = $_.FullName
                        $functionTestFilePath = GenXdev.FileSystem\Expand-Path `
                            -FilePath "$([IO.Path]::GetDirectoryName($ScriptFilePath))\..\..\Tests\$([IO.Path]::GetFileName([IO.Path]::GetDirectoryName($ScriptFilePath)))\$(
                        [IO.Path]::GetFileNameWithoutExtension($_.Name)).Tests.ps1" -CreateFile

                        # return function information object
                        [PSCustomObject]@{
                            Name               = [IO.Path]::GetFileNameWithoutExtension($_.Name)
                            ModuleName         = ([IO.Path]::GetFileName([IO.Path]::GetDirectoryName($_.FullName)))
                            BaseModule         = $BaseModule
                            LineNo             = $lineNo
                            Description        = (
                                GenXdev.Helpers\Get-FunctionDescription `
                                    -FileName ($_.FullName) `
                                    -FunctionContent $functionContent
                            )
                            Aliases            = $aliases -join ', '
                            ScriptFilePath     = $scriptFilePath
                            ScriptTestFilePath = $functionTestFilePath
                        }
                    }
                }
            }

            return;
        }

        # prepare module search parameters
        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -FunctionName 'GenXdev.Helpers\Invoke-OnEachGenXdevModule' `
            -BoundParameters $PSBoundParameters

        $allResults = GenXdev.Helpers\Invoke-OnEachGenXdevModule @invocationParams -Script {

            param($module)

            if (-not ($module.Name -like 'GenXdev*')) { return }

            [string] $BaseModule = $module.Name

            # process each function file in module
            @(Microsoft.PowerShell.Management\Get-ChildItem .\Functions\*.ps1 -File -Recurse `
                    -ErrorAction SilentlyContinue) | Microsoft.PowerShell.Core\ForEach-Object {

                if ($_.Name -like '*EnsureTypes*') {
                    return;
                }

                if ($_.Name -like '_AssertGenXdevUnitTests.ps1') { return }
                $functionContent = [IO.File]::ReadAllText($_.FullName)
                if ([string]::IsNullOrWhiteSpace($functionContent)) { return }
                $aliases = @(GenXdev.Helpers\Get-FunctionAliases `
                        -FileName ($_.FullName) `
                        -FunctionContent $functionContent)

                # prepare function details
                $lineNo = GenXdev.Helpers\Get-FunctionStartLine -Content $functionContent
                $scriptFilePath = $_.FullName
                $functionTestFilePath = GenXdev.FileSystem\Expand-Path `
                    -FilePath "$([IO.Path]::GetDirectoryName($ScriptFilePath))\..\..\Tests\$([IO.Path]::GetFileName([IO.Path]::GetDirectoryName($ScriptFilePath)))\$(
                    [IO.Path]::GetFileNameWithoutExtension($_.Name)).Tests.ps1" -CreateFile

                # return function information object
                [PSCustomObject]@{
                    Name               = [IO.Path]::GetFileNameWithoutExtension(
                        $_.Name)
                    ModuleName         = ([IO.Path]::GetFileName(
                            [IO.Path]::GetDirectoryName($_.FullName)))
                    BaseModule         = $BaseModule
                    LineNo             = $lineNo
                    Description        = GenXdev.Helpers\Get-FunctionDescription `
                        -FileName ($_.FullName) `
                        -FunctionContent $functionContent
                    Aliases            = $aliases -join ', '
                    ScriptFilePath     = $scriptFilePath
                    ScriptTestFilePath = $functionTestFilePath
                }
            }
        }.GetNewClosure() | Microsoft.PowerShell.Utility\Sort-Object { $_.BaseModule + '_' + $_.ModuleName + '_' + $_.Name }

        if ($OnlyReturnModuleNames) {
            $allResults | Microsoft.PowerShell.Core\ForEach-Object { $_.ModuleName } | Microsoft.PowerShell.Utility\Select-Object -Unique
        } else {
            $allResults
        }
    }

    end {
    }
}

###############################################################################
<#
.SYNOPSIS
Helper function to extract function descriptions from sourcecode.

.PARAMETER FileName
The path to the script file.

.PARAMETER FunctionContent
The content of the function to parse.
#>
function Get-FunctionDescription {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseOutputTypeCorrectly', 'Get-FunctionDescription')]
    [OutputType([string])]
    param(
        [Parameter(
            Position = 0,
            Mandatory = $true
        )]
        [string]$FileName,

        [Parameter(
            Position = 1,
            Mandatory = $true
        )]
        [AllowEmptyString()]
        [AllowNull()]
        [string]$FunctionContent
    )


    $FunctionContent = ($null -eq $FunctionContent) ? '' : $FunctionContent

    # check if file is in Scripts folder
    $FromScripts = $FileName.StartsWith((GenXdev.FileSystem\Expand-Path `
                -FilePath "$PSScriptRoot\..\..\..\..\..\Scripts\"))

    try {
        # build regex pattern based on file location
        $pattern = $FromScripts ?
        "\.SYNOPSIS\s*`r`n([^\r\n]*[\r\n]*)\r\n\r\n([^#][^>])*#>" :
            ("\.SYNOPSIS\s*`r`n([^\r\n]*[\r\n]*)\r\n\r\n([^#][^>])*#>\s*" +
        "function\s+$([IO.Path]::GetFileNameWithoutExtension($FileName))")

        # extract synopsis
        $match = [regex]::Match(
            $FunctionContent,
            $pattern,
            ([System.Text.RegularExpressions.RegexOptions]::IgnoreCase -bor
            [System.Text.RegularExpressions.RegexOptions]::IgnorePatternWhitespace)
        )

        if ($match.Success) {
            return $match.Groups[1].Value.Trim()
        }
    }
    catch {
        Microsoft.PowerShell.Utility\Write-Verbose "Failed to get description: $($_.Exception.Message)"
    }

    return ''
}

###############################################################################
<#
.SYNOPSIS
Helper function to extract function aliases from sourcecode.

.PARAMETER FileName
The path to the script file.

.PARAMETER FunctionContent
The content of the function to parse.
##############################################################################
#>

function Get-FunctionAliases {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseOutputTypeCorrectly', 'Get-FunctionAliases')]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', 'Get-FunctionAliases')]

    [OutputType([string])]
    param(
        [Parameter(
            Position = 0,
            Mandatory = $true
        )]
        [string]$FileName,

        [Parameter(
            Position = 1,
            Mandatory = $true
        )]
        [AllowEmptyString()]
        [AllowNull()]
        [string]$FunctionContent
    )

    $FunctionContent = $null -eq $FunctionContent ? '' : $FunctionContent

    try {
        $content = $FunctionContent.ToLowerInvariant();

        # extract aliases from module functions
        [int] $i = $content.IndexOf('#>');
        $i = $content.IndexOf(
            "function $([IO.Path]::GetFileNameWithoutExtension($FileName).ToLowerInvariant())", [Math]::Max(0, $i))

        if ($i -lt 0) {
            $i = $content.IndexOf('[cmdletbinding(', [Math]::Max(0, $i))
            if ($i -lt 0) {
                $i = 0
            }
        }
        $i2 = $content.IndexOf('param(', [Math]::Max(0, $i))
        if ($i2 -lt 0) {

            $i2 = $content.ToLowerInvariant().IndexOf('[parameter', [Math]::Max(0, $i))
        }
        $i = $content.IndexOf('[alias(', [Math]::Max(0, $i))

        if ($i -ge 0 -and $i2 -gt $i) {
            $aliases = $content.Substring($i + 7)
            $aliases = $aliases.Substring(0, $aliases.IndexOf(')')).Replace(
                "'", "`"")
            $aliases = $aliases -replace "[\)\[\]\`"]", ''
            return (@($aliases -split ',') | Microsoft.PowerShell.Core\ForEach-Object { $_.Trim() })
        }
    }
    catch {
        Microsoft.PowerShell.Utility\Write-Verbose "Failed to get aliases: $($_.Exception.Message)"
    }

    return [string]::Empty
}

###############################################################################
<#
.SYNOPSIS
Helper function to find the starting line number of a function.

.PARAMETER Content
The content to search for the function start.
#>
function Get-FunctionStartLine {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseOutputTypeCorrectly', 'Get-FunctionStartLine')]
    [OutputType([int])]
    param(
        [Parameter(
            Position = 0,
            Mandatory = $true
        )]
        [AllowEmptyString()]
        [AllowNull()]
        [string]$Content
    )

    $Content = ($null -eq $Content) ? '' : $Content

    $lineNo = $Content.IndexOf('#>')
    if ($lineNo -lt 0) { $lineNo = $Content.IndexOf('[CmdletBinding') }
    if ($lineNo -lt 0) { $lineNo = $Content.IndexOf('params') }
    if ($lineNo -lt 0) { $lineNo = $Content.IndexOf('begin {') }
    if ($lineNo -lt 0) {
        $lineNo = $Content.IndexOf('
process {') }
    if ($lineNo -lt 0) { $lineNo = 0 }
    else {
        $lineNo = $Content.Substring(0, $lineNo).Split("`n").Count + 1
    }

    return $lineNo
}