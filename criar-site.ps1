#Verificar se o modulo esta instalado
$iisadministration = 'IISAdministration'
$module = Get-Module $iisadministration
If($module = $true)
{
    Write-Output "O diretório esta instalado!"
}
#se nao estiver instalar
    else 
    {
         Write-Output "programa ausente, iremos instalar"
         Install-Module -Name 'IISAdministration'
    }

#verificar se existe diretorio
$Directory = "Testsite"
if($Directory = $true) 
{
    write-output "Diretorio ja esta criado"
}
#se nao existir criar 
    else 
    {
        Write-Output "Diretorio nao encontrado, criando novo diretorio"
        New-Item -ItemType Directory -Name 'Testsite' -Path 'C:\'
    }
#verificar se existe pagina index html
$Arquivos = ${index.html}
if ($Arquivos = $true)
{
    Write-Output "O arquivo index.html ja esta criado"
}
#se nao existir criar 
    else 
    {
        Write-Output "arquivo index.html nao criado, iremos criar"
        New-Item -ItemType File -Name 'index.html' -Path 'C:\Testsite\'
    }

#Verificar se o site existe
$site = Get-IISSite $testsite
if ($site = $true)
{
    write-output "Site ja criado"
}
#se nao existe criar um 
    else 
    {
        write-output "Site nao criado, iremos criar um"
        New-IISSite -Name 'TestSite' -PhysicalPath 'C:\\' -BindingInformation "*:8088:"
        New-IISSite -Name "TestSite" -BindingInformation "*:8080:" -PhysicalPath "$env:systemdrive\inetpub\testsite"
     }
#verificar se o site esta iniciado
$siteon = test-iissite $testsite
if ($siteon = $true)
{
    Write-Output "O site esta iniciado"
}
#se nao estiver iniciar     
    else
    {
        Write-Output "Site nao iniciado, iremos iniciar"
        Start-IISSite -Name 'Testsite'
    }
#criacao do bindinds
$binsite = Get-IISSiteBinding $testsite
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





 
