# this script is used to upload data from local excel file into Sharepoint

Import-Module PnP.PowerShell

# define variable for company's sharepoint url and list name
$siteUrl = "<company sharepoint url>"
Connect-PnPOnline -Url $siteUrl -UseWebLogin
$listName = "<sharepoint list name>"
$list = Get-PnPList -Identity $listName


# read that from the local excel file.
$excelFilePath = "<local file explorer path>"
$excelData = Import-Excel -Path $excelFilePath  

# insert data into Sharepoint here field name is not null or not blank
foreach ($row in $excelData) {
    
    if (-not [string]::IsNullOrWhiteSpace($row.Naam)) {
        $itemValues = @{     
	    "Title"           		= $row.Naam 
            "Id"          	  	= $row.Id
            "ContactPerson"             = $row.ContactPerson
            "Accountnumber"             = $row.Accountnumber
        }
      
        Add-PnPListItem -List $listName -Values $itemValues
    }
}


Disconnect-PnPOnline
