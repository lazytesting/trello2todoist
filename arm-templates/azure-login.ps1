function Grant-AzureAccess() 
{
    param([string]$subscriptionId)
    Write-Host 'Login to Azure'
    if ((Get-AzureRmContext).Environment -eq $null) {
     Login-AzureRmAccount
    }
 
    Write-Host "Selecting subscription $subscriptionId";
    Select-AzureRmSubscription -SubscriptionID $subscriptionId;
}
