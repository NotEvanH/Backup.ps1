Param(
    [Parameter(Mandatory)]
    $Path,
    $CompressionLevel
)

if (-Not (Test-Path $Path)) {
    Throw "The source directory $Path does not exist."
}

$date = Get-Date -format "dd-MM-yyyy"

If (-Not (Test-Path $($DestinationPath + 'backup-' + $date + ".zip"))) {
    Compress-Archive -Path $Path -CompressionLevel $CompressionLevel -DestinationPath "./backup-$date"
    Write-Host "Backup created at $date"
} Else {
    Write-Host "Today's backup has already been created."
}
