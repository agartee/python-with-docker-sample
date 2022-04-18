$rootDir = (get-item $PSScriptRoot).Parent.FullName
$lastRun = Get-Content $rootDir/lastrun.log
$current = [DateTime]::UtcNow

Write-Host $($(New-TimeSpan -Start $lastRun -End $current).TotalSeconds -lt 30)
