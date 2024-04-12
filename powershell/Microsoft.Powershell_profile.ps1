[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

function prompt {
    $currentDirectory = (Get-Location).Path
    $promptSymbol = " "

    $tsFiles = Get-ChildItem -Path $currentDirectory -Filter *.ts -ErrorAction SilentlyContinue
    if ($tsFiles) {
        $promptSymbol = "$(Write-Host -ForegroundColor White -NoNewline '') 
$promptSymbol"
    }

    $currentDirectoryColor = "$(Write-Host -ForegroundColor Blue -NoNewline 
$((Get-Item $currentDirectory).Name))"
    $promptString = "$currentDirectoryColor $promptSymbol "
    Write-Host -NoNewline $promptString 󰁔
    return " "
}

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias g git
Set-Alias grep findstr
Set-Alias ll ls

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue        
}