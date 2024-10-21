# the below script is used to delete all items in a sharepoint list

Import-Module PnP.PowerShell

# define variable with sharepoint's url
$siteUrl = "<company sharepoint url>"
Connect-PnPOnline -Url $siteUrl -UseWebLogin

# get sharepoint list 
$listName = "<sharepoint list name>"
$list = Get-PnPList -Identity $listName

# get all items from the list
$items = Get-PnPListItem -List $listName

# delete every item found in the sharepoint list & print text with item's ID after deletionssss
foreach ($item in $items) {
    Remove-PnPListItem -List $listName -Identity $item.Id -Force
    Write-Host "Element with ID $($item.Id) has been deleted."
}

Disconnect-PnPOnline
