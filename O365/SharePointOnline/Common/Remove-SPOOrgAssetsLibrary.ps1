﻿#Requires -Version 5.0
#Requires -Modules Microsoft.Online.SharePoint.PowerShell

<#
    .SYNOPSIS
        Removes a library that was designated as a central location for organization assets across the tenant
    
    .DESCRIPTION  

    .NOTES
        This PowerShell script was developed and optimized for ScriptRunner. The use of the scripts requires ScriptRunner. 
        The customer or user is authorized to copy the script from the repository and use them in ScriptRunner. 
        The terms of use for ScriptRunner do not apply to this script. In particular, ScriptRunner Software GmbH assumes no liability for the function, 
        the use and the consequences of the use of this freely available script.
        PowerShell is a product of Microsoft Corporation. ScriptRunner is a product of ScriptRunner Software GmbH.
        © ScriptRunner Software GmbH

    .COMPONENT
        Requires Module Microsoft.Online.SharePoint.PowerShell
        ScriptRunner Version 4.2.x or higher

    .LINK
        https://github.com/scriptrunner/ActionPacks/tree/master/O365/SharePointOnline/Common

    .Parameter LibraryUrl
        Indicates the server relative URL of the library to be removed as a central location for organization assets

    .Parameter ShouldRemoveFromCdn
#>

param(         
    [Parameter(Mandatory = $true)]
    [string]$LibraryUrl,
    [Parameter(Mandatory = $true)]
    [bool]$ShouldRemoveFromCdn
)

Import-Module Microsoft.Online.SharePoint.PowerShell

try{    
    $result = Remove-SPOOrgAssetsLibrary -LibraryUrl $LibraryUrl -ShouldRemoveFromCdn $ShouldRemoveFromCdn `
                                           -Confirm:$false -ErrorAction Stop | Select-Object *
      
    if($SRXEnv) {
        $SRXEnv.ResultMessage = $result
    }
    else {
        Write-Output $result 
    }    
}
catch{
    throw
}
finally{
}