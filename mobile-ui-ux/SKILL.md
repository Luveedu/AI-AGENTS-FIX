---
name: mobile-ui-ux
description: 'Elite Tailwind CSS mobile-first UI/UX optimization. Use when fixing mobile layouts, making pages responsive, refactoring desktop-only designs for mobile (320px-768px), optimizing touch targets, or scaling typography for small screens.'
argument-hint: 'Section, snippet, or URL to make mobile-responsive'
---

# Elite Mobile UI/UX Optimization Skill

**Version:** 1.0 (Tailwind CSS & Mobile-First Architecture)
**Objective:** Act as an elite Front-End Engineer and Mobile UX Specialist. Take flawless desktop layouts and reverse-engineer/refactor them for mathematically perfect, highly readable, and perfectly aligned rendering on mobile devices (320px to 768px viewports).

---

## 🛑 Core Directive: The Mobile-First Paradigm

Tailwind CSS uses a "Mobile-First" breakpoint system. Unprefixed classes (e.g., `text-center`, `p-4`, `flex-col`) apply to **MOBILE devices first**. Desktop styles must be explicitly scoped using breakpoints (`md:`, `lg:`, `xl:`).

**Critical Rule:** Do not apply massive paddings, margins, or multi-column grids to base classes. If a desktop layout breaks mobile, extract the desktop styling into an `md:` or `lg:` prefix and write clean, compact base classes for mobile.

---

## Phase 1: Layout & Structural Refactoring

Mobile screens lack horizontal space. Elements side-by-side on desktop must stack vertically on mobile.

1. **Grid & Flex Resets:**
   - Desktop: `grid-cols-3` or `grid-cols-4`.
   - **Fix:** Change to `grid grid-cols-1 md:grid-cols-3`.
   - Desktop: `flex flex-row`.
   - **Fix:** Change to `flex flex-col md:flex-row`.

2. **Order Reversal:**
   - In a 2-column layout (Text left, Image right), they stack Text-then-Image on mobile. If UX dictates Image-then-Text on mobile, use `flex-col-reverse` or `order-first`/`order-last`.

3. **Eradicating the "Horizontal Scroll Bug":**
   - No element should force horizontal scrolling.
   - Apply `overflow-x-hidden` to the `<body>` or `<main>` wrapper.
   - Ensure absolute positioned decorative elements or wide images do not bleed off-screen — use `max-w-full`.
   - Use `break-words` or `break-all` on long URLs or technical strings to prevent text from breaking the container.

---

## Phase 2: Spacing, Gaps & Alignment (The "Breathing Room" Rules)

Spacing that looks great on a 27-inch monitor will completely crush a mobile screen.

1. **Padding & Margin Scaling:**
   - Huge desktop padding (`p-12` or `p-24`) leaves zero room for text on mobile.
   - **Fix:** Scale up: `p-4 sm:p-6 md:p-12 lg:p-24`.
   - Ensure container edges don't touch screen edges — always have base horizontal padding (`px-4` or `px-5`) on section wrappers.

2. **Gap Management:**
   - Large gaps (`gap-12`) cause unnecessary scrolling on mobile.
   - **Fix:** Use `gap-6 md:gap-12`.

3. **Alignment Shifts:**
   - Left-aligned text often looks unbalanced on mobile. Consider `text-center md:text-left` for Hero sections and prominent headers.

---

## Phase 3: Typography & Readability

Fonts must scale proportionally. A 60px heading on desktop takes up the entire mobile screen.

1. **Font Scaling:**
   - H1: `text-6xl` → `text-4xl md:text-6xl`
   - H2: `text-5xl` → `text-3xl md:text-5xl`
   - Body: Keep `text-base` or `text-sm`, ensure line-height (`leading-relaxed`) is sufficient.

2. **Visual Hierarchy:**
   - Ensure primary CTAs are instantly visible above the fold on a standard mobile device.

---

## Phase 4: Touch Targets & Interactive UI

Mobile users use imprecise thumbs, not pixel-perfect mouse cursors.

1. **Button Sizing:**
   - Every clickable element (buttons, links, form inputs, hamburger menus) must have a minimum height and width of `44px` × `44px` for accessibility.
   - Use `w-full md:w-auto` so buttons span full width on mobile but revert on desktop.

2. **Form Optimization:**
   - Input font sizes must be minimum `text-base` (16px) to prevent iOS Safari auto-zoom.
   - Stack form fields vertically: `flex-col gap-4`.

3. **Navigation / Header:**
   - Hide desktop nav links inside a hamburger menu: `hidden md:flex`.
   - Ensure the mobile menu spans `w-full` and traps focus properly when opened.

---

## Phase 5: Visual Polish & Asset Management

1. **Hiding Non-Essential Elements:**
   - Complex 3D graphics, massive background videos, or heavy decorative side-images should sometimes be hidden on mobile.
   - Use `hidden md:block` for non-critical visual flair.

2. **Image Scaling:**
   - All images must use `w-full h-auto object-cover` or `max-w-full` to respect container boundaries.

---

## Execution Commands

### "Fix mobile layout for [snippet]" or "Make this mobile responsive"
1. **Audit Desktop Classes:** Identify massive paddings, absolute widths (`w-96`), huge fonts, and forced row layouts.
2. **Shift to Breakpoints:** Move heavy desktop classes behind `md:` or `lg:` prefixes.
3. **Write Mobile Base:** Inject clean, compact base classes (`p-4`, `flex-col`, `text-center`, `w-full`) at the start of the class string.
4. **Output:** Provide the fully refactored, mobile-perfect HTML snippet. Do not break the existing desktop design.

### "Audit mobile UX for [URL]"
1. Check for horizontal scroll and overflow issues.
2. Verify touch target sizing (minimum 44×44px).
3. Review font scaling and heading hierarchy on mobile viewport.
4. Inspect spacing — paddings, margins, gaps.
5. Confirm CTA visibility above the fold.
6. Generate prioritized fix list.
