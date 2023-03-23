Import-Module -Name .\src\AdminChecker.ps1
Import-Module -Name .\src\SettingsReader.ps1
Import-Module -Name .\src\PyenvInstaller.ps1
Import-Module -Name .\src\PythonInstaller.ps1

$isAdmin = IsAdminSession
if (!$isAdmin) {
    Read-Host "ERROR: Please, run the installer as Administrator..."
    exit
}

# Read settings
$settings = Read-Settings

# Install python version if it does not exist using pyenv
$pythonVersion = $settings['PythonVersion']
Install-PyEnv -Version $pythonVersion

# Create install location if it does not exist and move to folder
$wd = $settings['InstallLocation']
New-Item -ItemType Directory -Force -Path $wd

# Copy all content from the structural codes folder
Write-Output "Copying the source code..."
Copy-Item -Force -Recurse .\structuralcodes -Destination $wd
Write-Output "Source code copied!"

# Move to location
Set-Location $wd
Set-Location .\structuralcodes

# Set python configuration
Set-Python -WorkDir "." -Version $pythonVersion

# Set xlwings
Set-Xlwings -WorkDir "."