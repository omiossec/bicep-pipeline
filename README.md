# bicep  pipeline Demo

TThis repository contains the sample code for a post on Dev.to [Create a GitHub pipeline to test, review, and deploy a Bicep template.](https://dev.to/omiossec/create-a-github-pipeline-to-test-review-and-deploy-a-bicep-template-3a9i-temp-slug-7563364)

## setup the Federated Identity

For the first environment
```powershell
$managedIdentityName = "mi-BicepDemo"
$repoName = "bicep-pipeline"
$githubOrga = "omiossec"
$environmentName = "DevTo-Demo"

$managedIdentity = New-AzUserAssignedIdentity -Name $managedIdentityName -ResourceGroupName managed-identity -Location northeurope

$subjectUri =  "repo:$($githubOrga)/$($repoName):environment:$($environmentName)"

New-AzFederatedIdentityCredential -ResourceGroupName managed-identity -IdentityName $managedIdentity.name  -Name fed-bicepDemo -Issuer "https://token.actions.githubusercontent.com" -Subject $subjectUri
```

For the second one
```powershell
$managedIdentityName = "mi-BicepDemo"
$repoName = "bicep-pipeline"
$githubOrga = "omiossec"
$environmentName = "bicep-deploy"

$subjectUri =  "repo:$($githubOrga)/$($repoName):environment:$($environmentName)"

New-AzFederatedIdentityCredential -ResourceGroupName managed-identity -IdentityName $managedIdentity.name  -Name fed-bicep-deploy -Issuer "https://token.actions.githubusercontent.com" -Subject $subjectUri
```

