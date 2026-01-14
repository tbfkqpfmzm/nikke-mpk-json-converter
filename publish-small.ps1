# Publish NikkeMpkConverter as framework-dependent executable
# This creates a smaller .exe but requires .NET 9 runtime on target machine

Write-Host "Publishing NikkeMpkConverter (Framework-Dependent)..." -ForegroundColor Cyan

# Framework-dependent publish (smaller size, requires .NET 9 runtime)
dotnet publish NikkeMpkConverter/NikkeMpkConverter.csproj `
    -c Release `
    -r win-x64 `
    -p:PublishSingleFile=true `
    -p:DebugType=none `
    -p:DebugSymbols=false

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nPublish successful!" -ForegroundColor Green
    Write-Host "Executable location: NikkeMpkConverter\bin\Release\net9.0\win-x64\publish\NikkeMpkConverter.exe" -ForegroundColor Yellow
    Write-Host "`nNote: This version requires .NET 9 runtime to be installed" -ForegroundColor Magenta
    Write-Host "Usage: NikkeMpkConverter.exe <input-file> [output-file]" -ForegroundColor White
    Write-Host "Example: NikkeMpkConverter.exe data\WordTable.mpk output\WordTable.json" -ForegroundColor Gray
} else {
    Write-Host "`nPublish failed!" -ForegroundColor Red
    exit 1
}
