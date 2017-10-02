function Add-ResourceGroup
{
    param([string]$resourceGroupName, [string]$azureRegion) 
    
    # Create resource group if it doesn't exists
    $resourceGroup = Get-AzureRmResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
    if (!$resourceGroup) { 
    Write-Host "Creating resource group $resourceGroupName in location $azureRegion";
    New-AzureRmResourceGroup -Name $resourceGroupName -Location $azureRegion
    }

    else {
        Write-Host "Using existing resource group $resourceGroupName";
    }
}
