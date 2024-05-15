# Testrapport

- Uitvoerder test: Neal Joos
- Uitgevoerd op: 13/03/2024
- Github commit: ??

## Test: ScriptCompletion

Testprocedure:

1. Script runnen in `Execution policy unrestricted`
2. Script maakt `Active Directory` aan
3. Script maakt `Scheduled task` aan
4. Script start installatie `DNS`
5. Server herstart vanzelf
6. Server opent powershell in Admin versie, en wacht 90 seconden
7. Script `AfterReboot` zorgt voor Organisational unit en corresponderende user creation
8. Script verwijdert `Scheduled task`

Verkregen resultaat:

- Zelfde resultaten als in het testplan.

<!-- Voeg hier eventueel een screenshot van het verkregen resultaat in. -->

Test geslaagd:

- [x] Ja
- [ ] Nee

Opmerkingen:

- Na het automatisch herstarten van de VM duurt de opstart van de server vrij lang, maar ik vermoed dat dit normaal is.

## Test: Controle Active Directory & DC promotie

Testprocedure:

1. Controlleer installatie AD via `Get-Service -Name NTDS`
2. Controlleer promotie van server naar domain controller via `Get-WmiObject -Query "select * from Win32_OperatingSystem where ProductType='2'"`

Verkregen resultaat:

- De uitvoer van het command `Get-Service -Name NTDS` is gelijk aan het verwachte resultaat.

  ![Checkup AD installation](.\img\testrapport-AD-NJ-img1.png)

- De uitvoer van het command `Get-WmiObject -Query "select * from Win32_OperatingSystem where ProductType='2'"` is gelijkaardig aan het verwachte resultaat.

  ![Checkup DC promotion](.\img\testrapport-AD-NJ-img2.png)

Test geslaagd:

- [x] Ja
- [ ] Nee

Opmerkingen:

- /

## Test: Organisational Units en User creation

Testprocedure:

1. Lijst alle OU's die te maken hebben met RBMK op via `Get-ADOrganizationalUnit -Filter * | Select-Object DistinguishedName,Name`
2. Lijst alle Users en hun enkele van hun parameters via `Get-ADUser -Filter * -SearchBase RBMK-Users | Select-object DistinguishedName,Name,SamAccountName`

Verkregen resultaat:

- De uitvoer van het command `Get-ADOrganizationalUnit -Filter * | Select-Object DistinguishedName,Name` is gelijk aan het verwachte resultaat.

  ![Checkup creation OU's](.\img\testrapport-AD-NJ-img3.png)

- De uitvoer van het command `Get-ADUser -Filter * -SearchBase RBMK-Users | Select-object DistinguishedName,Name,SamAccountName` geeft een foutmelding en is niet gelijkaardig aan het verwachte resultaat.

  ![Checkup creation users](.\img\testrapport-AD-NJ-img4.png)

Test geslaagd:

- [ ] Ja
- [x] Nee

Opmerkingen:

- /

## Test: HomeDirectory creation

Testprocedure:

1. Open de powershell window (`15`)
2. Ga naar de directory `C:\ActiveDirectory\Users` (via commando `cd C:\ActiveDirectory\Users`)
3. Print alle items in de huidige directory (via commando `ls`)
4. Kijk enkel mappen in deze directory steekproefgewijs na. Deze bevatten allemaal minstens 1 user

Verkregen resultaat:

- De uitvoer van de bovenstaande testprocedure is gelijk aan het verwachte resultaat.

  ![Resultaat cd en ls commando](.\img\testrapport-AD-NJ-img5.png)

Test geslaagd:

- [x] Ja
- [ ] Nee

Opmerkingen:

- /
