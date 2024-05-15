# GIT

## Algemeen

- Hou branches zo kort mogelijk
  - Nieuwe branch gebruiken : `git checkout -b new_branch`
  - Terug gaan naar main branch: `git switch main`
- Beter om files en changes individueel te pushen / adden niet via `git commit -am "Message"`
  - Reden: Bij foute push moeilijk te backtracken
- Check zo veel mogelijk met `git status`
- Checken wat de laatste wijziging per branch is -> `git tree`
- Terugkeren naar commit 1a2b3c -> `git reset 1a2b3c`
- `git fetch` is een controle van nieuwe aanpassingen van de huidige repo
  - Te vergelijken met `update` en `upgrade` in ubuntu 
    - `git fetch` = `update` 
    - `git merge` = `upgrade`
    - Vormt samen het `git pull`-proces

## Merge-conlicten oplossen

- `diff3` algoritme introduceren of gemeenschappelijke ouder te tonen
  - `diff --color-words` is een standaard git commando
- Check stappen via `git status`
- `git log` toont de branch merge en merge-error fix
- Achterhalen wie aanpassing heeft gemaakt -> `git blame`

## Bij grote projecten `Pull requests`

- Van GitLab en GitHub
- Vergrendelen van main branch
- Een Pull request naar eigenaar van main branch
