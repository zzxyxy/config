choco upgrade -y docker

Set-Service -Name docker -StartupType Automatic -status running
