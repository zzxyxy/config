# dmg

choco upgrade -y anki azure-cli dbeaver docker-desktop git keepass mc python vim wsl2

az extension add --name azure-devops
az extension add --name account
az extension add --name azure-iot
az extension add --name resource-graph

update-help -UICulture en-US

# Set-Service -Name docker -StartupType Automatic -status running
