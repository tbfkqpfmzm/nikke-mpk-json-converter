# Publish NikkeMpkConverter as standalone executable
# This creates a single .exe file that includes all dependencies

Write-Host "Publishing NikkeMpkConverter..." -ForegroundColor Cyan

# Self-contained publish (no .NET runtime required on target machine)
dotnet publish NikkeMpkConverter/NikkeMpkConverter.csproj `
    -c Release `
    -r win-x64 `
    --self-contained `
    -p:PublishSingleFile=true `
    -p:EnableCompressionInSingleFile=true `
    -p:DebugType=none `
    -p:DebugSymbols=false

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nPublish successful!" -ForegroundColor Green
    Write-Host "Executable location: NikkeMpkConverter\bin\Release\net9.0\win-x64\publish\NikkeMpkConverter.exe" -ForegroundColor Yellow
    Write-Host "`nUsage: NikkeMpkConverter.exe <input-file> [output-file]" -ForegroundColor White
    Write-Host "Example: NikkeMpkConverter.exe data\WordTable.mpk output\WordTable.json" -ForegroundColor Gray
} else {
    Write-Host "`nPublish failed!" -ForegroundColor Red
    exit 1
}
