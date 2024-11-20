# System Engineering Project

| Naam            | GitHub gebruikersnaam                               |
| :-------------- | :-------------------------------------------------- |
| Xander Dheedene | [XanderDheedene](https://github.com/XanderDheedene) |
| Neal Joos       | [nealjoos](https://github.com/nealjoos)             |
| Wout De Temmerman        | [Wout-De-Temmerman](https://github.com/Wout-De-Temmerman)             |
| Maarten Adriaenssens        | [Maarten-Adriaenssens](https://github.com/Maarten-Adriaenssens)  / [Maarten-Adriaenssens](https://github.com/Ma3rkus)           |
| Tariq Asifi        | [Tariq-Asifi](https://github.com/tariqasifi)             |

Dit is de repository voor het projectvak System Engineering Project.

:exclamation: In elke map is `README.md` steeds het startpunt van de documentatie. **Neem deze goed door!**

:bulb: Bij templates wordt er gebruik gemaakt van `<!-- Markdown comments. -->`. Open deze met een teksteditor en vervang deze door wat er gevraagd wordt. Previews tonen deze comments default niet, vandaar dat het belangrijk is om een teksteditor te gebruiken.

## Voorbereiding

Volgende taken worden door **één groepslid** uitgevoerd:

- Maak de centrale GitHub repo aan via de GitHub classroom link.
- Voeg alle teamleden toe aan de GitHub repo.
- Maak de Jira site aan en configureer deze.
- Maak het kanban bord aan.

Volgende taken dienen door **elk groepslid** uitgevoerd te worden:

- Vul de tabel bovenaan dit document aan met jouw GitHub account.
- Lees de [studiewijzer](./studiewijzer.md) en alle `README.md` bestanden in de repository goed door.

Volgende taken dienen **als team** uitgevoerd te worden:

- Opstellen roadmap. Dit is een visueel overzicht van de 12 weken planning van het project. Dit kan je doen in Jira. Ten laatste tegen week 3 is een eerste draft aangemaakt.
  - Leg de werkverdeling voor de eerste week vast.
  - Voeg de planning toe aan het kanban bord: maak de juiste tickets aan.
- Lees je in en doe research voor bepaalde onderwerpen.

Op Chamilo kan je ook de slides van de kick-off terugvinden en de opname ervan herbekijken.

## Tijdens het project

Wekelijks/tweewekelijks:

- Maak een [opvolgingsrapport](./analyse/README.md) aan **voor** aanvang van het contactmoment.

Bij aanvang nieuwe deelopdracht:

- Maak een map voor de [opdracht](./opdrachten/README.md) in [opdrachten](./opdrachten/) en plaats daar alle benodigde documenten (broncode, lastenboek, testplan, testrapport, ...) in.

## Bij het afwerken van het project

Vul dit document onderaan aan met een inhoudstabel waar we alle belangrijke documenten kunnen vinden.

## Afspraken ivm communicatie, gebruik tools

Beschrijf hier of in een apart document al wat jullie onderling of met jullie begeleiders afgesproken hebben i.v.m. samenwerken: werkwijze gebruik versiebeheer, kanban bord en tijdregistratie, voorbereiden weekrapporten, ... .

## Inhoud GitHub repo

- Er is een directe link naar de [onedrive](https://hogent-my.sharepoint.com/:f:/g/personal/maarten_adriaenssens_student_hogent_be/EpPaxCjOs1hBuMO5OByVOzUBr3pf3gYn3YTcx18-7bq4_w?e=euwvvG
) van de gedeelde map voor words, powerpoint en andere.

### [Extra Info](./extra-info/)

- Bevat notities van extra infomomenten en andere informatie verschaft door begeleiders

### [Opdrachten](./opdrachten/)

- Hoofddirectory van het project en wordt opgedeeld in deelprojecten
  - [Installatie](/opdrachten/Installatie/)
    - Bevat alle informatie betreffende het volledige installatieproces van het project
    - Waaronder ook het vollledige [plan](./opdrachten/Installatie/Installatieplan.md) met afbeeldingen van de serverroom en -rack.
  - [Netwerken](./opdrachten/Netwerken/)
    - Bevat alle informatie en bestanden betreffende de voorbereiding en deployment van het volledige netwerk
    - Waaronder de [huidige packettracer](https://github.com/HoGentTIN/sep2324-gent-g02/raw/main/opdrachten/Netwerken/PT-basis-simulatie.pkt) en [IP-tabel](./opdrachten/Netwerken/IP-adrestabel.md), met corresponderende [topology](./opdrachten/Netwerken/Topology.png)
  - [Offerte](./opdrachten/Offerte/)
    - Bevat alle informatie corresponderend met de offerte
  - [Templates](./opdrachten/templates/)
  - [VMs](./opdrachten/VMs/)
    - [Linux](./opdrachten/VMs/linuxvms/)
      - Bevat alle documentatie om de linux vm's automatisch te deployen en configureren via vagrant
    - [Windows](./opdrachten/VMs/windows/)
      - Bevat alle documentatie om de windows server vm's automatisch te deployen en configureren
  - [Voorbeelden](./opdrachten/voorbeelden/)
  - [Andere files voor opdrachtomschrijving](/opdrachten/README.md)

### [Opvolging](./opvolging/)

- Bevat alle bestanden om de verloop van het project op te volgen
  - Wekelijkse rapporten met corresponderende map met afbeeldingen
  - [Algemene opvolgingstemplates](./opvolging/templates/)
  - [Voorbeelden](./opvolging/voorbeelden/)
    - Bevat voorbeeldbestanden van onderandere een opvolgingsrapport
