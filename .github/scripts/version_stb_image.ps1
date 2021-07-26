#!/usr/bin/env pwsh

$regex='^.*(?<version>[0-9]+\.[0-9]+)\s+'
$file='.\ext\stb\stb_image.h'
select-string -Path $file -Pattern $regex -AllMatches | Select-Object -ExpandProperty Matches -First 1 | % { $_.Groups[1].Value }