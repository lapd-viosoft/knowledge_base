## Domain

# Get current domain information
Get-NetDomain

# Get other domain information
Get-NetDomain -Domain myforest.local

# Get domain SID for the current domain
Get-DomainSID

# Get domain controller for current domain
Get-NetDomainController

# Get domain controller for other domain
Get-NetDomainController -Domainmyforest.local

# Get domain policy for the current domain
Get-DomainPolicy
(Get-DomainPolicy)."system access"
(Get-DomainPolicy)."Kerberos Policy"

# Get domain policy for another domain
Get-DomainPolicy -domain myforest.local
(Get-DomainPolicy -domain myforest.local)."system access"
(Get-DomainPolicy -domain myforest.local)."Kerberos Policy"


## Users

# List users in domain
Get-NetUser
Get-NetUser | select cn # to view the list of usernames
Get-NetUser -Username testusername1

# Search for specific users
Get-DomainUser -Identity "*john*"
Get-DomainUser -Identity "*admin*"

# Get users which are in some admin group
Get-DomainUser -AdminCount

# Get users who do not require Kerberos Pre-Authentication (ASREPRoast)
Get-DomainUser -PreauthNotRequired

# Get list of all properties for users in the current domain
Get-UserProperty
Get-UserProperty -Properties pwdlastset
Get-UserProperty -Properties badpwdcount
Get-UserProperty -Properties logoncount

# Search for a particular string in user's attribute
Find-UserField -SearchField Description -SearchTerm "built" # many shared accounts put passwords in description
Find-UserField -SearchField Description -SearchTerm "pass" # many shared accounts put passwords in description

# Get logged on users on a computer
Get-NetLoggedon -ComputerName <computername>

# Get locally logged users on a computer
Get-LoggedonLocal -ComputerName <compuername>

# Get the lase logged user on a computer
Get-LastLoggedOn -ComputerName <computername>

# Find all machines on domain where current user has local admin access (contacts all machines)
Find-LocalAdminAccess -Verbose
OR
Invoke-EnumerateLocalAdmin -Verbose

# Find computers where a domain admin (or specified user/group) has access
Invoke-UserHunter
Invoke-UserHunter -GroupName "RDPUsers"

# Find computers where a domain admin is logged-in
Invoke-UserHunter -Stealth


## Computers

# List computers in domain
Get-NetComputer
Get-NetComputer -FullData

# Search for specific OS computers
Get-NetComputer -OperatingSystem "*Server 2016*"
Get-NetComputer -OperatingSystem "*XP*"

# List available computers
Get-NetComputer -Ping


## Groups

# List current domain groups
Get-NetGroup
Get-NetGroup -FullData

# List groups from another domain
Get-NetGroup -Domain myforest.local

# List all groups containing the word "admin" in name
Get-NetGroup -GroupName *admin*

# Get members within a group
Get-NetGroupMember -GroupName "Domain Admins" -Recurse

# Get the group membership for a user
Get-NetGroup -Username "testuser1"

# Get list of local (non domain) groups
Get-NetLocalGroup -ComputerName <computer1> -ListGroups

# Get members of all the local (non domain) groups on a machine
Get-NetLocalGroup -ComputerName <computer1> -Recurse


## Files and Shares

# Find shares on hosts in current dommain
Invoke-ShareFinder -Verbose
Invoke-ShareFinder -ExcludeStandard -ExcludePrint -ExcludeIPC # to prevent printing default shares

# Find sensitive files on computers in the domain
Invoke-FileFinder -Verbose

# Get all fileservers of the domain
Get-NetFileServer


## GPO

# List GPOs in current domain
Get-NetGPO
Get-NetGPO | select displayname

# List GPOs applied on a remote computer
Get-NetGPO -ComputerName <computername>

# Get GPOs which use Restricted Groups or groups.xml for interesting users
Get-NetGPOGroup

# Get users which are in a local group of a machine
Find-GPOComputetrAdmin -ComputerName <computername>

# Get machines where the given user is member of a specific group
Find-GPOLocation -Username <username> -Verbose


## OU

# Get OUs in a domain
Get-NetOU -FullData

# Get GPO applied on an OU
;; read GPOname from gplink attribute from Get-NetOU
Get-NetGPO -GPOname "{AB392439424-334-43324-328DSKND9}"


## ACL

# Get ACLs associated with an object
Get-ObjectAcl -SamAccountName <username> -ResolveGUIDs

# Get ACLs associated with the specified prefix to be used for search
Get-ObjectAcl -ADSprefix 'CN=Administrator,CN=Users' -Verbose

# Get ACLs associated with an LDAP path
Get-ObjectAcl -ADSpath "LDAP;//CN=Domain Admins,CN=Users,DC=child1,DC=myforest,DC=local" -ResolveGUIDs -Verbose

# Get the ACLs associated with a path
Get-PathAcl -Path "\\child1.myforest.local\sysvol"

# Search for Interesting ACEs
Invoke-ACLScanner -ResolveGUIDs

## Trust

# Get a list of all domain trusts
Get-NetDomainTrust
Get-NetDomainTrust -Domain child1.myforest.local

# Get details about the forest
Get-NetForest
Get-NetForest -Forest myforest.local

# Get all domains in the forest
Get-NetForestDomain # the domains are under the field "Name"
Get-NetForestDomain -Forest myforest.local

# Get all global catalogs for the forest
Get-NetForestCatalog
Get-NetForestCatalog -Forest myforest.local

# Get trusts related to the forest
Get-NetForestTrust
Get-NetForestTrust -Forest myforest.local


## Interesting Stuff for Attacks

# Get all Kerberoastable accounts (user accounts used as service accounts)
Get-NetUser -SPN

# Get all domain computers which have unconstrained delegation enabled
Get-NetComputer -UnConstrained

# Get all domain users/computers which have constrained delegation enabled
Get-ADObject -Filter {msDS-AllowedToDelegateTo -ne "$null"} -Properties msDS-AllowedToDelegateTo

# Get members of the DNSAdmins group
Get-NetGroupMember -GroupName "DNSAdmins"
