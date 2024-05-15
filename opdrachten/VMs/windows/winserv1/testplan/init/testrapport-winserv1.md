# Testrapport

- Uitvoerder(s) test: Maarten Adriaenssens
- Uitgevoerd op: 14/03/2024
- Github commit: 7cc93b

## Test: Wordt de winserv1 VM correct geïnstalleerd?

Testprocedure:

1. Open een nieuw PowerShell-venster en open VirtualBox.
2. Verander de working directory in PowerShell naar `sep2324-gent-g02\opdracht\VMs\windows\winserv1\scripts`.
3. Voer `.\winserv1-init.ps1` uit in het PowerShell venster.
4. Er wordt gevraagd om _pathToIsoFile_ te definiëren. Geef het pad in van de Windows Server 2022 installatieschijf. Dit bestand dien je zelf te downloaden vanaf Academic Software.
5. Optioneel: als je het script al eerder uitvoerde, dien je aan te geven dat je de reeds bestaande VM wenst te overschrijven.

Verkregen resultaat:

- Configuratie geslaagd

<!-- Voeg hier eventueel een screenshot van het verkregen resultaat in. -->

![Configuratie geslaagd](./img/Test-1_ConfigComplete.png)

![Configuratiescher Vbox](./img/Test-1_ConfigScreen.png)

Test geslaagd:

- [x] Ja
- [ ] Nee

Opmerkingen:

- Geen

## Test: Zijn de VirtualBox Guest Additions automatisch geïnstalleerd?

Testprocedure:

1. Open een nieuw PowerShell venster op de host.
2. Voeg het VirtualBox pad toe aan de padvariabele door volgend commando uit te voeren:

   ```powershell
   $env:PATH = $env:PATH + ";C:\Program Files\Oracle\VirtualBox"
   ```

3. Voer het volgende commando uit om de details van de _winserv1_ VM op te vragen.

   ```powershell
   VBoxManage.exe showvminfo winserv1
   ```

Verkregen resultaat:

- Controle oke

<!-- Voeg hier eventueel een screenshot van het verkregen resultaat in. -->

![Guest overview powershell](./img/Test-2_Guest.png)

Test geslaagd:

- [x] Ja
- [ ] Nee

Opmerkingen:

- Geen

## Test: Is het IPv4-adres correct ingesteld?

Testprocedure:

1. Open een nieuw PowerShell venster in de _winserv1_ VM. Of kies optie 15 om SConfig te sluiten en een PowerShell venster weer te geven.
2. Voer het commando `ipconfig` uit.

Verkregen resultaat:

- Zie screenshot, komt overeen met testplan
- ...

<!-- Voeg hier eventueel een screenshot van het verkregen resultaat in. -->

![ipconfig](./img/Test-3_ipconfig.png)

Test geslaagd:

- [x] Ja
- [ ] Nee

Opmerkingen:

- Geen

## Test: Is de DNS-server juist ingesteld?

Testprocedure:

1. Open een nieuw PowerShell venster in de _winserv1_ VM. Of kies optie 15 om SConfig te sluiten en een PowerShell venster weer te geven.
2. Voer het commando `Get-DnsClientServerAddress` uit.

Verkregen resultaat:

- Zie screenshot, komt overeen met testplan
<!-- Voeg hier eventueel een screenshot van het verkregen resultaat in. -->

![ipconfig](./img/Test-4_DNS.png)

Test geslaagd:

- [x] Ja
- [ ] Nee

Opmerkingen:

- Geen
