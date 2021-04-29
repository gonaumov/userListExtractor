$inputEmail = Read-Host -Prompt 'Input your email'
$groupId = Read-Host -Prompt 'Input groupId'
Connect-MicrosoftTeams -AccountId $inputEmail
Get-TeamUser -GroupId $groupId | Add-Member -type ScriptProperty -name Id -value {$this.User -Replace "@.+", ""} -PassThru | Format-Table | Out-File -FilePath .\usersListId.txt
Write-Host "All done!!!"
Write-Host "Press any key to continue..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp") > $null