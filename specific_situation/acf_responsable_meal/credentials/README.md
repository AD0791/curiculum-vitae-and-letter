# Pièces justificatives — à déposer ici

Les lettres et les CV sont générés depuis les sources `.tex` du dossier parent. **Les pièces
justificatives ne sont pas dans ce dépôt** et doivent être déposées ici avant de lancer
`../build_acf.sh`, qui les fusionne à la suite des quatre documents.

## La pièce obligatoire

L'attestation C.T.P.E.A est **indispensable**, et pas seulement souhaitable : le CV et la lettre de
motivation y renvoient explicitement (« attestation officielle jointe au dossier »). Envoyer le
dossier sans elle transformerait une réserve honnête en affirmation non étayée.

Le fichier existe déjà dans le dépôt, à la racine du projet — il n'est **pas** recopié ici, la
règle du dépôt voulant que les diplômes vivent uniquement dans `attestation_diplomes/` :

```
../../attestation_diplomes/AlexandroDISLA_CTPEA_AttestationTemp.pdf
```

Copiez-le (ou faites-en un lien) sous le nom `01_attestation_ctpea.pdf`.

## Nommage

Le script lit ce répertoire **trié par nom** : utilisez un préfixe numérique pour commander
l'ordre des pages dans le PDF final.

```
01_attestation_ctpea.pdf        Attestation C.T.P.E.A — OBLIGATOIRE
02_bacc_saint_louis_de_gonzague.pdf  Baccalauréat (facultatif)
03_certificats_travail.pdf      Certificats / attestations de travail (Caris, HANWASH, MPCE…)
04_certificats_formation.pdf    Certificats de formation (facultatif)
05_piece_identite.pdf           CIN ou passeport
06_nif.pdf                      Numéro d'Identification Fiscale
07_nui.pdf                      Numéro d'Identification Unique
```

Les items 02 à 07 sont des **conjectures** sur la composition attendue : la section « Dossier de
candidature » de l'annonce renvoie à une liste de pièces qui n'a pas été diffusée (voir
`../inputs/acf_responsable_meal_jd.md`). Si vous retrouvez la liste exacte, alignez ce répertoire
dessus et corrigez la checklist de `../email_prep.md`. Tant qu'elle manque, déposer large vaut
mieux que déposer court : l'annonce précise que les candidatures incomplètes ne seront pas
considérées.

## Formats acceptés

`.pdf` est repris tel quel. Les scans et photos `.jpg`, `.jpeg` et `.png` sont convertis
automatiquement en PDF par le script (via `sips`, livré d'office sur macOS).

## Vérification avant envoi

Le script signale un répertoire vide, mais il ne peut pas savoir *quelles* pièces y sont. Ouvrez le
PDF fusionné et vérifiez page par page que l'attestation C.T.P.E.A y figure.

## Confidentialité

Ces fichiers contiennent des documents d'identité. Ce répertoire est ignoré par git (voir le
`.gitignore` du dossier parent) — ne les committez pas.
