---
name: ui-builder-nuxt2-bootstrapvue
description: Expertly converts design images, wireframes, or screenshots into functional Nuxt 2 and BootstrapVue code. Use this skill whenever a user provides a visual design and wants it implemented using the Nuxt 2 framework and BootstrapVue component library. It specializes in clean layout structures using Bootstrap's grid system and standardizing components to BootstrapVue's best practices.
---

# UI Builder (Nuxt 2 + BootstrapVue)

A specialized skill for transforming design images into clean, maintainable Nuxt 2 code using BootstrapVue.

## Workflow

1.  **Visual Analysis:**
    *   Deconstruct the design into BootstrapVue components (`b-navbar`, `b-card`, `b-button`, `b-form-input`, `b-table`, etc.).
    *   Identify the layout structure (Grids: `b-container`, `b-row`, `b-col`).
    *   Detect color schemes (primary, secondary, success, danger, etc.), typography, and spacing.

2.  **Implementation Strategy:**
    *   **Prioritize BootstrapVue Components:** Map visual elements to the most appropriate BootstrapVue component.
    *   **Bootstrap Utilities:** Use Bootstrap 4 utility classes for spacing (`mt-`, `p-`), alignment, and color instead of custom CSS whenever possible.
    *   **Responsive Design:** Use Bootstrap grid props (e.g., `cols="12" sm="6" md="4"`) to ensure the design is mobile-friendly.
    *   **Icons:** Use BootstrapVue Icons (`b-icon-xxx`) by default.

3.  **Code Structure:**
    *   **Nuxt 2 Standard:** Follow the standard `<template>`, `<script>`, `<style>` structure.
    *   **Options API:** Use the Options API (`data`, `methods`, `computed`, `props`) as per the standard for Nuxt 2/Vue 2.
    *   **Clean & Semantic:** Use meaningful component and variable names.

## Guidelines

*   **BootstrapVue Compatibility:** Ensure all props and components used are compatible with BootstrapVue (Vue 2 version).
*   **Placeholders:** Use placeholder images (e.g., `https://picsum.photos/`) and lorem ipsum text for content that isn't explicitly defined.
*   **Interactivity:** Add basic `v-model` bindings and `@click` event handlers for interactive elements like inputs and buttons.

## Examples

### Input: A card with an image and a "Read More" button
**Output Snippet:**
```vue
<template>
  <b-card
    title="Adventure Awaits"
    img-src="https://picsum.photos/600/300/?image=25"
    img-alt="Image"
    img-top
    tag="article"
    style="max-width: 20rem;"
    class="mb-2"
  >
    <b-card-text>
      Discover the world's most beautiful hidden gems and plan your next journey.
    </b-card-text>

    <b-button href="#" variant="primary" @click.prevent="handleReadMore">
      Read More
    </b-button>
  </b-card>
</template>

<script>
export default {
  methods: {
    handleReadMore() {
      console.log('Read more clicked');
    }
  }
}
</script>
```

### Input: A simple login form
**Output Snippet:**
```vue
<template>
  <b-container class="vh-100 d-flex justify-content-center align-items-center">
    <b-card class="p-4 shadow-sm" style="width: 100%; max-width: 400px;">
      <h3 class="text-center mb-4">Login</h3>
      <b-form @submit.prevent="onSubmit">
        <b-form-group label="Email address:" label-for="input-1">
          <b-form-input
            id="input-1"
            v-model="form.email"
            type="email"
            placeholder="Enter email"
            required
          ></b-form-input>
        </b-form-group>

        <b-form-group label="Password:" label-for="input-2">
          <b-form-input
            id="input-2"
            v-model="form.password"
            type="password"
            placeholder="Enter password"
            required
          ></b-form-input>
        </b-form-group>

        <b-button type="submit" variant="primary" block class="mt-4">
          Sign In
        </b-button>
      </b-form>
    </b-card>
  </b-container>
</template>

<script>
export default {
  data() {
    return {
      form: {
        email: '',
        password: ''
      }
    }
  },
  methods: {
    onSubmit() {
      alert('Login submitted!');
    }
  }
}
</script>
```
