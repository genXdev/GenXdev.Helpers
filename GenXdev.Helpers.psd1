#
# Module manifest for module 'GenXdev.Helpers'

@{

    # Script module or binary module file associated with this manifest.
    RootModule             = 'GenXdev.Helpers.psm1'

    # Version number of this module.
    ModuleVersion          = '1.38.2024'
    # Supported PSEditions
    # CompatiblePSEditions = @()

    # ID used to uniquely identify this module
    GUID                   = '2f62080f-0483-4421-8497-b3d433b65173'

    # Author of this module
    Author                 = 'GenXdev'

    # Company or vendor of this module
    CompanyName            = 'GenXdev'

    # Copyright statement for this module
    Copyright              = 'Copyright (c) 2021 GenXdev'

    # Description of the functionality provided by this module
    Description            = 'A Windows PowerShell module with helpers mostly used by other GenXdev modules'

    # Minimum version of the PowerShell engine required by this module
    PowerShellVersion      = '7.5.0'

    # # Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    DotNetFrameworkVersion = '7.0.408'

    # # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    ClrVersion             = '9.0.0'

    # Processor architecture (None, X86, Amd64) required by this module
    ProcessorArchitecture = 'Amd64'

    # Modules that must be imported into the global environment prior to importing this module
    RequiredModules        = @(

    )

    # Assemblies that must be loaded prior to importing this module
    RequiredAssemblies     = @(

        "GenXdev.Helpers.dll"
    )

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess       = @("GenXdev.Helpers.Load.ps1")

    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport      = '*'

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no Cmdlets to export.
    CmdletsToExport        = '*'

    # Variables to export from this module
    VariablesToExport      = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport        = '*'

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    ModuleList             = @("GenXdev.Helpers")

    # List of all files packaged with this module
    FileList               = @(
            "BouncyCastle.Cryptography.dll",
            "EmbedIO.dll",
            "GenXdev.Helpers.deps.json",
            "GenXdev.Helpers.dll",
            "GenXdev.Helpers.pdb",
            "GenXdev.Helpers.psd1",
            "GenXdev.Helpers.psm1",
            "LICENSE",
            "license.txt",
            "Microsoft.Bcl.AsyncInterfaces.dll",
            "Microsoft.Extensions.Configuration.Abstractions.dll",
            "Microsoft.Extensions.Configuration.Binder.dll",
            "Microsoft.Extensions.Configuration.dll",
            "Microsoft.Extensions.DependencyInjection.Abstractions.dll",
            "Microsoft.Extensions.DependencyInjection.dll",
            "Microsoft.Extensions.Diagnostics.Abstractions.dll",
            "Microsoft.Extensions.Diagnostics.dll",
            "Microsoft.Extensions.Http.dll",
            "Microsoft.Extensions.Logging.Abstractions.dll",
            "Microsoft.Extensions.Logging.dll",
            "Microsoft.Extensions.Options.ConfigurationExtensions.dll",
            "Microsoft.Extensions.Options.dll",
            "Microsoft.Extensions.Primitives.dll",
            "Microsoft.Windows.SDK.NET.dll",
            "Newtonsoft.Json.dll",
            "OpenAI_API.dll",
            "powershell.jpg",
            "README.md",
            "SpotifyAPI.Web.Auth.dll",
            "SpotifyAPI.Web.dll",
            "SuperSocket.ClientEngine.dll",
            "Swan.Lite.dll",
            "System.Diagnostics.DiagnosticSource.dll",
            "WebSocket4Net.dll",
            "WinRT.Runtime.dll"
              )

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData            = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags                     = 'GenXdev'

            # A URL to the license for this module.
            LicenseUri               = 'https://raw.githubusercontent.com/genXdev/GenXdev.Helpers/main/LICENSE'

            # A URL to the main website for this project.
            ProjectUri               = 'https://github.com/genXdev/GenXdev.Helpers'

            # A URL to an icon representing this module.
            IconUri                  = 'https://genxdev.net/favicon.ico'

            # ReleaseNotes of this module
            # ReleaseNotes = ''

            # Prerelease string of this module
            # Prerelease = ''

            # Flag to indicate whether the module requires explicit user acceptance for install/update/save
            RequireLicenseAcceptance = $true

            # External dependent modules of this module
            # ExternalModuleDependencies = @()

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    HelpInfoURI            = 'https://github.com/genXdev/GenXdev.Helpers/blob/main/README.md#cmdlet-index'

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''
}
