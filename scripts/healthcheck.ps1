$healthyTimespan = 30
$rootDir = (get-item $PSScriptRoot).Parent.FullName
$lastRun = Get-Content $rootDir/lastrun.log
$now = [DateTime]::UtcNow

Write-Host $($(New-TimeSpan -Start $lastRun -End $now).TotalSeconds -lt $healthyTimespan)

# TODO:
# 0: The container is healthy and working normally.
# 1: The container is unhealthy; the workload may not be functioning.
# 2: This status code is reserved by Docker and should not be used.