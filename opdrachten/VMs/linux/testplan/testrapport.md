# Testrapport

- Uitvoerder(s) test: Maarten Adriaenssens
- Uitgevoerd op: 3/03/2024
- Github commit: 419c120

## Test: Netwerkverbinding (hostonly)

Testprocedure:

1. Open een terminal venster in deze map.
2. Run `vagrant up`.
3. Ping van op de host naar `192.168.102.131` (Databank).
4. Ping van op de host naar `192.168.102.132` (Webserver).

Verkregen resultaat:

- Ping slaagt zowel bij `192.168.102.131` als bij `192.168.102.132`

<!-- Voeg hier eventueel een screenshot van het verkregen resultaat in. -->

![Ping 192.168.102.131](./img/Test/Test-1_Ping-131.png)
![Ping 192.168.102.132](./img/Test/Test-1_Ping-132.png)

Test geslaagd:

- [x] Ja
- [ ] Nee

Opmerkingen:

- Geen

## Test: Laden website

Testprocedure:

1. Open een browser naar keuze.
2. Surf naar `http://192.168.102.132`.

Verkregen resultaat:

- Site opent

<!-- Voeg hier eventueel een screenshot van het verkregen resultaat in. -->

![Webiste view](./img/Test/Test-2_Website.png)

Test geslaagd:

- [x] Ja
- [ ] Nee

Opmerkingen:

- Geen

## Test: Aanpassen website

Testprocedure:

1. Open een browser naar keuze.
2. Surf naar `http://192.168.102.132/wp-admin`.
3. Log in met username: `rbmk2324` en password: `rbmk2324`
4. Klik linksboven naast het worpress logo op rbmk


5. Klik linksboven naast rbmk op `Edit site`

6. Selecteer een afbeelding en vervang deze met een eigen upload


7. Selecteer een afbeelding op jouw schijf.
8. Sla deze aanpassing op door rechtsboven op save te drukken.
9. Keer terug naar de homepagina (`http://192.168.102.132/`).


Verkregen resultaat:

- Alle stappen doorlopen, screenshots als bewijs

<!-- Voeg hier eventueel een screenshot van het verkregen resultaat in. -->

![Aangmelden Admin](./img/Test/Test-3_AdminLogin.png)
![Aanpaswindow site](./img/Test/Test-3_EditView.png)
![Website met veranderde afbeelding](./img/Test/Test-3_ChangedPicture.png)

Test geslaagd:

- [x] Ja
- [ ] Nee

Opmerkingen:

- Geen

## Test: <!-- Omschrijving test. -->

Test procedure:

1. ...
2. ...

Verkregen resultaat:

- ...
- ...

<!-- Voeg hier eventueel een screenshot van het verkregen resultaat in. -->

Test geslaagd:

- [ ] Ja
- [ ] Nee

Opmerkingen:

- ... 