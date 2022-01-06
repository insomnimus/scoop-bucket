if(!$env:SCOOP_HOME) {
	$env:SCOOP_HOME = scoop which scoop | split-path | split-path | resolve-path
}
Invoke-Pester "$PSScriptRoot/.."
