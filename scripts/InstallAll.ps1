Set-ExecutionPolicy Bypass -Scope Process -Force

Write-Host "Instalando Chocolatey..."
& .\InstallChocolatey.ps1
if ($LASTEXITCODE -ne 0) {
    Write-Host "Erro ao instalar o Chocolatey. Abortando." -ForegroundColor Red
    exit $LASTEXITCODE
}

Start-Sleep -Seconds 30

Write-Host "Instalando aplicativos via Chocolatey..."
& .\InstallChocolateyApps.ps1
if ($LASTEXITCODE -ne 0) {
    Write-Host "Erro ao instalar aplicativos. Abortando." -ForegroundColor Red
    exit $LASTEXITCODE
}

Start-Sleep -Seconds 30

Write-Host "Executando script final..."
Start-Process -Wait -FilePath ".\InstallCore.bat"

Write-Host "Instalação concluída com sucesso!" -ForegroundColor Green
