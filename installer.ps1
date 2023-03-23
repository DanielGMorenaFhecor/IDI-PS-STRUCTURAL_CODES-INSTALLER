Import-Module -Name .\src\settings_reader.ps1 -Verbose

$settings = Read-Settings -SettingsPath 'settings.txt'