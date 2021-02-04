#instalar chocolatey
$chocolatey = "Chocolatey"
if($chocolatey = $true)
{
    Write-output "Chocolatey esta instalado"
}
    else 
    {
        Set-ExecutionPolicy Bypass -Scope Process -Force; 
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex 
        ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    }
#instalar iisadministration atraves do chocolatey
    else
    {
        write-output "Instalando o IISAdministration"
        choco install iis.administration -y
    }
#criar diretorio do site
$directory = $Parameter
if($directory = $true)
{
    write-output "Diretorio ja instalado"
}
    else 
    {
        Write-Output "Instalando diretorio"
        New-Item -ItemType Directory -name $Parameter -Path "c:\"
    }
#criar arquivo index.html
$index = "index.html"
if ($index = $true)
{
    Write-Output "Index.html ja criado"
}
    else 
    {
        Write-Output "Instalando Index.html"
        New-Item -ItemType file -name 'index.html' -path "C:\Site"
    }
#Iniciar site
$siteon = "Site"
if($siteon = $true)
{
    Write-Output "Site ja iniciado"
}
    else 
    {
        Write-Ouput "Site iniciando"
        Start-IISSite -name 'Site'    
    }
#criacao de binding
$iissitebinding = "IIS"
$bin = Get-IISSiteBinding $Site
if($bin = $true)
{
    Write-Output "Binding ja criado"
}
    else 
    {
        Write-Output "Binding sendo criado"
        New-IISSiteBinding -name 'Site' -BindingInformation '*:9000:'    
    }

    
