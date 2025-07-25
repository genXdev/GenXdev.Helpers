#
# Module manifest for module 'GenXdev.Helpers'
#
# Generated by: genXdev
#
# Generated on: 25/07/2025
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'GenXdev.Helpers.psm1'

# Version number of this module.
ModuleVersion = '1.216.2025'

# Supported PSEditions
CompatiblePSEditions = 'Core'

# ID used to uniquely identify this module
GUID = '2f62080f-0483-4421-8497-b3d433b65173'

# Author of this module
Author = 'genXdev'

# Company or vendor of this module
CompanyName = 'GenXdev'

# Copyright statement for this module
Copyright = 'Copyright 2021-2025 GenXdev'

# Description of the functionality provided by this module
Description = 'A Windows PowerShell module with helpers mostly used by other GenXdev modules'

# Minimum version of the PowerShell engine required by this module
PowerShellVersion = '7.5.0'

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
ClrVersion = '9.0.0.1'

# Processor architecture (None, X86, Amd64) required by this module
ProcessorArchitecture = 'Amd64'

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @(@{ModuleName = 'Microsoft.WinGet.Client'; ModuleVersion = '1.10.340'; })

# Assemblies that must be loaded prior to importing this module
RequiredAssemblies = 'lib\GenXdev.CoreHelpers.dll', 'lib\GenXdev.Helpers.dll', 
               'lib\BouncyCastle.Cryptography.dll', 'lib\EmbedIO.dll', 'lib\JWT.dll', 
               'lib\NAudio.dll', 'lib\Ninject.dll', 'lib\OpenAI.dll', 
               'lib\SpotifyAPI.Web.dll', 'lib\SpotifyAPI.Web.Auth.dll', 
               'lib\System.Data.SQLite.dll', 'lib\Microsoft.Data.SqlClient.dll', 
               'lib\SpotifyAPI.Web.dll', 'lib\Whisper.net.dll', 
               'lib\WpfScreenHelper.dll'

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @('lib\GenXdev.Helpers.dll', 
               'GenXdev.Helpers.Math.Physics.psm1')

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'alignScript', 'ConvertTo-HashTable', 'ConvertTo-JsonEx', 
               'Copy-IdenticalParamValues', 'EnsureGenXdev', 
               'Get-DefaultWebLanguage', 'Get-FreeFallHeight', 'Get-FreeFallTime', 
               'Get-FunctionAliases', 'Get-FunctionDescription', 
               'Get-FunctionStartLine', 'Get-GenXDevCmdlets', 'Get-ImageGeolocation', 
               'Get-ImageMetadata', 'Get-WebLanguageDictionary', 
               'Import-GenXdevModules', 'Initialize-SearchPaths', 
               'Invoke-OnEachGenXdevModule', 'Out-Serial', 'Remove-JSONComments', 
               'Show-GenXDevCmdlets', 'Show-Verb'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = 'Convert-WavToText', 'Get-SpeechToText', 
               'Receive-RealTimeSpeechToText'

# Variables to export from this module
VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = 'cmds', 'foreach-genxdev-module-do', 'gcmds', 'reloadgenxdev', 
               'showverbs', 'tojsonex'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
ModuleList = @('GenXdev.Helpers')

# List of all files packaged with this module
FileList = 'GenXdev.Helpers.Math.Physics.psm1', 'GenXdev.Helpers.psd1', 
               'GenXdev.Helpers.psm1', 'ISSUES.md', 'LICENSE', 'license.txt', 
               'powershell.jpg', 'README.md', 
               'Tests\GenXdev.Helpers.Math.Physics\Get-FreeFallHeight.Tests.ps1', 
               'Tests\GenXdev.Helpers.Math.Physics\Get-FreeFallTime.Tests.ps1', 
               'Tests\GenXdev.Helpers\alignScript.Tests.ps1', 
               'Tests\GenXdev.Helpers\ConvertTo-HashTable.Tests.ps1', 
               'Tests\GenXdev.Helpers\ConvertTo-JsonEx.Tests.ps1', 
               'Tests\GenXdev.Helpers\Copy-IdenticalParamValues.Tests.ps1', 
               'Tests\GenXdev.Helpers\EnsureGenXdev.Tests.ps1', 
               'Tests\GenXdev.Helpers\Get-DefaultWebLanguage.Tests.ps1', 
               'Tests\GenXdev.Helpers\Get-GenXDevCmdlets.Tests.ps1', 
               'Tests\GenXdev.Helpers\Get-ImageGeolocation.Tests.ps1', 
               'Tests\GenXdev.Helpers\Get-ImageMetadata.Tests.ps1', 
               'Tests\GenXdev.Helpers\Get-WebLanguageDictionary.Tests.ps1', 
               'Tests\GenXdev.Helpers\Import-GenXdevModules.Tests.ps1', 
               'Tests\GenXdev.Helpers\Initialize-SearchPaths.Tests.ps1', 
               'Tests\GenXdev.Helpers\Invoke-OnEachGenXdevModule.Tests.ps1', 
               'Tests\GenXdev.Helpers\Out-Serial.Tests.ps1', 
               'Tests\GenXdev.Helpers\Remove-JSONComments.Tests.ps1', 
               'Tests\GenXdev.Helpers\Show-GenXDevCmdlets.Tests.ps1', 
               'Tests\GenXdev.Helpers\Show-Verb.Tests.ps1', 
               'Tests\GenXdev.Helpers\_EnsureTypes.Tests.ps1', 
               'Properties\PublishProfiles\FolderProfile.pubxml', 
               'lib\Azure.Core.dll', 'lib\Azure.Identity.dll', 
               'lib\BouncyCastle.Cryptography.dll', 'lib\EmbedIO.dll', 
               'lib\GenXdev.CoreHelpers.dll', 'lib\GenXdev.Helpers.deps.json', 
               'lib\GenXdev.Helpers.dll', 'lib\getfilesiginforedist.dll', 
               'lib\getfilesiginforedistwrapper.dll', 'lib\JWT.dll', 'lib\LICENSE', 
               'lib\license.txt', 'lib\Microsoft.ApplicationInsights.dll', 
               'lib\Microsoft.Bcl.AsyncInterfaces.dll', 
               'lib\Microsoft.Bcl.Cryptography.dll', 
               'lib\Microsoft.Data.SqlClient.dll', 
               'lib\Microsoft.Data.SqlClient.SNI.dll', 
               'lib\Microsoft.Extensions.Configuration.UserSecrets.dll', 
               'lib\Microsoft.Identity.Client.dll', 
               'lib\Microsoft.Identity.Client.Extensions.Msal.dll', 
               'lib\Microsoft.IdentityModel.Abstractions.dll', 
               'lib\Microsoft.IdentityModel.JsonWebTokens.dll', 
               'lib\Microsoft.IdentityModel.Logging.dll', 
               'lib\Microsoft.IdentityModel.Protocols.dll', 
               'lib\Microsoft.IdentityModel.Protocols.OpenIdConnect.dll', 
               'lib\Microsoft.IdentityModel.Tokens.dll', 
               'lib\microsoft.management.infrastructure.dll', 
               'lib\microsoft.management.infrastructure.native.dll', 
               'lib\microsoft.management.infrastructure.native.unmanaged.dll', 
               'lib\Microsoft.Playwright.dll', 
               'lib\Microsoft.Playwright.TestAdapter.dll', 
               'lib\Microsoft.PowerShell.CoreCLR.Eventing.dll', 
               'lib\Microsoft.SqlServer.Server.dll', 
               'lib\Microsoft.TestPlatform.CoreUtilities.dll', 
               'lib\Microsoft.TestPlatform.PlatformAbstractions.dll', 
               'lib\Microsoft.VisualStudio.TestPlatform.ObjectModel.dll', 
               'lib\Microsoft.Windows.SDK.NET.dll', 'lib\NAudio.Asio.dll', 
               'lib\NAudio.Core.dll', 'lib\NAudio.dll', 'lib\NAudio.Midi.dll', 
               'lib\NAudio.Wasapi.dll', 'lib\NAudio.WinForms.dll', 
               'lib\NAudio.WinMM.dll', 'lib\Newtonsoft.Json.dll', 'lib\Ninject.dll', 
               'lib\NuGet.Frameworks.dll', 'lib\OpenAI.dll', 'lib\playwright.ps1', 
               'lib\PowerShell.Core.Instrumentation.dll', 'lib\powershell.jpg', 
               'lib\pwrshplugin.dll', 'lib\README.md', 'lib\SpotifyAPI.Web.Auth.dll', 
               'lib\SpotifyAPI.Web.dll', 'lib\SQLite.Interop.dll', 
               'lib\Swan.Lite.dll', 'lib\System.ClientModel.dll', 
               'lib\System.Data.SQLite.dll', 
               'lib\System.IdentityModel.Tokens.Jwt.dll', 
               'lib\System.Management.Automation.dll', 'lib\System.Management.dll', 
               'lib\System.Memory.Data.dll', 'lib\System.Private.ServiceModel.dll', 
               'lib\System.ServiceModel.dll', 'lib\System.ServiceModel.Duplex.dll', 
               'lib\System.ServiceModel.Primitives.dll', 
               'lib\System.ServiceModel.Security.dll', 'lib\System.Speech.dll', 
               'lib\Whisper.net.dll', 'lib\WinRT.Runtime.dll', 
               'lib\WpfScreenHelper.dll', 
               'lib\runtimes\win-x86\ggml-base-whisper.dll', 
               'lib\runtimes\win-x86\ggml-cpu-whisper.dll', 
               'lib\runtimes\win-x86\ggml-whisper.dll', 
               'lib\runtimes\win-x86\whisper.dll', 
               'lib\runtimes\win-x64\ggml-base-whisper.dll', 
               'lib\runtimes\win-x64\ggml-cpu-whisper.dll', 
               'lib\runtimes\win-x64\ggml-whisper.dll', 
               'lib\runtimes\win-x64\whisper.dll', 
               'lib\runtimes\win-arm64\ggml-base-whisper.dll', 
               'lib\runtimes\win-arm64\ggml-cpu-whisper.dll', 
               'lib\runtimes\win-arm64\ggml-whisper.dll', 
               'lib\runtimes\win-arm64\whisper.dll', 
               'lib\.playwright\package\api.json', 
               'lib\.playwright\package\browsers.json', 
               'lib\.playwright\package\cli.js', 
               'lib\.playwright\package\index.d.ts', 
               'lib\.playwright\package\index.js', 
               'lib\.playwright\package\index.mjs', 
               'lib\.playwright\package\package.json', 
               'lib\.playwright\package\protocol.yml', 
               'lib\.playwright\package\README.md', 
               'lib\.playwright\package\ThirdPartyNotices.txt', 
               'lib\.playwright\package\types\protocol.d.ts', 
               'lib\.playwright\package\types\structs.d.ts', 
               'lib\.playwright\package\types\types.d.ts', 
               'lib\.playwright\package\lib\androidServerImpl.js', 
               'lib\.playwright\package\lib\browserServerImpl.js', 
               'lib\.playwright\package\lib\inprocess.js', 
               'lib\.playwright\package\lib\inProcessFactory.js', 
               'lib\.playwright\package\lib\outofprocess.js', 
               'lib\.playwright\package\lib\utilsBundle.js', 
               'lib\.playwright\package\lib\zipBundle.js', 
               'lib\.playwright\package\lib\zipBundleImpl.js', 
               'lib\.playwright\package\lib\vite\traceViewer\codicon.DCmgc-ay.ttf', 
               'lib\.playwright\package\lib\vite\traceViewer\index.html', 
               'lib\.playwright\package\lib\vite\traceViewer\index.qVn2ZnpC.js', 
               'lib\.playwright\package\lib\vite\traceViewer\playwright-logo.svg', 
               'lib\.playwright\package\lib\vite\traceViewer\snapshot.html', 
               'lib\.playwright\package\lib\vite\traceViewer\sw.bundle.js', 
               'lib\.playwright\package\lib\vite\traceViewer\uiMode.html', 
               'lib\.playwright\package\lib\vite\traceViewer\uiMode.m4IPRPOd.js', 
               'lib\.playwright\package\lib\vite\traceViewer\assets\codeMirrorModule-CyuxU5C-.js', 
               'lib\.playwright\package\lib\vite\traceViewer\assets\defaultSettingsView-5nVJRt0A.js', 
               'lib\.playwright\package\lib\vite\traceViewer\assets\xtermModule-c-SNdYZy.js', 
               'lib\.playwright\package\lib\vite\recorder\index.html', 
               'lib\.playwright\package\lib\vite\recorder\playwright-logo.svg', 
               'lib\.playwright\package\lib\vite\recorder\assets\codeMirrorModule-k-61wZCK.js', 
               'lib\.playwright\package\lib\vite\recorder\assets\codicon-DCmgc-ay.ttf', 
               'lib\.playwright\package\lib\vite\recorder\assets\index-B70BEW3b.js', 
               'lib\.playwright\package\lib\vite\htmlReport\index.html', 
               'lib\.playwright\package\lib\utilsBundleImpl\index.js', 
               'lib\.playwright\package\lib\utilsBundleImpl\xdg-open', 
               'lib\.playwright\package\lib\utils\ascii.js', 
               'lib\.playwright\package\lib\utils\comparators.js', 
               'lib\.playwright\package\lib\utils\crypto.js', 
               'lib\.playwright\package\lib\utils\debug.js', 
               'lib\.playwright\package\lib\utils\debugLogger.js', 
               'lib\.playwright\package\lib\utils\env.js', 
               'lib\.playwright\package\lib\utils\eventsHelper.js', 
               'lib\.playwright\package\lib\utils\expectUtils.js', 
               'lib\.playwright\package\lib\utils\fileUtils.js', 
               'lib\.playwright\package\lib\utils\happy-eyeballs.js', 
               'lib\.playwright\package\lib\utils\headers.js', 
               'lib\.playwright\package\lib\utils\hostPlatform.js', 
               'lib\.playwright\package\lib\utils\httpServer.js', 
               'lib\.playwright\package\lib\utils\index.js', 
               'lib\.playwright\package\lib\utils\linuxUtils.js', 
               'lib\.playwright\package\lib\utils\manualPromise.js', 
               'lib\.playwright\package\lib\utils\multimap.js', 
               'lib\.playwright\package\lib\utils\network.js', 
               'lib\.playwright\package\lib\utils\processLauncher.js', 
               'lib\.playwright\package\lib\utils\profiler.js', 
               'lib\.playwright\package\lib\utils\rtti.js', 
               'lib\.playwright\package\lib\utils\semaphore.js', 
               'lib\.playwright\package\lib\utils\sequence.js', 
               'lib\.playwright\package\lib\utils\spawnAsync.js', 
               'lib\.playwright\package\lib\utils\stackTrace.js', 
               'lib\.playwright\package\lib\utils\task.js', 
               'lib\.playwright\package\lib\utils\time.js', 
               'lib\.playwright\package\lib\utils\timeoutRunner.js', 
               'lib\.playwright\package\lib\utils\traceUtils.js', 
               'lib\.playwright\package\lib\utils\userAgent.js', 
               'lib\.playwright\package\lib\utils\wsServer.js', 
               'lib\.playwright\package\lib\utils\zipFile.js', 
               'lib\.playwright\package\lib\utils\zones.js', 
               'lib\.playwright\package\lib\utils\isomorphic\ariaSnapshot.js', 
               'lib\.playwright\package\lib\utils\isomorphic\cssParser.js', 
               'lib\.playwright\package\lib\utils\isomorphic\cssTokenizer.js', 
               'lib\.playwright\package\lib\utils\isomorphic\locatorGenerators.js', 
               'lib\.playwright\package\lib\utils\isomorphic\locatorParser.js', 
               'lib\.playwright\package\lib\utils\isomorphic\locatorUtils.js', 
               'lib\.playwright\package\lib\utils\isomorphic\mimeType.js', 
               'lib\.playwright\package\lib\utils\isomorphic\selectorParser.js', 
               'lib\.playwright\package\lib\utils\isomorphic\stringUtils.js', 
               'lib\.playwright\package\lib\utils\isomorphic\traceUtils.js', 
               'lib\.playwright\package\lib\utils\isomorphic\urlMatch.js', 
               'lib\.playwright\package\lib\third_party\pixelmatch.js', 
               'lib\.playwright\package\lib\server\accessibility.js', 
               'lib\.playwright\package\lib\server\artifact.js', 
               'lib\.playwright\package\lib\server\browser.js', 
               'lib\.playwright\package\lib\server\browserContext.js', 
               'lib\.playwright\package\lib\server\browserType.js', 
               'lib\.playwright\package\lib\server\clock.js', 
               'lib\.playwright\package\lib\server\console.js', 
               'lib\.playwright\package\lib\server\cookieStore.js', 
               'lib\.playwright\package\lib\server\debugController.js', 
               'lib\.playwright\package\lib\server\debugger.js', 
               'lib\.playwright\package\lib\server\deviceDescriptors.js', 
               'lib\.playwright\package\lib\server\deviceDescriptorsSource.json', 
               'lib\.playwright\package\lib\server\dialog.js', 
               'lib\.playwright\package\lib\server\dom.js', 
               'lib\.playwright\package\lib\server\download.js', 
               'lib\.playwright\package\lib\server\errors.js', 
               'lib\.playwright\package\lib\server\fetch.js', 
               'lib\.playwright\package\lib\server\fileChooser.js', 
               'lib\.playwright\package\lib\server\fileUploadUtils.js', 
               'lib\.playwright\package\lib\server\formData.js', 
               'lib\.playwright\package\lib\server\frames.js', 
               'lib\.playwright\package\lib\server\frameSelectors.js', 
               'lib\.playwright\package\lib\server\helper.js', 
               'lib\.playwright\package\lib\server\index.js', 
               'lib\.playwright\package\lib\server\input.js', 
               'lib\.playwright\package\lib\server\instrumentation.js', 
               'lib\.playwright\package\lib\server\javascript.js', 
               'lib\.playwright\package\lib\server\launchApp.js', 
               'lib\.playwright\package\lib\server\macEditingCommands.js', 
               'lib\.playwright\package\lib\server\network.js', 
               'lib\.playwright\package\lib\server\page.js', 
               'lib\.playwright\package\lib\server\pipeTransport.js', 
               'lib\.playwright\package\lib\server\playwright.js', 
               'lib\.playwright\package\lib\server\progress.js', 
               'lib\.playwright\package\lib\server\protocolError.js', 
               'lib\.playwright\package\lib\server\recorder.js', 
               'lib\.playwright\package\lib\server\screenshotter.js', 
               'lib\.playwright\package\lib\server\selectors.js', 
               'lib\.playwright\package\lib\server\socksClientCertificatesInterceptor.js', 
               'lib\.playwright\package\lib\server\socksInterceptor.js', 
               'lib\.playwright\package\lib\server\transport.js', 
               'lib\.playwright\package\lib\server\types.js', 
               'lib\.playwright\package\lib\server\usKeyboardLayout.js', 
               'lib\.playwright\package\lib\server\webkit\webkit.js', 
               'lib\.playwright\package\lib\server\webkit\wkAccessibility.js', 
               'lib\.playwright\package\lib\server\webkit\wkBrowser.js', 
               'lib\.playwright\package\lib\server\webkit\wkConnection.js', 
               'lib\.playwright\package\lib\server\webkit\wkExecutionContext.js', 
               'lib\.playwright\package\lib\server\webkit\wkInput.js', 
               'lib\.playwright\package\lib\server\webkit\wkInterceptableRequest.js', 
               'lib\.playwright\package\lib\server\webkit\wkPage.js', 
               'lib\.playwright\package\lib\server\webkit\wkProvisionalPage.js', 
               'lib\.playwright\package\lib\server\webkit\wkWorkers.js', 
               'lib\.playwright\package\lib\server\trace\viewer\traceViewer.js', 
               'lib\.playwright\package\lib\server\trace\test\inMemorySnapshotter.js', 
               'lib\.playwright\package\lib\server\trace\recorder\snapshotter.js', 
               'lib\.playwright\package\lib\server\trace\recorder\snapshotterInjected.js', 
               'lib\.playwright\package\lib\server\trace\recorder\tracing.js', 
               'lib\.playwright\package\lib\server\registry\browserFetcher.js', 
               'lib\.playwright\package\lib\server\registry\dependencies.js', 
               'lib\.playwright\package\lib\server\registry\index.js', 
               'lib\.playwright\package\lib\server\registry\nativeDeps.js', 
               'lib\.playwright\package\lib\server\registry\oopDownloadBrowserMain.js', 
               'lib\.playwright\package\lib\server\recorder\chat.js', 
               'lib\.playwright\package\lib\server\recorder\contextRecorder.js', 
               'lib\.playwright\package\lib\server\recorder\recorderApp.js', 
               'lib\.playwright\package\lib\server\recorder\recorderCollection.js', 
               'lib\.playwright\package\lib\server\recorder\recorderFrontend.js', 
               'lib\.playwright\package\lib\server\recorder\recorderRunner.js', 
               'lib\.playwright\package\lib\server\recorder\recorderUtils.js', 
               'lib\.playwright\package\lib\server\recorder\throttledFile.js', 
               'lib\.playwright\package\lib\server\isomorphic\utilityScriptSerializers.js', 
               'lib\.playwright\package\lib\server\har\harRecorder.js', 
               'lib\.playwright\package\lib\server\har\harTracer.js', 
               'lib\.playwright\package\lib\server\firefox\ffAccessibility.js', 
               'lib\.playwright\package\lib\server\firefox\ffBrowser.js', 
               'lib\.playwright\package\lib\server\firefox\ffConnection.js', 
               'lib\.playwright\package\lib\server\firefox\ffExecutionContext.js', 
               'lib\.playwright\package\lib\server\firefox\ffInput.js', 
               'lib\.playwright\package\lib\server\firefox\ffNetworkManager.js', 
               'lib\.playwright\package\lib\server\firefox\ffPage.js', 
               'lib\.playwright\package\lib\server\firefox\firefox.js', 
               'lib\.playwright\package\lib\server\electron\electron.js', 
               'lib\.playwright\package\lib\server\electron\loader.js', 
               'lib\.playwright\package\lib\server\dispatchers\androidDispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\artifactDispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\browserContextDispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\browserDispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\browserTypeDispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\cdpSessionDispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\debugControllerDispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\dialogDispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\dispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\electronDispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\elementHandlerDispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\frameDispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\jsHandleDispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\jsonPipeDispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\localUtilsDispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\networkDispatchers.js', 
               'lib\.playwright\package\lib\server\dispatchers\pageDispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\playwrightDispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\selectorsDispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\streamDispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\tracingDispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\webSocketRouteDispatcher.js', 
               'lib\.playwright\package\lib\server\dispatchers\writableStreamDispatcher.js', 
               'lib\.playwright\package\lib\server\codegen\csharp.js', 
               'lib\.playwright\package\lib\server\codegen\java.js', 
               'lib\.playwright\package\lib\server\codegen\javascript.js', 
               'lib\.playwright\package\lib\server\codegen\jsonl.js', 
               'lib\.playwright\package\lib\server\codegen\language.js', 
               'lib\.playwright\package\lib\server\codegen\languages.js', 
               'lib\.playwright\package\lib\server\codegen\python.js', 
               'lib\.playwright\package\lib\server\codegen\types.js', 
               'lib\.playwright\package\lib\server\chromium\appIcon.png', 
               'lib\.playwright\package\lib\server\chromium\chromium.js', 
               'lib\.playwright\package\lib\server\chromium\chromiumSwitches.js', 
               'lib\.playwright\package\lib\server\chromium\crAccessibility.js', 
               'lib\.playwright\package\lib\server\chromium\crBrowser.js', 
               'lib\.playwright\package\lib\server\chromium\crConnection.js', 
               'lib\.playwright\package\lib\server\chromium\crCoverage.js', 
               'lib\.playwright\package\lib\server\chromium\crDevTools.js', 
               'lib\.playwright\package\lib\server\chromium\crDragDrop.js', 
               'lib\.playwright\package\lib\server\chromium\crExecutionContext.js', 
               'lib\.playwright\package\lib\server\chromium\crInput.js', 
               'lib\.playwright\package\lib\server\chromium\crNetworkManager.js', 
               'lib\.playwright\package\lib\server\chromium\crPage.js', 
               'lib\.playwright\package\lib\server\chromium\crPdf.js', 
               'lib\.playwright\package\lib\server\chromium\crProtocolHelper.js', 
               'lib\.playwright\package\lib\server\chromium\crServiceWorker.js', 
               'lib\.playwright\package\lib\server\chromium\defaultFontFamilies.js', 
               'lib\.playwright\package\lib\server\chromium\videoRecorder.js', 
               'lib\.playwright\package\lib\server\bidi\bidiBrowser.js', 
               'lib\.playwright\package\lib\server\bidi\bidiChromium.js', 
               'lib\.playwright\package\lib\server\bidi\bidiConnection.js', 
               'lib\.playwright\package\lib\server\bidi\bidiExecutionContext.js', 
               'lib\.playwright\package\lib\server\bidi\bidiFirefox.js', 
               'lib\.playwright\package\lib\server\bidi\bidiInput.js', 
               'lib\.playwright\package\lib\server\bidi\bidiNetworkManager.js', 
               'lib\.playwright\package\lib\server\bidi\bidiOverCdp.js', 
               'lib\.playwright\package\lib\server\bidi\bidiPage.js', 
               'lib\.playwright\package\lib\server\bidi\bidiPdf.js', 
               'lib\.playwright\package\lib\server\bidi\third_party\bidiDeserializer.js', 
               'lib\.playwright\package\lib\server\bidi\third_party\bidiKeyboard.js', 
               'lib\.playwright\package\lib\server\bidi\third_party\bidiProtocol.js', 
               'lib\.playwright\package\lib\server\bidi\third_party\bidiSerializer.js', 
               'lib\.playwright\package\lib\server\bidi\third_party\firefoxPrefs.js', 
               'lib\.playwright\package\lib\server\android\android.js', 
               'lib\.playwright\package\lib\server\android\backendAdb.js', 
               'lib\.playwright\package\lib\remote\playwrightConnection.js', 
               'lib\.playwright\package\lib\remote\playwrightServer.js', 
               'lib\.playwright\package\lib\protocol\debug.js', 
               'lib\.playwright\package\lib\protocol\serializers.js', 
               'lib\.playwright\package\lib\protocol\transport.js', 
               'lib\.playwright\package\lib\protocol\validator.js', 
               'lib\.playwright\package\lib\protocol\validatorPrimitives.js', 
               'lib\.playwright\package\lib\image_tools\colorUtils.js', 
               'lib\.playwright\package\lib\image_tools\compare.js', 
               'lib\.playwright\package\lib\image_tools\imageChannel.js', 
               'lib\.playwright\package\lib\image_tools\stats.js', 
               'lib\.playwright\package\lib\generated\clockSource.js', 
               'lib\.playwright\package\lib\generated\consoleApiSource.js', 
               'lib\.playwright\package\lib\generated\injectedScriptSource.js', 
               'lib\.playwright\package\lib\generated\pollingRecorderSource.js', 
               'lib\.playwright\package\lib\generated\utilityScriptSource.js', 
               'lib\.playwright\package\lib\generated\webSocketMockSource.js', 
               'lib\.playwright\package\lib\common\socksProxy.js', 
               'lib\.playwright\package\lib\common\timeoutSettings.js', 
               'lib\.playwright\package\lib\common\types.js', 
               'lib\.playwright\package\lib\client\accessibility.js', 
               'lib\.playwright\package\lib\client\android.js', 
               'lib\.playwright\package\lib\client\api.js', 
               'lib\.playwright\package\lib\client\artifact.js', 
               'lib\.playwright\package\lib\client\browser.js', 
               'lib\.playwright\package\lib\client\browserContext.js', 
               'lib\.playwright\package\lib\client\browserType.js', 
               'lib\.playwright\package\lib\client\cdpSession.js', 
               'lib\.playwright\package\lib\client\channelOwner.js', 
               'lib\.playwright\package\lib\client\clientHelper.js', 
               'lib\.playwright\package\lib\client\clientInstrumentation.js', 
               'lib\.playwright\package\lib\client\clock.js', 
               'lib\.playwright\package\lib\client\connection.js', 
               'lib\.playwright\package\lib\client\consoleMessage.js', 
               'lib\.playwright\package\lib\client\coverage.js', 
               'lib\.playwright\package\lib\client\dialog.js', 
               'lib\.playwright\package\lib\client\download.js', 
               'lib\.playwright\package\lib\client\electron.js', 
               'lib\.playwright\package\lib\client\elementHandle.js', 
               'lib\.playwright\package\lib\client\errors.js', 
               'lib\.playwright\package\lib\client\eventEmitter.js', 
               'lib\.playwright\package\lib\client\events.js', 
               'lib\.playwright\package\lib\client\fetch.js', 
               'lib\.playwright\package\lib\client\fileChooser.js', 
               'lib\.playwright\package\lib\client\frame.js', 
               'lib\.playwright\package\lib\client\harRouter.js', 
               'lib\.playwright\package\lib\client\input.js', 
               'lib\.playwright\package\lib\client\jsHandle.js', 
               'lib\.playwright\package\lib\client\jsonPipe.js', 
               'lib\.playwright\package\lib\client\localUtils.js', 
               'lib\.playwright\package\lib\client\locator.js', 
               'lib\.playwright\package\lib\client\network.js', 
               'lib\.playwright\package\lib\client\page.js', 
               'lib\.playwright\package\lib\client\playwright.js', 
               'lib\.playwright\package\lib\client\selectors.js', 
               'lib\.playwright\package\lib\client\stream.js', 
               'lib\.playwright\package\lib\client\tracing.js', 
               'lib\.playwright\package\lib\client\types.js', 
               'lib\.playwright\package\lib\client\video.js', 
               'lib\.playwright\package\lib\client\waiter.js', 
               'lib\.playwright\package\lib\client\webError.js', 
               'lib\.playwright\package\lib\client\worker.js', 
               'lib\.playwright\package\lib\client\writableStream.js', 
               'lib\.playwright\package\lib\cli\driver.js', 
               'lib\.playwright\package\lib\cli\program.js', 
               'lib\.playwright\package\lib\cli\programWithTestStub.js', 
               'lib\.playwright\package\bin\install_media_pack.ps1', 
               'lib\.playwright\package\bin\reinstall_chrome_beta_linux.sh', 
               'lib\.playwright\package\bin\reinstall_chrome_beta_mac.sh', 
               'lib\.playwright\package\bin\reinstall_chrome_beta_win.ps1', 
               'lib\.playwright\package\bin\reinstall_chrome_stable_linux.sh', 
               'lib\.playwright\package\bin\reinstall_chrome_stable_mac.sh', 
               'lib\.playwright\package\bin\reinstall_chrome_stable_win.ps1', 
               'lib\.playwright\package\bin\reinstall_msedge_beta_linux.sh', 
               'lib\.playwright\package\bin\reinstall_msedge_beta_mac.sh', 
               'lib\.playwright\package\bin\reinstall_msedge_beta_win.ps1', 
               'lib\.playwright\package\bin\reinstall_msedge_dev_linux.sh', 
               'lib\.playwright\package\bin\reinstall_msedge_dev_mac.sh', 
               'lib\.playwright\package\bin\reinstall_msedge_dev_win.ps1', 
               'lib\.playwright\package\bin\reinstall_msedge_stable_linux.sh', 
               'lib\.playwright\package\bin\reinstall_msedge_stable_mac.sh', 
               'lib\.playwright\package\bin\reinstall_msedge_stable_win.ps1', 
               'lib\.playwright\node\LICENSE', 
               'lib\.playwright\node\win32_x64\node.exe', 
               'Functions\GenXdev.Helpers.Math.Physics\Get-FreeFallHeight.ps1', 
               'Functions\GenXdev.Helpers.Math.Physics\Get-FreeFallTime.ps1', 
               'Functions\GenXdev.Helpers\alignScript.ps1', 
               'Functions\GenXdev.Helpers\ConvertTo-HashTable.ps1', 
               'Functions\GenXdev.Helpers\ConvertTo-JsonEx.ps1', 
               'Functions\GenXdev.Helpers\Copy-IdenticalParamValues.ps1', 
               'Functions\GenXdev.Helpers\EnsureGenXdev.ps1', 
               'Functions\GenXdev.Helpers\Get-DefaultWebLanguage.ps1', 
               'Functions\GenXdev.Helpers\Get-GenXDevCmdlets.ps1', 
               'Functions\GenXdev.Helpers\Get-ImageGeolocation.ps1', 
               'Functions\GenXdev.Helpers\Get-ImageMetadata.ps1', 
               'Functions\GenXdev.Helpers\Get-WebLanguageDictionary.ps1', 
               'Functions\GenXdev.Helpers\Import-GenXdevModules.ps1', 
               'Functions\GenXdev.Helpers\Initialize-SearchPaths.ps1', 
               'Functions\GenXdev.Helpers\Invoke-OnEachGenXdevModule.ps1', 
               'Functions\GenXdev.Helpers\Out-Serial.ps1', 
               'Functions\GenXdev.Helpers\Remove-JSONComments.ps1', 
               'Functions\GenXdev.Helpers\Show-GenXDevCmdlets.ps1', 
               'Functions\GenXdev.Helpers\Show-Verb.ps1', 
               'Functions\GenXdev.Helpers\_EnsureTypes.ps1', 
               'default_site\index.html', 'custom_site\index.html', 
               'auth_assets\logo.svg', 'auth_assets\main.js'

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'GenXdev'

        # A URL to the license for this module.
        LicenseUri = 'https://raw.githubusercontent.com/genXdev/GenXdev.Helpers/main/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://powershell.genxdev.net/#GenXdev.Helpers'

        # A URL to an icon representing this module.
        IconUri = 'https://genxdev.net/favicon.ico'

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
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

