#Verificar se o modulo esta instalado
$iisadministration = "iisadministration"
$module = Get-module $iisadministration
if($module = $false)
{
    write-output "Modulo nao esta instalado" 
}
#Se estiver instalado o modulo desinstalar
    else
    {
        write-output "o modulo esta instalado e sera removido"
        Remove-Module -name "IISAdministration"
    }
#Verificar se existe diretorio
$Directory = "Teste-site"
if($Directory = $False)
{
    Write-output "o Diretorio nao esta instalado"
}
#se estiver instalado o diretorio remover 
    else
    {
        Write-Output "O Diretorio esta instalado e sera removido"
        Remove-Item -ItemType Directory -name 'Teste-site' -Path 'C:\'
    }
#Verificar se a pagina index existe 
$Arquivo = Get-Package ${index.html}
if($Arquivos = $false)
{
    Write-output "Pagina index existe"
}
#Se a pagina index existir remova 
    else 
    {
        Write-Output "A pagina index sera removida"
        Remove-Item -ItemType File -Name "index.html" Path 'C:\Teste-site'
    }
#Verificar se o site existe
$Site = Get-IISSite ${Teste-site}
if($Site = $False)
{
    Write-Output "O Site nao existe"
}
#Se o site existir remova
    else 
    {
        Write-Output "O site existe e sera removido"
        Remove-IISSite -name 'Teste-site' -PhysicalPath 'C:\\' -BindingInformation "*:8000:"
    }
#Verificar se o site esta ativo
$Siteon = Get-IISSite ${Teste-site}
if($siteon = $false)
{
    Write-Output "O site nao esta desativado"
}
#Se o site estiver ativo desative
    else 
    {
        Write-Output = "O site esta ativo e sera desativado"
        Stop-IISSite -name 'Teste-site'
    }
#Veridficar se o bindind esta criado
$IISSitebinding = "IISSitebinding"
$binsite = Get-IISSiteBinding $IISSiteBinding
if($binsite = $false)
{
    Write-Output "O binding nao esta criado"
}
#se nao estiver criado, crie um novo
    else 
    {
        Write-Output "Binding esta criado iremos remove-lo"
        Get-IISSite | Start-IISSite
        (Get-IISSite -Name 'Teste-site').Bindings
        Remove-IISSiteBinding -Name 'Teste-site' -BindingInformation "*:9000:"
    }

    Install-Module -Name 'IISAdministration'