Import-Module -Name .\src\settings_reader.ps1 -Verbose

$Settings = Read-Settings -SettingsPath 'settings.txt'