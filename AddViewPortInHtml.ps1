Get-ChildItem -Path "." -Filter "*.html" |
ForEach-Object {
    $fileName = $_.FullName
    (Get-Content $fileName) | 
    Foreach-Object {
        $_ # send the current line to output
        if ($_ -match "<head>") 
        {
            #Add Lines after the selected pattern 
            "<!-- testing -->"
        }
    } | Set-Content $fileName
}