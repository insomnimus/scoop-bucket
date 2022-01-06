if(!$env:SCOOP_HOME) {
	$env:SCOOP_HOME = scoop which scoop | split-path | split-path | resolve-path
}
$missing_checkver = "$env:SCOOP_HOME/bin/missing-checkver.ps1"
$dir = "$PSScriptRoot/../bucket" # checks the parent dir
&$missing_checkver -dir $dir @args
