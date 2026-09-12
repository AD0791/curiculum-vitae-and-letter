# Screening answers — one paste block per question

Upwork renders each screening question as its own field. Each block below is raw, paste-ready text
for one field, in the client's order. No contact details, no formatting characters.

Use these **with Block A** of [`proposal.md`](proposal.md). If you use Block B (the all-in-one),
these are already inside it — do not paste twice.

Answers 1 and 2 are where this application is weakest, and they are answered straight. Do not
soften them into implied experience: this client will ask for a WordPress admin login in the first
week, and a claim made here becomes a problem then.

---

## Q1 — Which of the five platforms have you worked with, and roughly how many projects on each?

---

None of the five, and I would rather say that plainly than stretch a definition.

Shopify: none. WordPress: none in production. Wix: none. Squarespace: none. GoHighLevel: none.

What I actually have is the layer underneath them. PHP in production — a Laravel 8 backend running
on Cloud Run, and a native-PHP application that moved field-collected data into MySQL. JavaScript
and TypeScript, React and React Native front ends, HTML and CSS. Python, FastAPI and SQL on the back
end, and a static site I build and deploy myself.

That matters unevenly across your five. WordPress theme and plugin work is PHP with a specific set
of hooks and conventions on top, and that is a matter of learning the conventions rather than the
language — same for what sits under Elementor or Divi. GoHighLevel is a product to learn, not a
language. Shopify is the real distance: Liquid is a templating language I have not written, though
it is a small one.

I am not claiming this makes me equivalent to a candidate with thirty stores behind them. It does
not. It means the ramp is conventions rather than fundamentals, and your paid test project will show
you the difference better than I can assert it.

---

## Q2 — Share links to 3 to 5 live sites you built or significantly worked on

---

This is the second place I fall short of what you asked, so here it is straight rather than padded.

The client work I have done is under agreement and not mine to publish, and what I can point to is
not on your stack: my own site is a Quarto static build, and my public code sits in open
repositories rather than in the form of live marketing sites. Linking three URLs that demonstrate
nothing about WordPress or Shopify would waste the one thing you are actually trying to measure
here.

What I can describe instead, if useful: a Laravel 8 backend in production on Cloud Run; a native-PHP
application taking field data into MySQL with the validation and reconciliation that implies; a
React Native app I modernised across a major version jump, including the render layer and the
asynchronous state handling; and dashboards built for external stakeholders to read without me in
the room.

If a portfolio of live platform sites is a hard requirement, I am the wrong candidate and I would
rather you filter me out here than at the end. If the test project is the real measure, I am ready
for it this week and it will answer this question properly.

---

## Q3 — How do you use AI in your workflow, and give one example of something it got wrong

---

Claude and Claude Code daily, as the primary tool rather than a helper I reach for occasionally. I
use them for writing code, debugging, adapting content, and research. Secondary tools exist but I
would not build a workflow on them.

On prompting: I give the model the constraints that actually determine the answer — the library
version, the existing patterns in the file, what the surrounding code already does, what the output
has to interoperate with. Most re-prompting loops are caused by leaving those out and then reacting
to what comes back. I would rather spend thirty seconds on context than four rounds on correction.

The supervision is the part that matters, and it is not a prompting skill. It is reading the output
as code.

A recent example. I asked Claude for a listing endpoint over a related table. What came back was
clean and readable: a loop that fetched each parent row, then queried that row's children inside the
loop. It worked. It passed its tests. On real data it was issuing hundreds of queries per request
and the page was taking roughly thirty-six seconds to load. That is the N+1 pattern, and it is
exactly what a language model produces, because the naive version is the version most examples show
and it reads beautifully. A review that only asks "is this clear code?" passes it. I found it in the
query logs, replaced it with one aggregated join plus eager loading, and the page came back in under
half a second.

A second kind I hit regularly: Claude writing confident SQLAlchemy 1.x synchronous calls into a 2.0
async codebase. The code is correct — for a version of the library that is not the one installed.
You only catch that if you know the library changed.

Neither of those is fixed by prompting better. Both are caught by knowing what the code is supposed
to be doing before you read what it did.

On your multilingual work: French is my native language, so French content I verify myself. German
and Spanish I cannot, and I would not pretend otherwise — what I check there is everything that
breaks independently of meaning, which is most of what actually goes wrong. Encoding and umlauts,
text expansion breaking a layout that was designed at English length, hreflang and language
attributes, untranslated strings left in template fragments, and dates, currency and number formats.
Then I flag anything load-bearing for a native speaker rather than shipping it on the model's word.

---

## Q4 — Hours, time zone, and European business hours

---

40 hours a week, Monday to Friday, and available for the occasional urgent weekend.

I am in Port-au-Prince, Haiti, on UTC-5. European business hours are a five-to-six hour offset, so
covering 09:00 to 18:00 CET means starting my day at 03:00 local. I am saying that explicitly rather
than answering "yes, flexible", because it is a real commitment and you should be able to hold me to
it in writing. I have worked remotely for US clients for years and the discipline of someone else's
clock is not new; this is a bigger offset than I have run before, and I would rather state it
precisely than discover it with you in week two.

Reachable throughout that window. Fibre connection with backup power and a second mobile connection,
which in Port-au-Prince is not a formality.

---

## Q5 — Test project, and hourly rate for ongoing work

---

Yes, and to be direct about it: the paid test is the reason I am applying at all. I have none of
your five platforms, so anything I claim in a proposal is worth less than what I hand back in 48
hours. Two design directions, then the build on the one you pick, both as fixed-price milestones —
that works, and I can start this week.

For ongoing work my rate is $10 an hour. At 40 hours a week that runs a little above the monthly
band you posted, so if that figure is firm, say so and I will work to it rather than haggle. I would
take the reduced rate for the two-week trial period as described.

One thing I would ask in return on the test: tell me which platform the brief is on and give me
access early. If it is WordPress I will be productive immediately; if it is Shopify I will be
spending some of those 48 hours learning Liquid, and I would rather you know that is where the time
went than assume it is how fast I work.
