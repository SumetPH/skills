---
name: ui-builder-nuxt-ui
description: Convert design images, wireframes, or screenshots into functional Nuxt (Nuxt 3, Nuxt 4, or NuxtJS) code using the NuxtUI framework. Use this skill whenever a user mentions building UI with Nuxt, NuxtJS, or specific versions like Nuxt 3 or Nuxt 4 combined with NuxtUI. It specializes in leveraging @nuxt/ui components and Tailwind CSS for rapid development.
---

# UI Builder (Nuxt + NuxtUI)

A specialized skill for transforming design images into high-quality Nuxt components and pages using the NuxtUI framework. It targets the latest stable versions of Nuxt (3/4+) and NuxtUI while remaining compatible with general "NuxtJS" requests.

## Workflow

1.  **Visual Analysis:**
    *   Map visual elements to specific NuxtUI components (e.g., `UButton`, `UCard`, `UInput`, `UNavbar`).
    *   Identify layout structures using Tailwind CSS utility classes.
    *   Detect color schemes and typography consistent with NuxtUI's design system.

2.  **Implementation Strategy:**
    *   **NuxtUI First:** Always prioritize NuxtUI components (`U-prefix`).
    *   **Tailwind Utilities:** Use Tailwind classes for custom layout, spacing, and fine-tuning.
    *   **Icon Set:** Use the `i-` icon prefix supported by NuxtUI (e.g., `i-heroicons-xxx`).
    *   **Modern Patterns:** Use `<script setup>` and latest Nuxt/NuxtUI conventions.

3.  **Code Structure:**
    *   **Clean & Modular:** Break down complex designs into reusable components.
    *   **Reactive State:** Use `ref`, `reactive`, and `computed` for UI logic.
    *   **TypeScript:** Prefer TypeScript in `<script setup>` for better type safety.

## Guidelines

*   **Version Awareness:** Support transitions between NuxtUI v2 and v3 (Nuxt 4 compatibility) by following the latest stable documentation.
*   **Placeholders:** Use placeholder images and text for missing content.
*   **Accessibility:** Leverage NuxtUI's built-in accessibility features and ensure proper semantic HTML.

## Examples

### Input: A modern feature card using NuxtUI.
**Output Snippet:**
```vue
<template>
  <UCard class="max-w-sm transition-shadow hover:shadow-lg">
    <template #header>
      <div class="flex items-center gap-3">
        <UIcon name="i-heroicons-cpu-chip" class="w-6 h-6 text-primary" />
        <h3 class="text-lg font-bold">Neural Engine</h3>
      </div>
    </template>
    
    <p class="text-gray-500 dark:text-gray-400">
      Accelerate your AI workflows with our custom-built neural processing units.
    </p>

    <template #footer>
      <div class="flex justify-end">
        <UButton label="Explore" color="primary" variant="soft" trailing-icon="i-heroicons-chevron-right" />
      </div>
    </template>
  </UCard>
</template>

<script setup lang="ts">
// Clean Nuxt 3/4 script setup
</script>
```
