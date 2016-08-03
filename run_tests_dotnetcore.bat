@echo off
rem Runs the .NET Core tests locally.

setlocal

REM Build the support libraries.
msbuild SupportLibraries.proj

REM Clean slate after the build.
set workspace=%~dp0
set nugetconfig=%workspace%\NuGet.Config

REM Restore the test projects.
dotnet restore ^
  "Src\Support\GoogleApis.Tests_dotnetcore" ^
  "Src\Support\GoogleApis.Auth.Tests_dotnetcore" ^
  --no-cache ^
  --configfile "%nugetconfig%"

REM Run the tests.
dotnet test "Src\Support\GoogleApis.Tests_dotnetcore"
dotnet test "Src\Support\GoogleApis.Auth.Tests_dotnetcore"

echo Done.
