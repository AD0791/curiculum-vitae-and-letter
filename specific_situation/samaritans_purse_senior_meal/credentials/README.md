# Pièces justificatives — à déposer ici

Samaritan's Purse exige **un seul PDF** contenant la lettre, le CV, les diplômes, les certificats,
le NUI et le NIF. Les quatre premiers documents sont générés depuis les sources `.tex` du dossier
parent ; **les pièces justificatives ne sont pas dans ce dépôt** et doivent être déposées ici.

## Nommage

Le script `build_sp.sh` lit ce répertoire **trié par nom** et concatène les fichiers dans cet
ordre à la suite des quatre documents. Utilisez donc un préfixe numérique :

```
01_diplome_ctpea.pdf                    Diplôme d'Études Supérieures en Économie Appliquée
02_bacc_saint_louis_de_gonzague.pdf     Baccalauréat (facultatif)
03_certificats.pdf                      Certificats de formation (facultatif)
04_nui.pdf                              Numéro d'Identification Unique — OBLIGATOIRE
05_nif.pdf                              Numéro d'Identification Fiscale — OBLIGATOIRE
```

## Formats acceptés

`.pdf` est repris tel quel. Les photos et scans `.jpg`, `.jpeg` et `.png` sont convertis
automatiquement en PDF par le script (via `sips`, présent d'office sur macOS) — il n'y a rien à
convertir à la main.

## Vérification avant envoi

Le script avertit si ce répertoire est vide, mais **il ne peut pas savoir si le NUI et le NIF y
sont**. Ouvrez le PDF fusionné et vérifiez que les deux pages y figurent : sans elles, la
candidature est rejetée comme incomplète.

## Confidentialité

Ces fichiers contiennent des documents d'identité. Ce répertoire est ignoré par git
(voir `.gitignore` du dossier parent) — ne les committez pas.
