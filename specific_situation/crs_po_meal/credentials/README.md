# Copies de diplômes — à déposer ici

La lettre et le CV sont générés depuis les sources `.tex` du dossier parent ; **les copies de
diplômes ne sont pas dans ce dépôt** et doivent être déposées ici avant de lancer `../build_po.sh`,
qui les réunit en un seul PDF (`outputs/Alexandro_Disla_Diplomes_CRS.pdf`).

## Différence avec le dossier Senior Project Officer

L'avis SPO exigeait explicitement « une lettre de motivation, un CV détaillé et des copies de
diplômes » envoyés par courriel. **La fiche Project Officer n'énumère aucune pièce** : elle renvoie
à un formulaire en ligne. Produire le PDF des diplômes reste néanmoins nécessaire — le formulaire
demandera très probablement de téléverser un justificatif de diplôme, et le CV comme la lettre y
renvoient (« attestation officielle jointe au dossier »).

## La pièce obligatoire

L'attestation C.T.P.E.A atteste la qualification de base. Le poste exige un **Bac+2** ; l'attestation
documente un cycle complet de quatre ans en économie et statistique appliquées, donc au-delà. C'est
un argument plus simple à tenir que pour le poste SPO, qui demandait une licence.

Le fichier existe déjà dans le dépôt, à la racine du projet ; il n'est **pas** recopié ici, la règle
voulant que les diplômes vivent uniquement dans `attestation_diplomes/` :

```
../../attestation_diplomes/AlexandroDISLA_CTPEA_AttestationTemp.pdf
```

Copiez-le sous le nom `01_attestation_ctpea.pdf`.

## Nommage

Le script lit ce répertoire **trié par nom** : le préfixe numérique commande l'ordre des pages.

```
01_attestation_ctpea.pdf              Attestation C.T.P.E.A — OBLIGATOIRE
02_bacc_saint_louis_de_gonzague.pdf   Baccalauréat (facultatif)
03_certificats_formation.pdf          Certificats de formation (facultatif)
```

La fiche de poste ne demande **ni pièce d'identité, ni NIF, ni NUI** — ne pas en ajouter tant que le
formulaire en ligne ne l'exige pas explicitement.

## Formats acceptés

`.pdf` est repris tel quel. Les scans et photos `.jpg`, `.jpeg` et `.png` sont convertis
automatiquement en PDF par le script (via `sips`, livré d'office sur macOS).

## Vérification avant envoi

Le script signale un répertoire vide, mais il ne peut pas savoir *quelles* pièces y sont. Ouvrez
`outputs/Alexandro_Disla_Diplomes_CRS.pdf` et vérifiez que l'attestation C.T.P.E.A y figure et
qu'elle est lisible.

## Confidentialité

Ce répertoire est ignoré par git (voir le `.gitignore` du dossier parent) — ne le committez pas.
