# Testplan

- Auteur(s) testplan: Maarten Adriaenssens

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

Verwacht resultaat:

- Mogelijke errors wijzen op nog niet bestaande directories, deze worden aangemaakt
- Zie fotos

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->

![Installation AD](.\img\Test-1_Installation-AD.png)

![Creation Scheduled Task](.\img\Test-1_Creation-ScheduledTask.png)

![Promotion DC and Reboot](.\img\Test-1_PromotionDC-Reboot.png)

![Autoboot powershell](.\img\Test-1_AutostartPowershell.png)

## Test: Controle Active Directory & DC promotie

Testprocedure:

1. Controlleer installatie AD via `Get-Service -Name NTDS`
2. Controlleer promotie van server naar domain controller via `Get-WmiObject -Query "select * from Win32_OperatingSystem where ProductType='2'"`

Verwacht resultaat:

- Rsults commands zie screenshots

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->

![Checkup AD installation](.\img\Test-2_CheckInstallation-AD.png)

![Checkup DC promotion](.\img\Test-2_CheckPromotion-DC.png)

## Test: Organisational Units en User creation

Testprocedure:

1. Lijst alle OU's die te maken hebben met RBMK op via `Get-ADOrganizationalUnit -Filter * | Select-Object DistinguishedName,Name`
2. Lijst alle Users en hun enkele van hun parameters via `Get-ADUser -Filter * | Select-object DistinguishedName,Name,SamAccountName`

Verwacht resultaat:

- Resultaat zie screenshots

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->

![Checkup creation OU's](.\img\Test-3_CheckCreation-OU.png)

![Checkup creation users](.\img\Test-3_CheckCreation-Users.png)

## Test: HomeDirectory creation

Testprocedure:

1. Open de powershell window (`15`)
2. Ga naar de directory `C:\ActiveDirectory\Users` (via commando `cd C:\ActiveDirectory\Users`)
3. Print alle items in de huidige directory (via commando `ls`)
4. Kijk enkel mappen in deze directory steekproefgewijs na. Deze bevatten allemaal minstens 1 user

Verwacht resultaat:

- Directory bestaat
- Bevat volgende mappen (met corresponderende user)
  - Admin
    - Ne_Jo
    - Ma_Ad
    - Te_As
    - Wo_De
    - Xa_Dh
  - Development
    - Mi_DR
    - Br_Ra
    - Se_Do
    - Ru_Mo
  - Extern
    - Ar_VV
  - HR
    - An_VM
    - Je_Co
  - Management
    - Se_La
    - Th_Cl
  - Public-Relations
    - Le_DM
  - Sales
    - Er_Ve
    - Ma_As

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->

![Resultaat cd en ls commando](.\img\Test-4_cd-ls.png)

![Resultaat ls commando Admin](.\img\Test-4_UserCheckAdmin.png)

![Resultaat ls commando Development](.\img\Test-4_UserCheckDev.png)

![Resultaat ls commando Extern](.\img\Test-4_UserCheckExt.png)

![Resultaat ls commando HR](.\img\Test-4_UserCheckHR.png)

![Resultaat ls commando Management](.\img\Test-4_UserCheckManage.png)

![Resultaat ls commando Public-Relations](.\img\Test-4_UserCheckPR.png)

![Resultaat ls commando Sales](.\img\Test-4_UserCheckSales.png)
