if(!$env:SCOOP_HOME) {
	$env:SCOOP_HOME = scoop which scoop | split-path | split-path | resolve-path
}
$checkver = "$env:SCOOP_HOME/bin/checkver.ps1"
$dir = "$PSScriptRoot/../bucket"
&$checkver -dir $dir @args
