# Project Guideline: Guidelines & Design Standards

## Introduction
Welcome to the development repository. This README serves as the central source of truth for our development guidelines, instructions, and the core "taste idea" (design philosophy) of the project. 

Our primary objective is to deliver top-tier web services. To achieve this, maintaining absolute consistency across all pages, functions, and UI elements is mandatory. 

## The "Taste Idea" (Design Philosophy)
The "taste" of this project is defined by **cleanliness, professionalism, and intuitive user experiences**. Every interface should feel like a natural extension of the brand.

* **Cohesive Identity:** Whether a user is browsing a landing page, interacting with a web application feature, or filling out a form, the visual language must remain identical.
* **Purposeful Minimalism:** Avoid clutter. Every element on the screen must serve a distinct purpose.
* **Responsive & Fluid:** The design must adapt flawlessly to any screen size without breaking the layout or altering the visual hierarchy.

## Core Instructions for Consistency
Whenever you are creating a new page, adding a new function, introducing a new element, or editing an existing component, you **must** adhere to the following rules to keep the same design standard:

### 1. Adding New Pages
* **Inherit Layouts:** Always use the existing global wrappers, headers, and footers.
* **Grid System:** Utilize the standard grid and spacing utilities defined in the global stylesheet.
* **Thematic Consistency:** Ensure the new page visually aligns with the established "taste." 

### 2. Adding New Functions & Elements
* **Component Reusability:** Before building a new UI element, check the existing component library. Reuse existing components whenever possible.
* **Interaction Design:** Hover states, active states, and focus outlines must match the existing CSS variables.
* **Feedback Mechanisms:** Process data using standard loading spinners, success messages, and error states already present.

### 3. Editing Existing Pages
* **Do Not Break the Mold:** Do not introduce new fonts, colors, or unexpected margins.
* **Regression Checking:** Ensure changes to a shared component do not break the design standard on other pages.

---

## AI Coding Agent: Operational Directives
*The following instructions are explicitly for AI coding assistants and autonomous agents interacting with this repository. Your goal is to deliver perfect, production-ready code while strictly managing API costs and maintaining hyper-focus.*

### 1. API Cost Management & Token Efficiency
* **No Unnecessary Output:** Do not generate conversational filler. Output only the requested code, structural changes, or necessary brief explanations.
* **Targeted Updates:** When modifying an existing file, do not reprint the entire file unless explicitly asked. Use precise code blocks indicating exactly where to insert, replace, or delete lines.
* **Avoid Trial-and-Error Loops:** Do not blindly guess solutions. If an error occurs, analyze the stack trace and existing architecture first. If a solution is not clear after two attempts, pause and ask the user for clarification to prevent burning through API tokens.

### 2. Contextual Awareness & Discovery
* **Read Before Writing:** Always search and read existing stylesheets, utility files, and UI component libraries before generating new frontend code. **Never invent new CSS classes** if a utility class for that exact styling already exists in the project.
* **Understand the Architecture:** Map out how the current web services are structured before adding new routes or functions. Ensure your additions fit seamlessly into the existing MVC, component tree, or routing logic.

### 3. Strict Focus & Execution
* **Zero Feature Creep:** Implement *exactly* what is requested and nothing more. If asked to fix a button's alignment, do not refactor the entire form's validation logic unless it is required to fix the alignment.
* **Maintain the "Taste":** Apply the UI/UX design standards outlined above mechanically and perfectly. Do not get creative with color palettes or spacing; stick strictly to the established variables.
* **Self-Correction:** Before outputting the final response, silently double-check your code against the instructions in this README. Ensure consistency, security, and performance are optimized.

---