param location string = resourceGroup().location

@description('VNet name')
param vnetName string 

@description('Vnet Address space')
param vnetAddressPrefix string 

@description('Subnet1 Prefix')
param subnet1Prefix string 

@description('Subnet1 Name')
param subnet1Name string  

@description('Subnet2 Prefix')
param subnet2Prefix string  

@description('Subnet2 Name')
param subnet2Name string 


// @description('Subnet3 Name')
// param subnet3Name string 

resource vnet 'Microsoft.Network/virtualNetworks@2024-01-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }

  }
}


resource subnet1 'Microsoft.Network/virtualNetworks/subnets@2024-01-01' =  {
  parent: vnet
  name: subnet1Name
  properties: {
    addressPrefix: subnet1Prefix
  }
}


resource subnet2 'Microsoft.Network/virtualNetworks/subnets@2024-01-01' = {
  parent: vnet
  name: subnet2Name
  
  properties: {
    addressPrefix: subnet2Prefix
  }
}
