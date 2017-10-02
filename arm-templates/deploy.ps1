[CmdletBinding()]
param(
    [Parameter(Mandatory = $True)]
    [string]
    [ValidatePattern('^[a-z,0-9]{1,7}$')]
    $subscriptionId,

    [Parameter(Mandatory = $True)]
    [string]
    $azureRegion,

    [Parameter(Mandatory = $True)]
    [string]
    $applicationPrefix
)

# load dependencies
. ./azure-login.ps1
. ./create-resource-group.ps1

# stop script execution on exception
$ErrorActionPreference = "Stop"

$resourceGroupName = "$applicationPrefix-rg"
Grant-AzureAccess -subscriptionId $subscriptionId
Add-ResourceGroup -resourceGroupName $resourceGroupName -azureRegion $azureRegion 

$params = @{
    'ResourceGroupName' = $resourceGroupName
    'TemplateFile' = "./template.json"
    'applicationPrefix' = $applicationPrefix
}

Write-Host "Deploy Azure environment"
New-AzureRmResourceGroupDeployment @params
