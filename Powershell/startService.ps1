# Nom du service
$serviceName = "changeME"

$service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

# Vérifier que le service existe
if ($null -eq $service) {
    Write-Host "Le service '$serviceName' n'existe pas."
}
# Vérifier si le service est lancé ou non
elseif ($service.Status -ne 'Running') {
    Write-Host "Le service '$serviceName' n'est pas en cours d'execution. Demarrage en cours..."
    Start-Service -Name $serviceName

    # une fois le service lancé, attendre 10 secondes
    $service.WaitForStatus('Running', '00:00:10')
    if ((Get-Service -Name $serviceName).Status -eq 'Running') {
        Write-Host "Le service '$serviceName' a ete demarre avec succes."
    } else {
        Write-Host "Le service '$serviceName' n'a pas pu etre demarre."
    }
}
else {
    Write-Host "Le service '$serviceName' est deja en cours d'execution."
}
