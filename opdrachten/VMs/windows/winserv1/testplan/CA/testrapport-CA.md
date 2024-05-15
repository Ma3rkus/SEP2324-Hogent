# Testrapport

- Uitvoerder(s) test: Maarten Adriaensens
- Uitgevoerd op: 8/05/2024
- Github commit: 61a1df

## Test: Wordt het script correct geïnstalleerd?

Testprocedure:

1. Open een PowerShell-venster op _winserv1_.
2. Verander de working directory in PowerShell naar `Z:\CA`.
3. Voer `.\winserv1-CA-config.ps1` uit.

Verkregen resultaat:

- zie screenshot
<!-- Voeg hier eventueel een screenshot van het verkregen resultaat in. -->

![resultaat script](./img/test1.png)

Test geslaagd:

- [x] Ja
- [ ] Nee

## Test: Worden de scripts correct overgezet naar de reverse proxy?

Testprocedure:

1. Zorg dat _proxy1_ draait (zie testplan _proxy1_).
2. Open een PowerShell-venster op _winserv1_.
3. Verander de working directory in PowerShell naar `Z:\CA`.
4. Voer `.\winserv1-CA-transfer-cert.ps1` uit.

Verkregen resultaat:

- zie screenshot

<!-- Voeg hier eventueel een screenshot van het verkregen resultaat in. -->

![Transfer result](./img/Test2.png)

Test geslaagd:

- [x] Ja
- [ ] Nee

## Test: Is het certificaat vertrouwd op de clients?

Testprocedure:

1. Start _winclient1_ volgens het testplan.
2. Open een browservenster en ga naar [https://g02-rbmk.internal](https://g02-rbmk.internal)
3. Bekijk de certificaatdetails, dit dient overeen te komen met de onderstaande uitvoer.
Verkregen resultaat:

- zie screenshot

<!-- Voeg hier eventueel een screenshot van het verkregen resultaat in. -->

![Certificate in browser](./img/Test3.png)

Test geslaagd:

- [x] Ja
- [ ] Nee