# Testrapport

- Uitvoerder(s) test: Maarten Adriaenssens
- Uitgevoerd op: 19/03/2024 - 19.45
- Github commit: 7902be

## Test: Wordt het script correct geïnstalleerd?

Testprocedure:

1. Open een PowerShell-venster binnen _winserv1_.
2. Verander de working directory in PowerShell naar `Z:\DHCP`.
3. Voer `.\winserv1-dhcp-install.ps1` uit.

Verkregen resultaat:

- Script voltooit zonder error

<!-- Voeg hier eventueel een screenshot van het verkregen resultaat in. -->

Test geslaagd:

- [ ] Ja
- [ ] Nee

Opmerkingen:

- Geen

## Test: Wordt de DHCP-server gekoppeld aan de juiste interface?

Testprocedure:

1. Voer `Get-DhcpServerv4Binding` uit.

Verkregen resultaat:

- Commando geeft verwacht output weer (zie screenshot)

<!-- Voeg hier eventueel een screenshot van het verkregen resultaat in. -->

Test geslaagd:

- [ ] Ja
- [ ] Nee

Opmerkingen:

- Geen

## Test: Wordt de DHCP-scope aangemaakt zoals het moet?

Testprocedure:

1. Voer `Get-DhcpServerv4Scope` uit.

Verkregen resultaat:

- Commando geeft verwacht output weer (zie screenshot)

<!-- Voeg hier eventueel een screenshot van het verkregen resultaat in. -->

Test geslaagd:

- [ ] Ja
- [ ] Nee

Opmerkingen:

- Geen
