function KillThatProcess ([string] $name){
    $num = (gps $name).Count
    if ($num -eq 0) {
        write "No processes with the name $name found."
        return
    }
    $ans = Read-Host "There are $num instances with the name $name, proceed? Y/N"
    if ($ans -match "Y" -or $ans -match "y") {
        gps -Name $name | spps -Force
    }
    else {
        write "Operation canceled."
    }
}

function Bamboozle (){
    [Parameter(Mandatory=$false)][string] $filename
    if ($filename -eq $null){
        $filename = $PSScriptRoot
    }
    $alpha = @([string]"a"; [string]"b"; [string]"c"; [string]"d"; [string]"e"; [string]"f"; [string]"g"; [string]"h"; [string]"i"; [string]"j"; [string]"k"; [string]"l"; [string]"m"; [string]"n"; [string]"o"; [string]"p"; [string]"q"; [string]"r"; [string]"s"; [string]"t"; [string]"u"; [string]"v"; [string]"w"; [string]"x"; [string]"y"; [string]"z";)
    $rand = Get-Random(26)
    $char = ($alpha[$rand])
    write "The letter $($alpha[$rand]) has been chosen!"
    Get-ChildItem -File -Path $filename "$char*" | Remove-Item -Recurse -Force -WhatIf
}