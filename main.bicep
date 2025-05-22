targetScope = 'subscription'

param location string
param rgName string
param keyVaultName string

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
}

module kvModule 'keyvault.bicep' = {
  name: 'deployKeyVault'
  scope: rg
  params: {
    location: location
    keyVaultName: keyVaultName
  }
}
