#instalar chocolatey
$chocolatey = "Chocolatey"
if($chocolatey = $true)
{
    echo "Chocolatey esta instalado"
}
#se nao estiver instalar
    else
    {
        echo "Instalando chocolatey"
        Set-ExecutionPolicy Bypass -Scope Process -Force; 
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex 
        ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    }
#instalar office
$office = get-module "office"
if($office = $true)
{
    echo "Pacote Office instalado"
}
    else 
    {
        echo "Pacote Office esta sendo instalado"
        choco install office2019proplus   
    }
#instalar winrar
$winr = get-module "Winrar"
if($winr = $true)
{
    echo "Winrar esta instalado"
}
    else 
    {
        echo "Winrar esta sendo instalado" 
        choco install winrar  
    }
#instalar adobe reader
$adobe = get-module "Adobereader"
if($adobe = $true)
{
    echo "Adobe Reader esta instalado"
}
    else 
    {
        echo "Adobe Reader esta sendo instalado"
        choco install adobereader   
    }


