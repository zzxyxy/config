# dmgprofile

[environment]::SetEnvironmentVariable("ME", "attila.meszely@dmgmori-heitec.hu", "User")

# dmg

choco upgrade -y anki azure-cli dbeaver docker-desktop git keepass mc python vim wsl2

az extension add --name azure-devops
az extension add --name account
az extension add --name azure-iot
az extension add --name resource-graph

update-help -UICulture en-US
Install-Module -Name Az -Repository PSGallery -Force

# Set-Service -Name docker -StartupType Automatic -status running
