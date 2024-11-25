# bicep  pipeline Demo

Demo Github Bicep pipeline


## setup the repository 

Federated Identity 

```powershell
$managedIdentityName = "mi-BicepDemo"
$repoName = "bicep-pipeline"
$githubOrga = "omiossec"
$environmentName = "DevTo-Demo"

$managedIdentity = New-AzUserAssignedIdentity -Name $managedIdentityName -ResourceGroupName managed-identity -Location northeurope

$subjectUri =  "repo:$($githubOrga)/$($repoName):environment:$($environmentName)"

New-AzFederatedIdentityCredential -ResourceGroupName managed-identity -IdentityName $managedIdentity.name  -Name fed-bicepDemo -Issuer "https://token.actions.githubusercontent.com" -Subject $subjectUri
```

