if(!$env:SCOOP_HOME) {
	$env:SCOOP_HOME = scoop which scoop | split-path | split-path | resolve-path
}
if(!$env:SCOOP_HOME) { $env:SCOOP_HOME = resolve-path (split-path (split-path (scoop which scoop))) }
$formatjson = "$env:SCOOP_HOME/bin/formatjson.ps1"
$dir = "$PSScriptRoot/../bucket"
&$formatjson -dir $dir @args
