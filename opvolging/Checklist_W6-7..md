# Basisopdracht

## Algemeen

- [x] IP-tabel
- [x] Volledige automatisatie van linux vm's
- [x] Geen gebruik van containertechnieken
- [ ] Idempotente scripts
- [ ] Correct gebruik van testplannen

## Netwerk

- [x] Geen verspilling van IP-adressen
- [x] ISP (iteratie 1) = 192.168.102.254/30
- [x] Uplink interface = 192.168.102.253/30

### Basisnetwerk - iteratie 1

- [x] Correcte VLAN's [zie basisopdracht voor verder beschrijving](../opdrachten/basis.md)
- [x] Router-on-a-stick wordt gebruikt
- [x] TFTP-server wordt gebruikt voor config-upload
- [ ] Static routes die ISP configureren zijn gekent
- [ ] VM's draaien interfaces op 'Bridged mode'

### Basisnetwerk - iteratie 2

In een tweede iteratie baseer je jou op de kennis verworven in 'Computer Networks 3'. Deze zaken zal je pas kunnen implementeren nadat in dit vak de relevante lessen gegeven zijn.

- Configureer zelf NAT op je uplink router, die als publiek adres een IP-adres uit de netwerk-range van het leslokaal gebruikt (automatisch ingesteld via DHCP, de router wordt hier client!). Het subnetwerk (.252/30) naar de ISP-router uit iteratie 1 verdwijnt dan uit de set-up.
- (\*1) Werk de Cisco router bij met de nodige Access Control Lists (ACLs) om het netwerk te beperken. Bouw deze firewall regels op vanuit het 'principle of least privilege': enkel de gekende communicatie tussen de drie netwerken wordt toegelaten; andere subnets en poorten worden by default geweigerd.
- Blijf (vanzelfsprekend) werken met configuraties die, na het booten van de netwerktoestellen, opgeladen worden vanaf de TFTP-server - je kan jezelf vermeien met deze semi-geautomatiseerde manier van werken!

## Windows servers

[x] Windows Server is CLI based

### Domain Controller

[x] Active Driectory wordt gecontrolleerd door DC
[x] Windows Server is versie 2022 Standard zonder gui
[x] Root domain van AD is ad.g02-rbmk.internal
[x] Gebruik eigen domeinstructuur
[ ] PC's hebben geen lokal users
[x] Gebruik van Group policies
[ ] Shared folder voor elke user
[x] Bevat DNS
[x] DNS bevat nodige A-records, PTR-records & CNAME-records

### Linux servers

[x] Linux Server is laatste versie van AlmaLinux cli
[ ] SELinux staat aan
[ ] Servers zijn beschikbaar via SSH
[ ] Geen Root user

#### Databank

[ ] Enkel poorten nodig voor de databank en SSH staan open in de firewall
[ ] Databank aanvaardt enkel connecties vna webserver

#### Webserver

- [ ] Webserver VM bevat CMS voor connectie met databank
- [ ] Inloggen en posten mogelijk

#### Reverse proxy

- [ ] reverse proxy gebruikt HTTP/**2** over TLS
- [ ] als de webserver gescand wordt met nmap, geeft deze geen informatie over de versie van de server.

#### TFTP-server

- [x] Netwerktoestellen worden via deze TFTP-server geconfigureerd.
- [x] De automatische installatie kopieert de netwerkconfiguraties naar de juiste map op deze server.
