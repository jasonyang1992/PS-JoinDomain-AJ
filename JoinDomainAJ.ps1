$NICs = Get-WMIObject Win32_NetworkAdapterConfiguration |where{$_.IPEnabled -eq “TRUE”}
  Foreach($NIC in $NICs) {
$DNSServers = “192.168.0.253",”8.8.8.8"
 $NIC.SetDNSServerSearchOrder($DNSServers)
 $NIC.SetDynamicDNSRegistration(“TRUE”)
}

# Change the DNS server IP address
# Change the username
# Change the password
# Change the Domain name

$username = "test\joiner"
$password = "Password!@#"
$secstr = New-Object -TypeName System.Security.SecureString
$password.ToCharArray() | ForEach-Object {$secstr.AppendChar($_)}
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $secstr

add-computer -domainname test.lan -credential $cred

restart-computer -force