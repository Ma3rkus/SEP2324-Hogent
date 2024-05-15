# Testplan

- Auteurs testplan: Neal Joos

## Test: Wordt de winclient1 VM correct geïnstalleerd?

Testprocedure:

1. Open een nieuw PowerShell-venster en open VirtualBox.
2. Verander de working directory in PowerShell naar `sep2324-gent-g02\opdracht\VMs\windows\winclient1\scripts`.
3. Voer `.\winclient1-init.ps1` uit in het PowerShell venster.
4. Er wordt gevraagd om _pathToIsoFile_ te definiëren. Geef het pad in van de Windows 10 installatieschijf. Dit bestand dien je zelf te downloaden vanaf Academic Software.
5. Optioneel: als je het script al eerder uitvoerde, dien je aan te geven dat je de reeds bestaande VM wenst te overschrijven.

Verwacht resultaat:

- Script voltooid zonder foutmeldingen en de laatste lijn geeft weer dat de VM succesvol gestart is.

  ```powershell
  PS C:\Users\nealj\Documents\School\sep2324-gent-g02\opdrachten\VMs\windows\winclient1\scripts> .\winclient1-init.ps1

  cmdlet winclient1-init.ps1 at command pipeline position 1
  Supply values for the following parameters:
  pathToIsoFile:
  PS C:\Users\nealj\Documents\School\sep2324-gent-g02\opdrachten\VMs\windows\winclient1\scripts> .\winclient1-init.ps1 C:\Users\nealj\Documents\ISOs\SW_DVD9_Win_Pro_10_20H2.10_64BIT_English_Pro_Ent_EDU_N_MLF_X22-76585.ISO
  WARNING: The VM winclient1 already exists.
  If you continue, the existing VM will be overwritten.
  Do you want to continue? y/N: y
  0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
  0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
  Virtual machine 'winclient1' is created and registered.
  UUID: b1284ed2-d583-4869-afbf-4ac816fc04c2
  Settings file: 'C:\Users\nealj\VirtualBox VMs\SEP\winclient1\winclient1.vbox'
  0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
  VBoxManage.exe: info: Preparing unattended installation of Windows10_64 in machine 'winclient1' (b1284ed2-d583-4869-afbf-4ac816fc04c2).
  VBoxManage.exe: info: Using values:
                            isoPath = C:\Users\nealj\Documents\ISOs\SW_DVD9_Win_Pro_10_20H2.10_64BIT_English_Pro_Ent_EDU_N_MLF_X22-76585.ISO
                                user = Administrator
                            password = rbmk2324
                        fullUserName =
                          productKey = NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
                    additionsIsoPath = C:\Program Files\Oracle\VirtualBox/VBoxGuestAdditions.iso
              installGuestAdditions = true
                validationKitIsoPath =
              installTestExecService = false
                              locale = nl_BE
                            country = BE
                            timeZone = Europe/Brussels
                              proxy =
                            hostname = winclient1.g02-rbmk.internal
        packageSelectionAdjustments =
                  auxiliaryBasePath = C:\Users\nealj\VirtualBox VMs\SEP\winclient1\Unattended-b1284ed2-d583-4869-afbf-4ac816fc04c2-
                          imageIndex = 1
                  scriptTemplatePath = C:\Program Files\Oracle\VirtualBox\UnattendedTemplates\win_nt6_unattended.xml
      postInstallScriptTemplatePath = C:\Users\nealj\Documents\School\sep2324-gent-g02\opdrachten\VMs\windows\winclient1\scripts\winclient1-post-install.cmd
                  postInstallCommand =
        extraInstallKernelParameters =
                            language = en-US
                    detectedOSTypeId = Windows10_64
                  detectedOSVersion = 10.0.19041.1165
                    detectedOSFlavor = Education
                detectedOSLanguages = en-US
                    detectedOSHints =
                  detectedImage[0]* = #1: Windows 10 Education (10.0.19041.1165 / x64 / en-US)
                    detectedImage[1] = #2: Windows 10 Education N (10.0.19041.1165 / x64 / en-US)
                    detectedImage[2] = #3: Windows 10 Enterprise (10.0.19041.1165 / x64 / en-US)
                    detectedImage[3] = #4: Windows 10 Enterprise N (10.0.19041.1165 / x64 / en-US)
                    detectedImage[4] = #5: Windows 10 Pro (10.0.19041.1165 / x64 / en-US)
                    detectedImage[5] = #6: Windows 10 Pro N (10.0.19041.1165 / x64 / en-US)
                    detectedImage[6] = #7: Windows 10 Pro Education (10.0.19041.1165 / x64 / en-US)
                    detectedImage[7] = #8: Windows 10 Pro Education N (10.0.19041.1165 / x64 / en-US)
                    detectedImage[8] = #9: Windows 10 Pro for Workstations (10.0.19041.1165 / x64 / en-US)
                    detectedImage[9] = #10: Windows 10 Pro N for Workstations (10.0.19041.1165 / x64 / en-US)
  VBoxManage.exe: info: VM 'winclient1' (b1284ed2-d583-4869-afbf-4ac816fc04c2) is ready to be started (e.g. VBoxManage startvm).
  Waiting for VM "winclient1" to power on...
  VM "winclient1" has been successfully started.
  ```

- Als er al een VM met de naam _winclient1_ bestaat, moet het script toestemming vragen om deze te mogen overschrijven. (zie bovenstaande output)
- De VM _winclient1_ is aangemaakt en start headless op.
- Buiten de stappen vermeld in de testprocedure, is er geen interactie van de gebruiker meer nodig en dient alles automatisch te verlopen.
- De VM reboot exact twee keer automatisch bij de eerste opstart.

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->

![Screenshot output VirtualBox](.\img\test1.png)

## Test: Zijn de VirtualBox Guest Additions automatisch geïnstalleerd?

Testprocedure:

1. Open een nieuw PowerShell venster op de host.
2. Voeg het VirtualBox pad toe aan de padvariabele door volgend commando uit te voeren:

   ```powershell
   $env:PATH = $env:PATH + ";C:\Program Files\Oracle\VirtualBox"
   ```

3. Voer het volgende commando uit om de details van de _winclient1_ VM op te vragen.

   ```powershell
   VBoxManage.exe showvminfo winclient1
   ```

Verwacht resultaat:

- De output (van het laatste deel) dient gelijkaardig te zijn aan onderstaande output. Vooral _Additions run level_ dient de waarde 3 te hebben.

  ```powershell
  * Guest:
  Configured memory balloon:   0MB
  OS type:                     Windows10_64
  Additions run level:         3
  Additions version:           7.0.14 r161095
  Guest Facilities:
  Facility "VirtualBox Base Driver": active/running (last update: 2024/03/12 19:48:55 UTC)
  Facility "Auto Logon": terminated (last update: 2024/03/12 19:49:15 UTC)
  Facility "VirtualBox System Service": active/running (last update: 2024/03/12 19:48:59 UTC)
  Facility "VirtualBox Desktop Integration": active/running (last update: 2024/03/12 19:49:27 UTC)
  Facility "Seamless Mode": active/running (last update: 2024/03/12 19:49:27 UTC)
  Facility "Graphics Mode": active/running (last update: 2024/03/12 19:49:27 UTC)
  ```

<!-- Voeg hier eventueel een screenshot van het verwachte resultaat in. -->
