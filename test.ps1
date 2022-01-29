Get-ChildItem -Path "C:\OfficeClipNew\OpenSource\Powershell" -Filter "*.dita" -Recurse |
#Get-ChildItem -Path "C:\OfficeClipNew\docs\Help\Dita\Topics\apps" -Filter "*.dita" -Recurse |
ForEach-Object {
    $fileName = $_.FullName
    $content = Get-Content $fileName
    Write-Output $fileName
     # Check if we have the alt tag with the image, then ignore it
     $count = [regex]::matches($content,'^.*image.*alt.*$').count
    Write-Output $Count
    if ($count -eq 0){
        $content1 = $content -replace '<image.+href="(.+/)(.+)\.(.+)"(.*)', '<image href="$1$2.$3" alt="$2" $4'
        $content1 -replace 'alt=".+"', { $_.Value.replace('-', ' ').replace('_', ' ') } |
        Set-Content $fileName
    }
}