$SelfApps = get-content -ea SilentlyContinue $PSScriptRoot/self-apps.txt

$manifests = get-childitem -file "$PSScriptRoot/bucket/*.json" | foreach-object {
	$data = get-content $_.fullname -ea silentlyContinue | convertfrom-json -AsHashTable -ea silentlyContinue
	if($data) {
		$data.name = $_.basename
		$data.self = $selfApps -contains $_.basename
		$data
	}
}

$out = $manifests `
| sort-object { $_.name } `
| foreach-object {
	$prefix = if($_.self) {
		"-`t~"
	} else {
		"-`t"
	}
	"${prefix}[$($_.name)]($($_.homepage)): $($_.description)"
} | join-string -separator "`n"

copy-item -force $PSScriptRoot/readme.md-tpl $PSScriptRoot/readme.md
out-file -append -inputObject $out -literalpath $PSScriptRoot/readme.md
