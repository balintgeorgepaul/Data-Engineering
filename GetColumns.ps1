# This script is used to get the names of the columns from a sharepoint list as the difference in columns may differ from internal column name

Import-Module PnP.PowerShell

# connect to sharepoint list
$siteUrl = "<company sharepoint url>"
Connect-PnPOnline -Url $siteUrl -UseWebLogin
$listName = "<list name>"

# get the columns names 
$list = Get-PnPList -Identity $listName
$listFields = Get-PnPField -List $list


# script to print all columns name and their internal name
$listFields | ForEach-Object {
    Write-Host "Nume: $($_.Title), Nume Intern: $($_.InternalName)"
}

$allItems = Get-PnPListItem -List $listName

