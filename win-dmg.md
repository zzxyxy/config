Enable-PSRemoting
Set-Item -Path WSMan:\localhost\Service\Auth\Basic -Value $true
Set-Item -Path WSMan:\localhost\Service\AllowUnencrypted -Value $true

ansible_port: 5985
ansible_connection: winrm
ansible_winrm_transport: basic

ansible_user=your_win_user
ansible_password=your_win_user_pass

ansible_connection: local
