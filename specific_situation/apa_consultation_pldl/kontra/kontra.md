---
title: "Kontra konsiltasyon"
subtitle: "Zouti PL-DL yo sou CommCare · Anseye Pou Ayiti"
author: "Alexandro Disla, konsiltan done ak MEAL"
date: "Novanm 2026"
fontsize: 10pt
geometry: "a4paper, top=1.9cm, bottom=1.8cm, left=2cm, right=2cm, headsep=8pt, footskip=22pt"
---

Mwen, Alexandro Disla, konsiltan done ak MEAL, ap fè yon konsiltasyon pou ekip Anseye Pou Ayiti
(APA) sou operasyonalizasyon zouti PL-DL yo sou CommCare. Konsiltasyon an dire **de (2) mwa**,
soti **lendi 16 novanm 2026** rive **vandredi 15 janvye 2027**. Dokiman « Egzekisyon pwojè a », ki
vini ak kontra sa a, bay detay sou kijan m ap mete l an plas.

# Sa APA ap tann de mwen

Yon pati nan done pwogram PL-DL la ranmase sou CommCare. APA swete mwen mete an plas yon sistèm ki
rale tout fòmilè sa yo otomatikman, ki trete done yo, ki mete yo nan Google Drive responsab MEAL
la, nan BigQuery ak nan yon tablo bakòp, epi ki alimante yon dachbòd Looker Studio. Mwen dwe
dokimante sistèm nan epi fòme responsab MEAL la, pou ekip la ka sèvi avè l san mwen.

# Solisyon mwen prevwa

Mwen ap **priyorize API CommCare a** pou rale done yo : sistèm nan pran sèlman sa ki chanje, san
navigatè otomatik. Script yo ap mache sou AWS Lambda, nan enfrastrikti APA genyen deja. Done trete
yo ap ale nan yon Google Sheet pou responsab MEAL la, nan BigQuery pou dachbòd la, ak nan yon tablo
bakòp nan baz MySQL APA a. Tout travay la ap fèt nan yon **anviwònman tès** ki gen menm estrikti ak
sistèm final la ; responsab MEAL la ap valide l, epi n ap retire l aprè deplwaman final la. Si yon
chanjman apwòch vin nesesè, m ap dokimante l epi pataje l ak manm ekip APA yo.

# Fason m ap travay

Mwen ap travay ak **metòd ajil**. Chak semèn, m ap fè **de rankont « check-in »** 15 a 30 minit
ak responsab MEAL la, pou m prezante avansman, eksplike difikilte mwen jwenn, epi pou nou chwazi pi
bon apwòch la ansanm. Rankont sa yo sèvi tou pou fòme responsab MEAL la sou tout detay sistèm nan.
M ap dokimante chak check-in epi pataje l ak responsab MEAL la ak rès ekip la.

**Premye semèn nan** ap dedye a travay ak responsab MEAL la. Li prezante m bay ekip la, li ban m aksè
ak sistèm nan ak dachbòd ki la deja, li pataje kòd sous aplikasyon PHP APA a, li prezante m fòmilè
ONA ak CommCare yo, epi li di m ki pwoblèm li menm li genyen ; m ap gade nan ki nivo mwen ka ede l
pandan kontra a. M ap mete kòd PHP a an sekirite nan yon **òganizasyon GitHub APA**, gratis, kote
kòd la ap rete prive.

Aprè sa, n ap fè yon **rankont kadraj** ak responsab MEAL la ak responsab ekip PL-DL la, oswa yon
manm ekip la, pou yo eksplike nou suivi ki fèt ak fòmilè CommCare yo ak sa yo vle jwenn nan dachbòd
la. M ap dokimante rankont sa a epi voye l bay responsab MEAL la, menm jan ak sipò m pote sou lòt
pati sistèm monitoring APA a.

# Etap travay yo

Lè anviwònman tès la mache epi responsab MEAL la valide l, travay la fèt nan lòd sa a :

1. Rale tout fòmilè yo, san okenn pwoblèm.
2. Trete done yo.
3. Evalye si rekiperasyon ak tretman done yo fèt nan yon tan akseptab.
4. Mete done yo nan Google Drive responsab MEAL la (`googlesheet_test`, `googlesheet_final`), pou li ban nou fidbak epi fè suivi ak ekip PL-DL la.
5. Mete done yo nan BigQuery (`base_test`, `base_final`).
6. Mete done yo nan tablo bakòp la (tès, final).
7. Mete kòd sous la ak dokiman yo sou GitHub òganizasyon APA a.
8. Konstwi dachbòd la sou `base_test`, pataje lyen an, epi resevwa fidbak ekip la atravè responsab MEAL la.
9. Fè deplwaman definitif la, remèt dokiman yo, epi fè yon seyans ak responsab MEAL la pou li ka fòme rès ekip la.
10. Retire anviwònman tès la, lè nou sèten tout bagay pase byen nan deplwaman final la.
11. Lè tout pwen sa yo soumèt epi valide, APA peye dezyèm peman an, pou livrab yo.

# Livrab ak pèman

Mwen ap remèt nan fen kontra a :

- **Dokiman sistèm nan** ;
- **De prezantasyon PowerPoint**, youn sou kijan sistèm nan mache ak youn sou kijan pou sèvi ak dachbòd la ;
- Kòd sous la ak dokiman yo sou GitHub òganizasyon APA a ;
- Sistèm nan an pwodiksyon, ak dachbòd final la.

APA ap peye m **4 000 USD an de (2) pèman** : **2 000 USD nan fen premye mwa a** (15 desanm 2026),
ak **2 000 USD pou livrab yo**, lè tout livrab yo fin soumèt epi responsab MEAL la valide yo.

Menm si m ap fè suivi administratif la epi soumèt dokiman patant la, se dat sa yo mwen espere pou de
pèman yo. Pèman yo ap fèt pa **vireman bankè** sou kont an dola ameriken mwen nan **BUH** (Banque de
l'Union Haïtienne), nimewo **KONT_BUH**, nan **non Alexandro Disla**.

# Reta

Mwen atann mwen ak kèk reta, sitou nan faz aksè ak sistèm nan. Si travay la ta depase de mwa yo akoz
yon reta ki depann de mwen, menm yon jou, APA p ap gen pou peye okenn kòb anplis. Toutfwa yon reta ki
pa depann de mwen p ap retade pwosesis pèman an ni validasyon livrab yo.

# Siyati

Nou siyen kontra sa a elektwonikman.

| | Pou Anseye Pou Ayiti | Konsiltan an |
|:----------|:-------------------------------|:-------------------------------|
| **Non** | `[Non reprezantan APA]` | Alexandro Disla |
| **Fonksyon** | `[Fonksyon]` | Konsiltan done ak MEAL |
| **Dat** | `[Dat APA]` | `[Dat konsiltan]` |
| **Siyati** | `[Siyati APA]` | `[Siyati konsiltan]` |
