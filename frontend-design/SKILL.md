---
name: frontend-design
description: 'Distinctive, intentional visual design for web UI. Use when building new pages, reshaping existing designs, establishing aesthetic direction, choosing typography, or making deliberate non-templated design decisions.'
argument-hint: 'Design brief or section to build/redesign'
---

# Frontend Design Skill

Approach this as the design lead at a small studio known for giving every client a visual identity that could not be mistaken for anyone else's. This client has already rejected proposals that felt templated, and is paying for a distinctive point of view: make deliberate, opinionated choices about palette, typography, and layout that are specific to this brief, and take one real aesthetic risk you can justify.

---

## Ground It in the Subject

If the brief does not pin down what the product or subject is, pin it yourself before designing: name one concrete subject, its audience, and the page's single job, and state your choice. If there's any information in memory about the human's preferences, context about what they're building, or designs made before — use that as a hint. The subject's own world, its materials, instruments, artifacts, and vernacular, is where distinctive choices come from. Build with the brief's real content and subject matter throughout.

---

## Design Principles

**The hero is a thesis.** Open with the most characteristic thing in the subject's world, in whatever form makes sense: a headline, an image, an animation, a live demo, an interactive moment. Be deliberate: a big number with a small label, supporting stats, and a gradient accent is the template answer — only use if that's truly the best option.

**Typography carries personality.** Pair display and body faces deliberately, not the same families you'd reach for on any other project. Set a clear type scale with intentional weights, widths, and spacing. Make the type treatment itself a memorable part of the design.

**Structure is information.** Structural devices — numbering, eyebrows, dividers, labels — should encode something true about the content, not decorate it. Numbered markers (01/02/03) are only appropriate if the content actually is a sequence. Question whether choices like these make sense before incorporating them.

**Leverage motion deliberately.** Think about where and if animation can serve the subject: a page-load sequence, a scroll-triggered reveal, hover micro-interactions, ambient atmosphere. An orchestrated moment lands harder than scattered effects. Sometimes less is more — extra animation contributes to the feeling that the design is AI-generated.

**Match complexity to the vision.** Maximalist directions need elaborate execution; minimal directions need precision in spacing, type, and detail. Elegance is executing the chosen vision well.

**Consider written content carefully.** Copy can make a design feel as templated as the design itself. See the writing section below.

---

## Process: Brainstorm, Explore, Plan, Critique, Build, Critique Again

**Calibration:** AI-generated design clusters around three looks:
1. Warm cream background (~#F4F1EA) with high-contrast serif display and terracotta accent
2. Near-black background with single bright acid-green or vermilion accent
3. Broadsheet-style layout with hairline rules, zero border-radius, dense newspaper-like columns

All three are legitimate for some briefs, but they are defaults rather than choices. Where the brief pins down a visual direction, follow it exactly. Where it leaves an axis free, don't spend that freedom on a default.

**Work in two passes:**

### Pass 1: Design Plan
Create a compact token system:
- **Color:** Describe the palette as 4–6 named hex values
- **Type:** Typefaces for 2+ roles (characterful display face used with restraint, complementary body face, utility face for captions/data if needed)
- **Layout:** One-sentence prose descriptions and ASCII wireframes to ideate and compare
- **Signature:** The single unique element this page will be remembered by

### Pass 2: Self-Critique
Review the plan against the brief before building. If any part reads like the generic default you'd produce for any similar page — revise it, say what you changed and why. Only after confirming relative uniqueness should you write code, following the revised plan exactly.

### CSS Specificity Warning
Be careful with CSS selector specificities. It's easy to generate CSS classes that cancel each other out (especially with type-based selectors like `.section` vs element-based selectors like `.cta`). This happens often with paddings/margins between sections.

---

## Restraint and Self-Critique

Spend your boldness in one place. Let the signature element be the one memorable thing. Keep everything around it quiet and disciplined. Cut any decoration that does not serve the brief. Not taking a risk can be a risk itself.

Build to a quality floor without announcing it: responsive down to mobile, visible keyboard focus, reduced motion respected. Critique your own work as you build. Before leaving the house, take one look in the mirror and remove one accessory.

---

## Writing in Design

Words appear in one reason: to make it easier to understand, and therefore easier to use. They are design material, not decoration. Bring the same intentionality to copy that you'd bring to spacing and color.

### Core Writing Rules
- **Write from the user's side.** Name things by what people control and recognize, never by how the system is built. A person manages notifications, not webhook config.
- **Active voice as default.** A control should say exactly what happens: "Save changes," not "Submit."
- **Consistent vocabulary.** The button that says "Publish" produces a toast that says "Published." Cohesion and consistency are how people learn their way around.
- **Errors are directions.** Explain what went wrong and how to fix it, in the interface's voice. Errors don't apologize and are never vague.
- **Empty screens are invitations.** An empty state is an opportunity to prompt action, not a dead end.
- **Conversational register.** Plain verbs, sentence case, no filler, tone matched to brand and audience. Let each element do exactly one job.

---

## Execution Commands

### "Build a new page for [brief]"
1. Pin down the subject, audience, and single job of the page
2. Create the design plan (color tokens, type system, layout concept, signature element)
3. Self-critique: revise anything that reads as generic default
4. Build the page following the plan exactly
5. Self-verify: responsive, accessible, keyboard-navigable

### "Redesign [section/page]"
1. Read the existing design and understand what it communicates
2. Identify what feels templated or generic
3. Propose a revised design plan with one signature element
4. Implement while preserving all existing functionality

### "Choose typography for [context]"
1. Understand the subject's world and audience
2. Propose display + body + utility face pairing
3. Define the type scale with specific sizes, weights, and line-heights
4. Ensure readability on mobile (minimum 16px for body)
