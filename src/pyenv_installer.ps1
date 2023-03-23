
function Install-PyEnv {
    Param(
        [string]$Version
    )

    # Check if pyenv exists
    if (!Test-PyEnvExists) {
        DownloadAndInstallContent
    }

    # Check if specified python version is installed
    if (!IsPythonInstalled) {
        Install-PythonVersion
    }
}

function Test-PyEnvExists {
    $oldPreference = $ErrorActionPreference
    try {
        if (Get-Command "pyenv") {
            return $true
        }
    }
    Catch {
        return $false
    }
    Finally {
        $ErrorActionPreference = $oldPreference
    }
}

function IsPythonInstalled {
    Param(
        [string]$Version
    )
    $versions = pyenv versions
    return $versions.Contains($Version)
}

function DownloadAndInstallContent {

    # Download
    Write-Output "Installing Pyenv..."
    $githubUrl = "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1"
    Invoke-WebRequest -UseBasicParsing -Uri $githubUrl -OutFile "./install-pyenv-win.ps1"; &"./install-pyenv-win.ps1"

    #Updates the PATH variable in the current session
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User") 
}

function Install-PythonVersion {
    Param(
        [string]$Version
    )
    Write-Output "Installing Python version $Version..."
    pyenv install $Version
    Write-Output "Python $Version Installed!"
}
