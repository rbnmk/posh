Function Get-RmAzContext {
    $azContext = Get-AzContext
    Write-Host "This is your current AzContext" -ForegroundColor Cyan
    $azContext | Select-Object Name, Account, Subscription, Tenant | Format-List
}
Function Set-RmAzContext {
    $azContext = Get-AzSubscription | Out-Gridview -PassThru
    Set-AzContext $azContext
}
Function Pip {
    #Checks your Public IP address and copies it to your clipboard
    $ExtIP = (Invoke-WebRequest -uri "http://ifconfig.me/ip").Content
    Write-Host "Current external IP: [$ExtIP] [And copied to Clipboard]" -ForegroundColor Green
    Set-Clipboard -Value $ExtIP
}