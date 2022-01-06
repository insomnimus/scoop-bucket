param(
	# overwrite upstream param
	[String]$upstream = "insomnimus/scoop-bucket:main"
)

if(!$env:SCOOP_HOME) {
	$env:SCOOP_HOME = scoop which scoop | split-path | split-path | resolve-path
}

$autopr = "$env:SCOOP_HOME/bin/auto-pr.ps1"
$dir = "$PSScriptRoot/../bucket"
&$autopr -upstream $upstream -dir $dir @args
