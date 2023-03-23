Import-Module -Name .\src\settings_reader.ps1
Import-Module -Name .\src\pyenv_installer.ps1

# Read settings
$settings = Read-Settings

# Install python version if it does not exist using pyenv
Install-PyEnv -Version $settings['PythonVersion']