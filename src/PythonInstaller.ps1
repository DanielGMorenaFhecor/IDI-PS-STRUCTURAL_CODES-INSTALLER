function Set-Python {
    Param([string]$WorkDir = ".", [string]$Version)

    Set-Location $WorkDir

    # Set the pyenv errors
    pyenv local $Version

    # Check for Virtual environment file
    $isVenv = Test-Path -Path '.venv'
    if (!$isVenv) {
        Write-Output "Creating python virtual environment"
        python -m venv .venv
    }

    Write-Output "Virtual environment activated"
    .\.venv\scripts\activate
    # Check for updates

    # Update package managers
    python -m pip install --upgrade pip
    python -m pip install --upgrade wheel

    # Check for packages
    python -m pip install -r requirements.txt
}

function Set-Xlwings {
    Param([string]$WorkDir)

    pip install xlwings
    xlwings addin install
}