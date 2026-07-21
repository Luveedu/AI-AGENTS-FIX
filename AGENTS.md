# Project Guidelines & AI Agent Directives

## 1. Introduction
Welcome to the development repository. This document serves as the central source of truth for our development guidelines, UI/UX design standards, and the strict operational protocols for all autonomous AI coding agents interacting with this codebase. 

Our primary objective is to deliver top-tier, production-ready web services. Maintaining absolute consistency across all pages, functions, architectures, and UI elements is a non-negotiable requirement.

## 2. Design Philosophy: The "Taste"
The design language of this project is defined by **cleanliness, professionalism, and an intuitive user experience**. Every interface must feel like a seamless, natural extension of the brand.

* **Cohesive Identity:** Whether a user is browsing a landing page, utilizing a web application feature, or interacting with a form, the visual and functional language must remain perfectly synchronized.
* **Purposeful Minimalism:** Avoid visual and structural clutter. Every pixel, component, and line of code must serve a distinct, justifiable purpose.
* **Responsive & Fluid:** All designs must adapt flawlessly to any viewport or device without breaking layouts or compromising the visual hierarchy.

## 3. Core Instructions for Consistency
Whenever creating a new page, adding a feature, or editing an existing component, you must adhere strictly to these architectural rules:

* **Inherit Layouts:** Always utilize the global wrappers, structural grids, headers, and footers already established in the repository.
* **Component Reusability:** Before building a new UI element, thoroughly search the existing component library. Reuse and extend existing components rather than duplicating logic.
* **Design System Adherence:** Do not introduce new fonts, hex codes, or unexpected margins. Hover states, active states, and focus outlines must map perfectly to the existing CSS variables and design tokens.
* **Standardized Feedback:** Handle data processing using the repository's standard loading spinners, success toasts, and error state components. 
* **Regression Defense:** Ensure that local modifications to shared components do not break the design standard on other pages across the application.

---

## 4. AI Coding Agent: Strict Operational Directives
*The following clauses are absolute mandates for any AI coding assistant or autonomous agent operating within this repository. Your objective is to deliver 100% accurate, production-ready code while strictly managing resources and maintaining architectural integrity.*

### Clause 1: The Zero-Assumption Mandate (Anti-Guessing Protocol)
* **Never Guess:** Under no circumstances will the AI assume, guess, or infer the state, structure, styling, or logic of a file, component, or system it has not explicitly read. 
* **Verify Before Implementation:** The AI will never operate on the assumption that "this file was probably structured like that." If there is a single point of confusion, ambiguity, or missing context, the AI must efficiently and thoroughly search the repository to find the exact source of truth before writing a single line of code.
* **Halt on Ambiguity:** If a search fails to resolve the confusion, the AI must halt execution and explicitly request clarification from the user. It will never output "creepy," hallucinated, or broken code just to provide an answer.

### Clause 2: Contextual Discovery & Architectural Alignment
* **Read Before Writing:** Always search and parse existing stylesheets, utility files, and UI component libraries before generating new frontend code. **Never invent new CSS utility classes** if a class for that exact styling already exists.
* **System Mapping:** Understand how the current web services are structured before adding new routes or functions. Ensure your additions fit seamlessly into the existing MVC, component tree, or routing logic without causing regressions.

### Clause 3: Strict Focus & Zero Feature Creep
* **Exact Execution:** Implement *exactly* what is requested and nothing more. If instructed to fix a button's alignment, do not refactor the surrounding form validation logic unless strictly required to resolve the alignment issue.
* **Mechanical Precision:** Apply the UI/UX design standards mechanically and flawlessly. Do not exercise creative liberty with color palettes, layouts, or spacing. Stick strictly to established variables.
* **Self-Correction:** Before outputting the final response, silently verify the generated code against these guidelines to guarantee design consistency, security, and performance optimization.

### Clause 4: API Cost Management & Output Optimization
* **No Conversational Filler:** Output only the requested code, necessary structural changes, or concise technical explanations. Eliminate all pleasantries and redundant conversational text.
* **Targeted File Updates:** When modifying an existing file, do not reprint the entire file unless explicitly instructed. Use precise code blocks (diffs) indicating exactly where to insert, replace, or delete specific lines.
* **Avoid Trial-and-Error Loops:** Do not blindly guess solutions to errors. Analyze the stack trace and existing architecture first. If a solution is not definitively clear after analyzing the environment, pause and ask the user for clarification to prevent burning API tokens on incorrect implementations.