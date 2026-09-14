# Pièces justificatives — à déposer ici

GOAL demande « des diplômes et ou des attestations d'études ». Rien d'autre : ni pièce d'identité,
ni NIF, ni attestation de travail. Le certificat de bonne vie et mœurs n'est exigé qu'**après** une
offre d'emploi.

## La pièce obligatoire

`01_attestation_ctpea.pdf` — copie de
`../../attestation_diplomes/AlexandroDISLA_CTPEA_AttestationTemp.pdf`, déjà déposée le
14 septembre 2026. Le CV et la lettre y renvoient explicitement (« attestation d'études jointe au
dossier ») : sans elle, la réserve sur le diplôme devient une affirmation invérifiable.

## Nommage

Le script lit ce répertoire **trié par nom** et fusionne chaque pièce après la feuille de
références.

```
01_attestation_ctpea.pdf              Attestation C.T.P.E.A — OBLIGATOIRE (déposée)
02_bacc_saint_louis_de_gonzague.pdf   Baccalauréat — facultatif
```

`.pdf` est repris tel quel ; `.jpg`, `.jpeg` et `.png` sont convertis en PDF par `sips`.

## Confidentialité

Ce répertoire est ignoré par git (voir le `.gitignore` du dossier parent), à l'exception de ce
fichier.
