#Parameters
param([string]$sourceFolder = "C:\All Work\Powershell Test Folder\source", [string]$destinationFolder = "C:\All Work\Powershell Test Folder\organized")

#Functions
Function GetExtensionsOfFiles($files)
{
    $fileExtensions = @{}

    ForEach($file in $files)
    {
        $fileExtension = $file.Extension.Substring(1)

        if(-Not ($fileExtensions.ContainsKey($fileExtension)))
        {
            $fileExtensions[$fileExtension] = $null
        } 
    }

    return $fileExtensions.Keys
}

Function CreateDirectories($folder, $directoryNames)
{
    ForEach($directoryName in $directoryNames)
    {
        New-Item -Path $folder -Name $directoryName -ItemType "directory"
    }
}

Function CopyFilesBasedOnFileExtension($files, $destinationFolder)
{
    ForEach($file in $files)
    {
        $fileExtension = $file.Extension.Substring(1)
        Copy-Item -Path $file.FullName -Destination ($destinationFolder + "\" + $fileExtension)
    }
}

Function GetDirectoryInfo($dir)
{
    $dirName = $dir.Name
    $dirCount = (Get-ChildItem $dir.FullName | Measure-Object).Count
    $dirSize = (Get-ChildItem $dir.FullName | Measure-Object -Property Length -sum).Sum

    echo ("Name: " + $dirName + " | " + "Number Of Files: " + $dirCount + " | " + "Size: " + $dirSize)
}

Function WriteSubDirectoryInfo($mainFolder)
{
    $folders = Get-ChildItem $mainFolder

    ForEach($folder in $folders)
    {
        GetDirectoryInfo -dir $folder
    }
}

#Main
$sourceFiles = Get-ChildItem $sourceFolder 
$extensions = GetExtensionsOfFiles -files $sourceFiles

CreateDirectories -folder $destinationFolder -directoryNames $extensions
CopyFilesBasedOnFileExtension -files $sourceFiles -destinationFolder $destinationFolder
WriteSubDirectoryInfo -mainFolder $destinationFolder
