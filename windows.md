choco upgrade -y docker-desktop

Set-Service -Name docker -StartupType Automatic -status running
