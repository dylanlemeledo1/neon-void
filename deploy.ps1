# deploy.ps1 — Met a jour NEON VOID en ligne en une commande.
# Usage :  .\deploy.ps1 "message du changement"
# (La 1re fois seulement, connecte ton depot GitHub — voir README / instructions.)

param([string]$msg = "Mise a jour NEON VOID")

$git = "$env:LOCALAPPDATA\PortableGit\cmd\git.exe"
Set-Location $PSScriptRoot

& $git add -A
& $git commit -m $msg
$remote = (& $git remote)
if (-not $remote) {
  Write-Host "Aucun depot distant configure." -ForegroundColor Yellow
  Write-Host "Lance une fois (remplace TON-PSEUDO) :" -ForegroundColor Cyan
  Write-Host '  git remote add origin https://github.com/TON-PSEUDO/neon-void.git' -ForegroundColor White
  Write-Host '  git push -u origin main' -ForegroundColor White
  exit
}
& $git push
Write-Host "`nDeploye ! Ton jeu sera a jour en ~1 min." -ForegroundColor Green
