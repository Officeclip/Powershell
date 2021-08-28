Get-ChildItem -Path "C:\OfficeClipNew\docs\output\webservice\Content" -Filter "*.htm" |
ForEach-Object {
    $fileName = $_.FullName
    $content = Get-Content $fileName
    $content.replace(
            '<head>', 
            '<head><meta name="viewport" content="width=device-width, initial-scale=1.0">') | 
        Set-Content $fileName
}