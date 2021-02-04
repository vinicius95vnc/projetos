#Verificar se o modulo esta instalado
$IISAdministration = 'IISAdministration'
$module = Get-Module $IISAdministration
If ($module = $true)
{
    Write-Output "O modulo esta instalado!"
}
#se nao estiver instalar 
    else 
    {
         Write-Output "programa ausente, iremos instalar"
         Install-Module -Name 'IISAdministration'
    }

#verificar se existe diretorio
$Directory = "Teste-site"
if ($Directory = $true) 
{
    write-output "Diretorio ja esta criado"
}
#se nao existir criar 
    else 
    {
        Write-Output "Diretorio nao encontrado, criando novo diretorio"
        New-Item -ItemType Directory -Name 'Teste-site' -Path 'C:\'
    }
#verificar se existe pagina index html
$Arquivos = Get-Package ${index.html}
if ($Arquivos = $true)
{
    Write-Output "O arquivo index.html ja esta criado"
}
#se nao existir criar 
    else 
    {
        Write-Output "arquivo index.html nao criado, iremos criar"
        New-Item -ItemType File -Name 'index.html' -Path 'C:\Teste-site\'
    }

#Verificar se o site existe
$site = Get-IISSite
 ${teste-site}
if ($site = $true)
{
    write-output "Site ja criado"
}
#se nao existe criar um 
    else 
    {
        write-output "Site nao criado, iremos criar um"
        New-IISSite -Name 'Teste-site' -PhysicalPath 'C:\\' -BindingInformation "*:8088:"
     }
#verificar se o site esta iniciado
$siteon = Get-IISSite ${teste-site}
if ($siteon = $true)
{
    Write-Output "O site esta iniciado"
}
#se nao estiver iniciar     
    else
    {
        Write-Output "Site nao iniciado, iremos iniciar"
        Start-IISSite -Name 'Teste-site'
    }
#criacao do bindinds
$binsite = $IISSitebinding
$binsite = Get-IISSite $IISSitebinding
if ($binsite = $true)
{
    Write-Output "O binding ja esta criado"
}
#se nao estiver criado, crie um novo
    else 
    {
        Write-Output "Binding nao criado, iremos criar um novo"
        Get-IISSite | Start-IISSite
        (Get-IISSite -Name 'Teste-site').Bindings
        New-IISSiteBinding -Name 'Teste-site' -BindingInformation "*:9000:"
    }





 
