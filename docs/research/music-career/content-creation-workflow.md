# Solo Musician Content Creation Workflow Research

## Purpose

Research notes for Prism Music/Career on realistic iPhone-only solo content production, back-catalogue reuse, and live-looping/improvisation documentation.

## Core findings

Solo musicians can create useful content without a crew or high-production setup.

- iPhone-first workflows are realistic: one phone for a wide shot, one for close-up/detail, edited later in lightweight mobile tools.
- Two-phone setups are especially useful for loop-building, instrument switching, pedals, sax/flute/violin/guitar detail, and improvised electronic controls.
- Raw, process-based clips can be more sustainable and more authentic than highly polished promo videos.
- Back-catalogue reuse is a legitimate content strategy, not a failure to create new work.
- Older songs can become lyric videos, visualizers, stripped-down versions, session takes, alternate arrangements, remix/stem/process content, archive reveals, or anniversary/context posts.
- Re-releases need a reason: why now, what changed, why this track matters, why a new audience should care.

## Practical implications for Dave

Dave has a large cross-genre catalogue and limited current photo/video material. A Music/Career cockpit should treat the catalogue as source material for ongoing content, not as dead archive.

Useful workflows:

- `record everything lightly`: capture rehearsals, loop builds, improvs, instrument details, arrangement rebuilds;
- `pick later`: review/select clips after the creative session rather than judging mid-performance;
- `repurpose one work into many outputs`: short clip, long clip, caption, email note, EPK media entry, supporter post, behind-the-scenes story;
- `batch capture`: one focused session generates several weeks of lightweight material.

## Product implications

The app should support content atoms rather than only finished posts.

Possible data shape later:

```text
ContentSource
├── track/work/project
├── format: audio/video/photo/text/archive
├── project mode: live-looping/acoustic/electronic/commissioned
├── angle: process/story/release/behind-the-scenes/rework/anniversary
├── publish status: idea/draft/reviewed/posted/manual
└── outputs: EPK/social/email/supporter/press
```

This is not yet a schema decision; it is a product-design prompt for Claude/Codex review.

## Design cautions

- Do not make daily posting the default workflow.
- Do not require high-production assets before the system is useful.
- Do not make content creation mean only new music.
- Do not let the app become a guilt machine for unposted backlog.
- Do not auto-post. Queue/draft/review only.

## Beam synthesis

This research supports a broader internal Music/Career system with back-catalogue and content-batch visibility. A static EPK page cannot satisfy this workflow alone.
