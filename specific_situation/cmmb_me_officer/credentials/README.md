# Pièces justificatives — à déposer ici

CMMB demande trois éléments : **« CV, Cover Letter, and copies of academic diplomas and
certificates »**. Les deux premiers sont générés depuis les sources `.tex` du dossier parent ;
**les diplômes et certificats ne sont pas dans ce dépôt** et doivent être déposés ici.

Le script `build_cmmb.sh` les fusionne en un seul fichier,
`outputs/Alexandro_Disla_Diplomas_Certificates.pdf`, qui constitue la troisième pièce jointe du
courriel.

## Nommage

Le script lit ce répertoire **trié par nom** et concatène les fichiers dans cet ordre. Utilisez
donc un préfixe numérique :

```
01_diplome_ctpea.pdf                    Diplôme d'Études Supérieures en Économie Appliquée — OBLIGATOIRE
02_bacc_saint_louis_de_gonzague.pdf     Baccalauréat — recommandé
03_certificats.pdf                      Certificats de formation — recommandé
```

## Ce que l'annonce valorise

L'annonce précise qu'une **certification en suivi-évaluation ou en statistique est un plus**. Si
un certificat de ce type existe (formation MEAL, statistique, DHIS2, gestion de données), placez-le
en `03_` : c'est la seule pièce du dossier qui répond directement à cette ligne. À défaut, le
diplôme du CTPEA couvre déjà l'exigence de base — « Degree in statistics, sociology, computer
science, economics, demography, international development, or a related field ».

## Formats acceptés

`.pdf` est repris tel quel. Les photos et scans `.jpg`, `.jpeg` et `.png` sont convertis
automatiquement en PDF par le script (via `sips`, présent d'office sur macOS) — il n'y a rien à
convertir à la main.

## Vérification avant envoi

Le script avertit si ce répertoire est vide et ne produit alors aucun PDF de pièces
justificatives. Ouvrez le fichier fusionné avant l'envoi et vérifiez que les pages sont lisibles :
un scan illisible équivaut à une pièce manquante.

## Confidentialité

Ce répertoire est ignoré par git (voir le `.gitignore` du dossier parent) — ne committez pas ces
fichiers.
