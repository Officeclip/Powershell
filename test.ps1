Get-ChildItem -Path "C:\OfficeClipNew\opensource\Powershell" -Filter "*.html" |
ForEach-Object {
    $fileName = $_.FullName
    $content = Get-Content $fileName
     # Check if we have the alt tag with the image, then ignore it
     $count = [regex]::matches($content,'^.*img.*alt.*$').count
     Write-Output $Count
    if ($count -eq 0){
        $content1 = $content -replace '<img src="(.+/)(.+)\.(.+)"(.*)>', '<img src="$1$2.$3" alt="$2" $4>'
        $content1 -replace 'alt=".+"', { $_.Value.replace('-', ' ').replace('_', ' ') } |
        Set-Content $fileName
    }
}