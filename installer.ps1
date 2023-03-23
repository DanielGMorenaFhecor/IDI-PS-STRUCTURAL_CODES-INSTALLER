Import-Module -Name .\src\admin_checker.ps1
Import-Module -Name .\src\settings_reader.ps1
Import-Module -Name .\src\pyenv_installer.ps1

if (!IsAdmin) {
    read-host “Please, init the installer as Administrator...”
    return
}

# Read settings
$settings = Read-Settings

# Install python version if it does not exist using pyenv
Install-PyEnv -Version $settings['PythonVersion']

# Create install location if it does not exist and move to folder
$wd = $settings['InstallLocation']
Write-Output $wd
New-Item -ItemType Directory -Force -Path $wd
Set-Location $wd

Write-Output "prueba"