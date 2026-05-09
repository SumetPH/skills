---
name: ui-builder-nuxt-tailwind
description: Convert design images, wireframes, or screenshots into functional Nuxt (Nuxt 3, Nuxt 4, or NuxtJS) and Tailwind CSS code. Use this skill whenever a user mentions building UI with Nuxt, NuxtJS, or specific versions like Nuxt 3 or Nuxt 4. It focuses on modern standards like script setup, utility-first styling, and responsive design.
---

# UI Builder (Nuxt + Tailwind CSS)

A specialized skill for transforming design images into high-quality Nuxt components and pages using Tailwind CSS. It targets the latest stable versions of Nuxt (3/4+) while remaining compatible with general "NuxtJS" requests that require modern implementations.

## Workflow

1.  **Visual Analysis:**
    *   Deconstruct the design into semantic layout structures (Grids, Flexbox).
    *   Break down into reusable components (Navbar, Hero, Cards, etc.).
    *   Map colors, typography, and spacing to Tailwind's utility scale.

2.  **Implementation Strategy:**
    *   **Tailwind Utilities:** Use utility classes exclusively. Keep custom CSS in `<style>` blocks to an absolute minimum.
    *   **Modern Nuxt Patterns:** Follow the latest conventions (e.g., Nuxt 3/4 directory structures, auto-imports).
    *   **Responsive First:** Use `sm:`, `md:`, `lg:` prefixes to ensure pixel-perfect display across devices.
    *   **Interactivity:** Use Tailwind state variants (`hover:`, `focus:`) and Vue 3 reactivity.

3.  **Code Structure:**
    *   **Script Setup:** Use `<script setup>` with TypeScript (preferable) or JavaScript.
    *   **Semantic HTML:** Use tags like `<header>`, `<main>`, `<section>` for SEO and accessibility.
    *   **Placeholders:** Use dynamic placeholders (Unsplash/Picsum) for images and Lorem Ipsum for text.

## Guidelines

*   **Version Awareness:** If the user specifies Nuxt 4, prioritize the new directory patterns (e.g., `app/` folder if applicable) if the environment supports it. Otherwise, default to the robust Nuxt 3 structure.
*   **Performance:** Optimize images using Nuxt Image if available, or standard `<img>` with Tailwind sizing.
*   **Accessibility:** Ensure high contrast and ARIA attributes where necessary.

## Examples

### Input: A modern hero section.
**Output Snippet:**
```vue
<template>
  <header class="relative bg-gray-900 text-white py-24 px-8 overflow-hidden">
    <div class="relative z-10 max-w-5xl mx-auto text-center">
      <h1 class="text-5xl md:text-7xl font-black tracking-tight mb-6">
        The Future of <span class="text-emerald-400">Development</span>
      </h1>
      <p class="text-xl text-gray-400 mb-10 max-w-2xl mx-auto">
        Build faster, scale better, and deploy with confidence using our Nuxt-powered platform.
      </p>
      <div class="flex flex-col sm:flex-row justify-center gap-4">
        <button class="bg-emerald-500 hover:bg-emerald-600 px-8 py-4 rounded-full font-bold transition-all transform hover:scale-105">
          Start Building
        </button>
        <button class="bg-white/10 hover:bg-white/20 backdrop-blur-md px-8 py-4 rounded-full font-bold transition-all">
          Documentation
        </button>
      </div>
    </div>
  </header>
</template>

<script setup>
// Modern Nuxt pattern
</script>
```
