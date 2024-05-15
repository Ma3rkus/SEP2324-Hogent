# Deployment order

1. Creation of ***windows server 2*** via the init script
2. run script [DNS failover](opdrachten\VMs\windows\winserv1\scripts\DNS\winserv1-dns-failover.ps1) on ***windows server 1***
3. Run script [DNS config](./DNS/winserv2-dns-config.ps1) on ***windows server 2***
4. Run script [DHCP installation](./DHCP/winserv2-dhcp-installation.ps1) on ***windows server 2***
5. Run script [DHCP failover](./DHCP/winserv2-dhcp-installation.ps1) on ***windows server 1***
6. Run script [DHCP follow-up](./DHCP/winserv2-dhcp-followup.ps1) on ***windows server 2***
