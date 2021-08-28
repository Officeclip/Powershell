# from: https://stackoverflow.com/a/1875662

$fileName = "test.html"

(Get-Content $fileName) | 
    Foreach-Object {
        $_ # send the current line to output
        if ($_ -match "<head>") 
        {
            #Add Lines after the selected pattern 
            "<!-- testing -->"
        }
    } | Set-Content $fileName

#Add-Content -Path .\test.html -Value '<!-- Comment -->'
#Get-Content -Path .\test.html