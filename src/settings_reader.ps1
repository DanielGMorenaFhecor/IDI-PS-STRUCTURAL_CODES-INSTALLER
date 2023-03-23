# This function reads all settings from the specified .txt file

function Read-Settings {
    Param(
        [string]$SettingsPath = 'settings.txt'
    )

    $content = Get-Content $SettingsPath
    $h = @{} 
    foreach ($c in $content) {
        if (($c.CompareTo("") -ne 0) -and ($c[0].StartsWith["["] -ne $true)) {
            $h.Add($c[0], $c[1])
        }
    }

    return $h
}