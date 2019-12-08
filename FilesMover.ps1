#Welcome
Write-Host '    '
Write-Host '-------------------------------------------------'
Write-Host '------------------- FILE MOVER ------------------'
Write-Host '-------------------------------------------------'
Write-Host '    '
Write-Host 'Move all files of a certain format from a folder,'
Write-Host 'and if needed from its subfolders, to another one'
Write-Host '    '
Write-Host '-------------------------------------------------'
Write-Host '    '

do {
    #Variables
    Write-Host '___'
    Write-Host '   '
    Write-Host 'STEP 1'
    Write-Host '-'
    $SourceFolder = Read-Host -Prompt "Specify the folder from where to grab the files"
    Write-Host '   '
    Write-Host 'Choose one of these options:'
    Write-Host '   '
    Write-Host '1 - Move files from the folder above'
    Write-Host '2 - Move files from the folder above and its subfolders'
    Write-Host '   '
    $Subfolders = Read-Host -Prompt "Type 1 or 2 to proceed. Press Enter to confirm."
    Write-Host '___'
    Write-Host '   '
    Write-Host 'STEP 2'
    Write-Host '-'
    $DestinationFolder = Read-Host -Prompt "Specify the desitnation folder where to move the files"
    Write-Host '___'
    Write-Host '   '
    Write-Host 'STEP 3'
    Write-Host '-'
    $FileFormat = Read-Host -Prompt "Specify the file extension of the files you want to move (like jpg, pdf, dwg, etc.)"
    Write-Host '___'
    Write-Host '   '
    $FullPath = $SourceFolder + "\*." + $FileFormat

    #Operation
    switch ($Subfolders) {
        1 {
            Move-Item -Path $FullPath -Destination $DestinationFolder
        }
        2 {
            Get-ChildItem -Path $FullPath -Recurse | Move-Item -Destination $DestinationFolder
        }
        Default {1}
    }

    Write-Host '   '
    Write-Host '   '
    Write-Host 'vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv'
    Write-Host 'OPERATION COMPLETED SUCCESFULLY'
    Write-Host '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'
    Write-Host '   '
    Write-Host '   '
    Write-Host '___'
    Write-Host '   '
    Write-Host 'What you wanna do next?'
    Write-Host '   '
    Write-Host "1 - Repeat the operation in another folder"
    Write-Host "2 - Exit the program"
    Write-Host '   '
    $choice = Read-Host "Choose a number to proceed. Press Enter to confirm."

    switch ($choice) {
        1 {
            Write-Host '___'
            Write-Host '   '
            Write-Host "Let's move other files!"
            Start-Sleep 1
        }
        2 {
            Write-Host '___'
            Write-Host '   '
            Write-Host "Turning off...see you soon! :)"
            Start-Sleep 3
        }
    }
} until ($choice -eq 2)
