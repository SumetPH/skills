---
name: ui-builder-nuxt2-vuetify2
description: Expertly converts design images, wireframes, or screenshots into functional Nuxt 2 and Vuetify 2 code. Use this skill whenever a user provides a visual design and wants it implemented using the Nuxt 2 framework and Vuetify 2 component library. It specializes in pixel-perfect layouts, responsive grids, and standardizing components to Vuetify's best practices.
---

# UI Builder (Nuxt 2 + Vuetify 2)

A specialized skill for transforming design images into clean, maintainable Nuxt 2 code using Vuetify 2.

## Workflow

1.  **Visual Analysis:**
    *   Deconstruct the design into Vuetify components (`v-app-bar`, `v-navigation-drawer`, `v-card`, `v-btn`, etc.).
    *   Identify the layout structure (Grids: `v-container`, `v-row`, `v-col`).
    *   Detect color schemes, typography, and spacing.

2.  **Implementation Strategy:**
    *   **Prioritize Vuetify Components:** Map every visual element to the most appropriate Vuetify 2 component.
    *   **Vuetify Utilities:** Use Vuetify's utility classes for spacing (`ma-`, `pa-`), alignment, and color instead of custom CSS whenever possible.
    *   **Responsive Design:** Use Vuetify breakpoint props (e.g., `cols="12" sm="6" md="4"`) to ensure the design is mobile-friendly.
    *   **Icons:** Use Material Design Icons (`mdi-`) by default.

3.  **Code Structure:**
    *   **Nuxt 2 Standard:** Follow the standard `<template>`, `<script>`, `<style>` structure.
    *   **Options API:** Use the Options API (`data`, `methods`, `computed`, `props`) as per the user's preference for Nuxt 2.
    *   **Clean & Semantic:** Use meaningful component and variable names.

## Guidelines

*   **Vuetify 2 Specific:** Ensure all props and components used are compatible with Vuetify 2.x (not Vuetify 3).
*   **Placeholders:** Use placeholder images (e.g., `https://picsum.photos/`) and lorem ipsum text for content that isn't explicitly defined.
*   **Interactivity:** Add basic `v-model` bindings and `@click` event handlers for interactive elements like inputs and buttons.

## Examples

### Input: A card with an image and a title
**Output Snippet:**
```vue
<template>
  <v-card max-width="400" class="mx-auto my-12">
    <v-img
      height="250"
      src="https://picsum.photos/id/11/500/300"
    ></v-img>
    <v-card-title>Beautiful Destination</v-card-title>
    <v-card-text>
      <div class="my-4 text-subtitle-1">
        $ • Italian, Cafe
      </div>
      <div>Small plates, salads & sandwiches in an intimate setting.</div>
    </v-card-text>
    <v-card-actions>
      <v-btn color="deep-purple lighten-2" text @click="reserve">
        Reserve
      </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  methods: {
    reserve() {
      console.log('Reservation clicked');
    }
  }
}
</script>
```

### Input: A complex dashboard header
**Output Snippet:**
```vue
<template>
  <v-app-bar app color="primary" dark elevation="0">
    <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>
    <v-toolbar-title>Dashboard</v-toolbar-title>
    <v-spacer></v-spacer>
    <v-text-field
      flat
      solo-inverted
      hide-details
      prepend-inner-icon="mdi-magnify"
      label="Search"
      class="hidden-sm-and-down"
    ></v-text-field>
    <v-btn icon>
      <v-icon>mdi-bell</v-icon>
    </v-btn>
    <v-avatar size="32" class="ml-4">
      <v-img src="https://cdn.vuetifyjs.com/images/john.jpg"></v-img>
    </v-avatar>
  </v-app-bar>
</template>

<script>
export default {
  data: () => ({
    drawer: false
  })
}
</script>
```
