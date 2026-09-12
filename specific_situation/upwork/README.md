# `upwork/` — applications submitted through the platform

These are **not** built like the dossiers beside them in `specific_situation/`. The Haitian and
international NGO applications are *emailed dossiers*: a tailored CV plus one cover letter per post,
built from a `.tex` and its `.md` twin, merged with scanned credentials into a single PDF, with an
`emails.md` carrying the paste-ready message and an `email_prep.md` naming the deadline and the
address to send it to.

An Upwork application is a different object. There is no email, no recipient, no attachment of
diplomas, and no deadline — there is a text box, a set of screening questions the client wrote, and
a profile the client already has in front of them. Building a four-part merged PDF for it would be
answering a question nobody asked.

## The shape

| File | Role |
|---|---|
| `proposal.md` | The paste-ready proposal text, raw. One block per variant (full, short, follow-up) |
| `screening_answers.md` | **One paste block per screening question, in the client's order.** Upwork renders these as separate fields, so they are separate blocks — not prose inside the proposal |
| `application_prep.md` | The brief: what may and may not be claimed, the honest gaps, decisions still owed by the user |
| `inputs/` | The advert as published, verbatim, including the screening questions |

`credentials/`, `email_prep.md`, `emails.md`, `build_*.sh` and the merged-dossier PDF have no place
here by default.

## The two rules that differ from every other dossier

**1. No contact details, anywhere.** Upwork refuses a submission carrying a phone number, an email
address, or a link to any outside site — the attachments included. The standard `moderncv` header
(`\phone` + `\email` + `\extrainfo{GitHub: …}`) fails on all three counts at once. Where an Upwork
dossier does attach a CV, its header reads `Contact through Upwork` instead, and its build script
hard-fails if contact details reappear. Never repair an Upwork header by copying the block back from
an emailed dossier. The restriction covers the pre-contract period only.

**2. The screening questions are the application.** A client who writes five numbered questions, or
who demands a proposal that opens with a specific word, is filtering on compliance before reading a
syllable of content. Answer them in their order, in their words, and put the required opening token
first. Answering well but out of order is a rejected application.

## Attachments

Optional, and the exception rather than the rule. `revenue_cycle_analyst/` carries a CV and cover
letter (with the LaTeX/Markdown twins and build script of the house pattern) because that advert
asked for a degree, a professional qualification history and a modelling background — the things a
CV exists to present. `generalist_web_dev/` carries none, because that client asked for live site
links and screening answers, and a PDF adds nothing to either.

Decide per advert. The default is no attachment.

## Current dossiers

| Directory | Post | Status |
|---|---|---|
| `revenue_cycle_analyst/` | Financial & Revenue Cycle Analyst — U.S. psychiatric practice | Built 2026-09-11. Degree requirement stated as absolute and unmet; gap disclosed in writing |
| `generalist_web_dev/` | Generalist web developer — international web agency | Built 2026-09-12. **Zero of the five required platforms.** See its `application_prep.md` before sending |
