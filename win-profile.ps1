# Enable Windows Subsystem for Linux (WSL)
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
wsl --set-default-version 2

# Remove desktop wallpaper
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\" -Name "Wallpaper" -Value ""

# Enable Dark Mode for System (Taskbar, Start Menu)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0

# Enable Dark Mode for Apps
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0

# Set display scaling to 100% (96 DPI)
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "LogPixels" -Value 96

# 1. Set Start Menu Alignment to the left
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAl" -Value 0

# 2. Disable all animations (turn off animations in the user interface)
$AnimationSettings = @{
    'UserPreferencesMask' = ([byte[]](Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Value (Get-ItemProperty -Path "HKCU:\Control Panel\Desktop").UserPreferencesMask -ErrorAction Ignore))
    'VisualFXSetting' = 2
}

foreach ($key in $AnimationSettings.Keys) {
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name $key -Value $AnimationSettings[$key]
}

# 3. Set taskbar color to black (Personalization color settings)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0

# Disable minimize/maximize animations
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Value 0

# Disable taskbar animations
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Value 0

# Disable window shadows
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2

# Disable menu animation
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Value ([byte[]](0x90, 0x12, 0x03, 0x80, 0x10, 0x10, 0x10, 0x10))

# Disable fade or slide tooltips into view
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "TooltipDelay" -Value 0

# Disable smooth scrolling
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "SmoothScroll" -Value 0

# Disable combo box animation
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "ComboBoxAnimation" -Value 0

# Disable menu fade or slide effect
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Value 0

# Disable cursor blink rate
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "CaretBlinkRate" -Value -1

# Show taskbar only on the main display
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "MMTaskbarEnabled" -Value 0

# Set the registry value to remove the search bar (2 = Hidden)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Value 2

# Set the registry value to hide the search box (0 = hidden)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarSearchMode" -Value 0


# Restart Explorer to apply changes (optional step to make changes effective immediately)
Stop-Process -Name "explorer" -Force
Start-Process "explorer"

# Refresh the desktop to apply changes
RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters
