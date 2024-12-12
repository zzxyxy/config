# set

set-service -Name LanmanServer -StartupType 'Automatic'
Start-Service lanmanServer

choco install -y wsl2 adb android-sdk 7zip anki azure-cli azure-data-studio azure-kubelogin AzureStorageExplorer choco-cleaner dbeaver docker-desktop git golang hackfont keepass kubectx kubens kubernetes-cli kubernetes-helm microsoft-windows-terminal powershell-core python3 rust sql-server-management-studio vim vlc vscode

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


Set-ItemProperty -Path "HKCU:\Software\Microsoft\Multimedia\Audio" -Name "UserDuckingPreference" -Value 0
