# Pièces justificatives — à déposer ici

`../build_acted_meal.sh` fusionne ce répertoire, trié par nom, à la suite de la lettre, du CV et
des références dans `outputs/Alexandro_Disla_Dossier_ASSISTMEAL_2610.pdf`.

L'annonce exige **copie diplômes** et **copie de carte d'identité**, et prévient que les dossiers
incomplets ne seront pas traités. Le script signale bruyamment l'absence de l'une ou l'autre.

```
01_attestation_ctpea.pdf   Attestation C.T.P.E.A — copie de ../../../attestation_diplomes/
02_carte_identite.pdf      CIN (ou .jpg / .png, converti automatiquement) — À FOURNIR
```

Les noms doivent contenir `attestation`/`ctpea` et `identite`/`cin`/`passeport` : c'est ainsi que
le script vérifie leur présence.

Ces fichiers contiennent des documents d'identité. Ce répertoire est ignoré par git (voir le
`.gitignore` du dossier parent) — ne pas les committer.
