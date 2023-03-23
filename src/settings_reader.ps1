# This function reads all settings from the specified .txt file

function Read-Settings {
    Param(
        [string]$SettingsPath = 'settings.txt'
    )

    $h = @{} 
    # Get all data from the .txt
    $content = Get-Content $SettingsPath

    # Prepare and add data to the dictionary
    foreach ($c in $content) {

        if (!$c.Contains("=")) {
            continue
        }

        $k = $c.Split("=")
        if ($k[0].StartsWith("[")) {
            continue
        }

        $h.Add($k[0].Trim(), $k[1].Trim())
    }

    return $h
}