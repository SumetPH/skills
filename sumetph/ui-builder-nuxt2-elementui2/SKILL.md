---
name: ui-builder-nuxt2-elementui2
description: Expertly converts design images, wireframes, or screenshots into functional Nuxt 2 and Element UI 2 code. Use this skill whenever a user provides a visual design and wants it implemented using the Nuxt 2 framework and Element UI component library. It specializes in clean layout structures, responsive grids, and standardizing components to Element UI's best practices.
---

# UI Builder (Nuxt 2 + Element UI 2)

A specialized skill for transforming design images into clean, maintainable Nuxt 2 code using Element UI 2.

## Workflow

1.  **Visual Analysis:**
    *   Deconstruct the design into Element UI components (`el-container`, `el-header`, `el-main`, `el-card`, `el-button`, `el-input`, etc.).
    *   Identify the layout structure (Grids: `el-row`, `el-col`).
    *   Detect color schemes, typography, and spacing based on Element UI's design system.

2.  **Implementation Strategy:**
    *   **Prioritize Element UI Components:** Map every visual element to the most appropriate Element UI 2 component.
    *   **Layout System:** Use `el-row` and `el-col` with the `span`, `offset`, and responsive attributes (`xs`, `sm`, `md`, `lg`, `xl`) for the layout.
    *   **Styling:** Use Element UI's built-in utility classes and variables. For custom styling, use `<style scoped>`.
    *   **Icons:** Use Element UI's built-in icon set (`el-icon-xxx`).

3.  **Code Structure:**
    *   **Nuxt 2 Standard:** Follow the standard `<template>`, `<script>`, `<style>` structure.
    *   **Options API:** Use the Options API (`data`, `methods`, `computed`, `props`) as per the standard for Nuxt 2/Vue 2.
    *   **JavaScript:** Use standard JavaScript for logic.

## Guidelines

*   **Element UI 2 Compatibility:** Ensure all props and components used are compatible with Element UI 2.x.
*   **Placeholders:** Use placeholder images (e.g., `https://picsum.photos/`) and lorem ipsum text for content that isn't explicitly defined.
*   **Interactivity:** Add basic `v-model` bindings and `@click` event handlers for interactive elements like inputs and buttons.
*   **Responsive:** Always consider how the layout will collapse on smaller screens using the grid system.

## Examples

### Input: A login card with email and password fields.
**Output Snippet:**
```vue
<template>
  <div class="login-container">
    <el-card class="login-card">
      <div slot="header" class="clearfix">
        <span>Account Login</span>
      </div>
      <el-form :model="loginForm" label-position="top">
        <el-form-item label="Email">
          <el-input v-model="loginForm.email" placeholder="Please enter email"></el-input>
        </el-form-item>
        <el-form-item label="Password">
          <el-input v-model="loginForm.password" type="password" placeholder="Please enter password" show-password></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="handleLogin" style="width: 100%">Sign In</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script>
export default {
  data() {
    return {
      loginForm: {
        email: '',
        password: ''
      }
    };
  },
  methods: {
    handleLogin() {
      console.log('Logging in with:', this.loginForm);
    }
  }
};
</script>

<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f5f7fa;
}
.login-card {
  width: 400px;
}
</style>
```

### Input: A dashboard header with a logo and user profile dropdown.
**Output Snippet:**
```vue
<template>
  <el-header class="dashboard-header">
    <div class="logo">
      <img src="https://picsum.photos/120/40" alt="Logo">
    </div>
    <div class="header-right">
      <el-dropdown trigger="click">
        <span class="el-dropdown-link">
          Admin User<i class="el-icon-arrow-down el-icon--right"></i>
        </span>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item icon="el-icon-user">Profile</el-dropdown-item>
          <el-dropdown-item icon="el-icon-setting">Settings</el-dropdown-item>
          <el-dropdown-item icon="el-icon-switch-button" divided>Logout</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
  </el-header>
</template>

<style scoped>
.dashboard-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #fff;
  border-bottom: 1px solid #dcdfe6;
}
.header-right {
  cursor: pointer;
}
</style>
```
