# Upwork proposal — generalist web developer

Raw, paste-ready text between the rules. No contact details anywhere: Upwork rejects a submission
carrying a phone number, an email address or an outside link.

**The proposal must start with the literal word `GENERALIST`.** The advert says applications that
skip it won't be reviewed, and a client who sets a compliance token is checking it before reading a
word of content. It is the first thing to verify before you hit send.

Two variants below, because the advert is ambiguous about where the screening answers go. It says
"start your proposal with the word GENERALIST, then answer the screening questions" — but Upwork
also renders those five questions as their own fields.

*   **Block A** is the proposal to use when the five questions appear as separate fields (the normal
    case). It pitches and points at the answers. Paste the five answers from
    [`screening_answers.md`](screening_answers.md) into their own boxes.
*   **Block B** is the all-in-one, for if the questions do not appear as separate fields. It opens
    with GENERALIST and answers all five inline.

Use one or the other, never both.

---

## Block A — proposal, with screening answers in their own fields

---

GENERALIST

Before anything else, the thing you would find out at question one: I have not built production
sites on WordPress, Shopify, Wix, Squarespace or GoHighLevel. You say knowing only one isn't enough,
and I am at zero. If that closes it, I would rather not waste your time than have you discover it
three paragraphs in.

Here is why I am writing anyway.

The part you say most applicants get wrong is the part I would be strongest at. I am a working
software engineer, not a platform operator: PHP in production (a Laravel 8 backend running on Cloud
Run, and a native-PHP application moving field data into MySQL), JavaScript and TypeScript, React
and React Native, HTML and CSS, Python and SQL. Claude and Claude Code are my daily tools and have
been for a while, and I use them the way you describe rather than the way most people do. I read
what comes back before I run it. I know what the generated code is supposed to be doing, which is
the only reason I can tell when it is confidently doing something else.

A recent one: I asked Claude for a listing endpoint over a related table, and got back a clean,
readable loop that fetched each parent row and then queried its children inside the loop. It worked.
It passed its tests. On real data it was issuing hundreds of queries per request and the page took
roughly thirty-six seconds to load. That is the N+1 pattern, it is invisible in a code review that
is only checking whether the code reads well, and it is exactly the class of thing an LLM produces
because the naive version is the version most textbooks show. I found it in the query logs, replaced
it with a single aggregated join plus eager loading, and the page came back in under half a second.
I have also had Claude write confident SQLAlchemy 1.x-style synchronous calls into a 2.0 async
codebase, where the code is correct for a version of the library that is not the one installed.

Neither of those is caught by prompting better. They are caught by reading the output as code.

Liquid I do not know and would be learning. WordPress theme and plugin work is PHP, which I do know,
and the same is true of most of what sits under Elementor or Divi. GoHighLevel is a product to
learn, not a language. I am not going to tell you that makes me equivalent to someone with forty
Shopify stores behind them, because it does not.

On availability: I am in Port-au-Prince on UTC-5 and I will start my day at 03:00 local to cover
09:00 to 18:00 CET. That is a deliberate choice and I am saying it in writing so you can hold me to
it. 40 hours a week, Monday to Friday, reachable through the European day. English is fluent and I
work in it daily with US clients; French is my native language, which is worth something on the
French side of your multilingual work — German and Spanish I would treat as languages I cannot
verify myself, and I will say so rather than guess.

Your two-stage paid test is a better filter than anything I can claim in a proposal, and it is the
reason I am applying despite the platform gap. I am ready to start it this week. Judge me on what
comes back in 48 hours.

Alexandro Disla

---

## Block B — all-in-one, if the five questions are not separate fields

---

GENERALIST

Straight answer first: I have not built production sites on any of your five platforms. You say
knowing only one isn't enough, and I am at zero. If that closes it, better now than three paragraphs
in. The five answers follow.

1. Platforms and project counts. None of the five, honestly. My web work is custom: PHP in
production (a Laravel 8 backend on Cloud Run, and a native-PHP application moving field data into
MySQL), React and React Native front ends, FastAPI and SQL behind them, plus a Quarto static site I
build and deploy myself. WordPress theme and plugin work is PHP and JavaScript, which I know;
Liquid I would be learning; GoHighLevel is a product to learn rather than a language.

2. Live sites. This is the second place I fall short of what you asked. The client work I have done
is under agreement and not mine to link, and my own public site is a Quarto build rather than
anything on your stack. Rather than pad this with links that prove nothing, I would rather you judge
the test project.

3. AI in my workflow. Claude and Claude Code daily, as the primary tool, for writing code, debugging,
adapting content and research. The supervision is the actual job. Recent example: I asked Claude for
a listing endpoint over a related table and got back a clean, readable loop that fetched each parent
row and then queried its children inside the loop. It worked and it passed its tests, but on real
data it issued hundreds of queries per request and the page took about thirty-six seconds. That is
the N+1 pattern — invisible if you are only checking whether the code reads well, and exactly what
an LLM produces because the naive version is the one most examples show. I found it in the query
logs and replaced it with a single aggregated join plus eager loading; the page came back under half
a second. I have also had Claude write SQLAlchemy 1.x synchronous calls into a 2.0 async codebase:
correct for a version of the library that was not installed. Neither is fixed by prompting better.
Both are caught by reading the output as code.

4. Hours and time zone. 40 hours a week, Monday to Friday. I am on UTC-5 in Port-au-Prince and I
will start at 03:00 local to cover 09:00 to 18:00 CET. I am putting that in writing so you can hold
me to it. Fibre with backup power and a second mobile connection, so being unreachable is not a
thing that happens.

5. Test project and rate. Yes, and it is the reason I am applying despite the platform gap — it is a
better filter than anything I can claim here. I can start this week. For ongoing work my rate is $10
an hour; at 40 hours a week that runs a little above the monthly band you posted, so if that figure
is firm, say so and I will work to it rather than haggle.

Alexandro Disla

---

## Follow-up, if there is no reply after about ten days

---

Hello,

I applied about ten days ago for the generalist developer role — the one who opened by telling you
he has zero of your five platforms and asked to be judged on the test project instead.

I understand if the platform gap decided it. If it did, no reply needed. If the AI-supervision side
is still of interest, I am available and can start the test this week.

Thank you for your time.

Alexandro Disla
