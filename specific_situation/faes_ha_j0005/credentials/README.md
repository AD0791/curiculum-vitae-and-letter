# Pièces justificatives — à déposer ici

Les deux annonces exigent **CV, diplôme et attestation de travail**. Le CV, l'attestation Tekkod et
le document de références sont générés depuis les sources `.tex` du dossier parent. **Seule la
copie du diplôme** ne peut pas l'être et doit être déposée ici.

## Nommage

`build_faes.sh` lit ce répertoire **trié par nom** et concatène les fichiers à la fin du
dossier fusionné. Préfixe numérique obligatoire :

```
01_diplome_ctpea.pdf                 Diplôme d'Études Supérieures en Économie Appliquée — OBLIGATOIRE
02_bacc_saint_louis_de_gonzague.pdf  Baccalauréat (facultatif)
```

## Formats acceptés

`.pdf` est repris tel quel. Les scans et photos `.jpg`, `.jpeg` et `.png` sont convertis
automatiquement en PDF par le script, via `sips` (présent d'office sur macOS).

## Note sur l'attestation Tekkod

Tekkod LLC n'ayant pas de papier à en-tête, le bloc d'identification en tête de l'attestation en
tient lieu. Le document ne porte pas de signature manuscrite : sa vérification repose sur
**M. Jean Evans Pierre, CEO, joignable au +1 (857) 492-1040**, dont le nom, la fonction et le
numéro figurent en pied de page.

Cela suppose qu'il connaisse **le contenu exact** de l'attestation avant l'envoi du dossier. Un
appel de vérification du FAES auquel il ne saurait pas répondre annulerait l'effet du document.
`email_prep.md` contient un courriel court pour le mettre au courant.

## Confidentialité

Ce répertoire est ignoré par git (voir le `.gitignore` du dossier parent) — ne committez pas ces
documents.
