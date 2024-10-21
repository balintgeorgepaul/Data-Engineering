# this script is to test the connection to the correct sharepoint list. it reads the first row of the list 

Import-Module PnP.PowerShell

# variable to store company's sharepoint url & connector to the list
$siteUrl = "<company sharepoint url>"
Connect-PnPOnline -Url $siteUrl -UseWebLogin
$listName = "<sharepoint list name>"

# get the first item (row) of the list
$firstItem = Get-PnPListItem -List $listName -PageSize 1 | Select-Object -First 1

# print the item extracted in variable firstItem
$firstItem.FieldValues

Disconnect-PnPOnline
