# set

set-service -Name LanmanServer -StartupType 'Automatic'
Start-Service lanmanServer

choco install -y adb android-sdk 7zip anki azure-cli azure-data-studio azure-kubelogin AzureStorageExplorer choco-cleaner dbeaver docker-desktop git keepass kubectx kubens kubernetes-cli kubernetes-helm powershell-core sql-server-management-studio vim vlc

# ansible remote
Enable-PSRemoting
Set-Item -Path WSMan:\localhost\Service\Auth\Basic -Value $true
Set-Item -Path WSMan:\localhost\Service\AllowUnencrypted -Value $true



ansible_port: 5985
ansible_connection: winrm
ansible_winrm_transport: basic

ansible_user=your_win_user
ansible_password=your_win_user_pass

ansible_connection: local
