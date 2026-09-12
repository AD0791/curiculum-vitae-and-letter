# Generalist web developer (Upwork) — submission brief

Built 2026-09-12. Advert verbatim in
[`inputs/upwork_generalist_web_dev.md`](inputs/upwork_generalist_web_dev.md).
Paste-ready text in [`proposal.md`](proposal.md) and
[`screening_answers.md`](screening_answers.md).

## Read this before sending

**You meet the AI-supervision requirement and the availability requirement. You do not meet the
platform requirement, and it is the one the advert is most explicit about:** _"You need real
hands-on experience with at least two or three… Only knowing one isn't enough here."_ You are at
zero of five. You also cannot supply the 3–5 live site links question 2 demands.

That is two of five screening questions answered with a straight "no". Be realistic about the odds —
they are poor, and no wording changes that. This dossier is built on the one strategy that is honest
and still has a path: **declare the gap in the first paragraph, make the case on engineering depth
and AI supervision, and push everything onto the paid test project**, which is the only part of
their process that measures what you can actually do rather than what you have already done.

If you want to stop here, that is a reasonable call. If you send it, send it as written — the
opening admission is what makes the rest credible, and softening it turns a frank application into
an evasive one.

## Submission checklist

1.  `[ ]` **The proposal starts with the literal word `GENERALIST`.** Check this last, after any
    edit. "Applications that skip this won't be reviewed" — a compliance token is checked before
    content, and losing it makes everything else moot.
2.  `[ ]` Choose **Block A** (proposal) + the five blocks from `screening_answers.md` in their own
    fields — the normal case. Use **Block B** only if the questions do not appear as separate
    fields. Never both.
3.  `[ ]` No contact details anywhere — no phone, no email, no GitHub link, no outside URL. This is
    what got the last Upwork submission refused. See [`../README.md`](../README.md).
4.  `[ ]` No attachments. This client asked for live links and screening answers; a CV adds nothing
    and there is no tailored CV in this dossier by design.

## Two things you must confirm before sending

**1. The Claude N+1 example (question 3).** The 36-second page load, the per-row queries inside the
loop, the aggregated join plus eager loading, the sub-half-second result — all of that is on your
CV as your own debugging work. **What I do not know is whether the offending code was Claude's
output or hand-written**, and the answer is written as though Claude produced it, because the
question asks for something the AI got wrong.

If Claude wrote it, send as is. If you wrote it yourself, do not send it as an AI failure — swap in
the SQLAlchemy 1.x-into-2.0-async example as the primary (it is already in the answer as the
secondary) and describe the N+1 separately as your own debugging. This client will probe the example
in an interview, and it is the single answer they said most applicants get wrong, so it has to be
literally true.

**2. The $10/hour rate (question 5)** — you set this, raising my $9. Their band is $1,000–$1,500 per
month for ~40 hours, which works out at roughly $5.80–$8.70 per hour, so **$10 sits just above their
posted maximum**, not inside it. Both files now say so plainly and offer to work to the monthly
figure if it is firm, rather than claiming to be inside a range you are outside of — a client who
posted a band can do that arithmetic.

If you change it again, it appears in `screening_answers.md` Q5 and in `proposal.md` Block B item 5.
Change both: they drifted apart last time.

Worth seeing clearly: **$1,000–1,500/month for 40 h/week is well below what your data and backend
work commands**, including on this platform. That is your call and not mine to make, but do not
anchor your other applications to it.

## What must NOT be claimed

- **No WordPress, Shopify, Wix, Squarespace or GoHighLevel experience.** Zero on all five. Not
  "some exposure", not "familiar with". Nothing in any CV in this repo supports otherwise.
- **No Liquid.** Stated as a language you would be learning, in both the proposal and Q1.
- **No live portfolio links.** Do not paste `ad0791.github.io` as a platform sample — it is a
  Quarto static build and proves nothing about their stack. Q2 says this outright, which is
  stronger than a weak link.
- **No page builders, Figma, Zapier/Make, or SEO practice.** All are "nice to have" in the advert
  and none appears anywhere in your record. They are simply not mentioned rather than deflected.
- **No German or Spanish.** French native is real and claimed; the other two are handled as
  languages you cannot verify, with a named checking procedure instead. That procedure — encoding,
  text expansion, hreflang, untranslated fragments, date and currency formats — is the answer's
  strongest passage. Do not cut it.

## What genuinely lands

Worth knowing which parts to defend if they come back to you:

- **The AI-supervision answer.** The advert says _"This is the part most applicants get wrong, so
  be specific about how you do it."_ Most applicants will answer with prompting technique. The
  answer here distinguishes prompting from supervision, then gives a failure an LLM actually
  produces and a review actually misses. This is why the application gets read at all.
- **PHP in production.** Laravel 8 on Cloud Run and the native-PHP MySQL application are real, and
  PHP is the language under WordPress. This is the only bridge between your record and their
  platform list — and it is missing from both master CVs, which is worth fixing separately.
- **The 03:00 start.** Full European coverage from UTC-5 is a concrete, verifiable commitment most
  Caribbean and US-hours candidates will not make. It is stated in writing so they can hold you to
  it — which means honouring it from day one if this lands.
- **French as a native language** against a client whose work is German, Spanish and French.

## If they come back

The likely reply is the test brief. Two things to have ready before you accept a 48-hour clock:

- Ask which platform the brief is on and get access early — Q5 already asks this. Spending the
  first six hours of a 48-hour test installing WordPress locally is avoidable.
- "Two design directions" means design, not implementation. Have a plan for producing two visually
  distinct directions quickly — this is the part of the test furthest from your daily work, and it
  is stage one, so failing it means never reaching the build stage where you are strongest.
