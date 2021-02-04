Install-Module -Name 'IISAdministration'
New-Item -ItemType Directory -Name 'Teste-site' -Path 'C:\'
New-Item -ItemType File -Name 'index.html' -Path 'C:\Teste-site\'
New-IISSite -Name 'Teste-site' -PhysicalPath 'C:\\' -BindingInformation "*:8088:"
Start-IISSite -Name 'Teste-site'
Get-IISSite | Start-IISSite
(Get-IISSite -Name 'Teste-site').Bindings
New-IISSiteBinding -Name 'Teste-site' -BindingInformation "*:9000:"

#Verificar se o modulo esta instalado
#se nao estiver instalar
#verificar se existe diretorio
#verificar se existe pagina index HTML 
#se nao existir criar o HTML 
#Verificar se o site existe
#se nao existir criar 



