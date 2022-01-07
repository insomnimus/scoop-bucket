$manifests = get-childitem -file "$PSScriptRoot/bucket/*.json" | foreach-object {
	$data = get-content $_.fullname -ea silentlyContinue | convertfrom-json -AsHashTable -ea silentlyContinue
	if($data) {
		$data.name = $_.basename
		$data.self = $data.homepage.startswith("https://github.com/insomnimus/")
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
