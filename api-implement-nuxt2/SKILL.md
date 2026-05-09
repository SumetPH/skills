---
name: api-implement-nuxt2
description: Implement API calls in Nuxt 2 using @nuxtjs/axios. Use this skill when the user asks to fetch data, create a resource, or integrate a backend endpoint. It intelligently detects existing project patterns (like centralized repository plugins) or implements calls directly within asyncData, fetch, or methods, following established authentication and error-handling conventions in the codebase.
---

# API Implementation (Nuxt 2)

A specialized skill for implementing backend API integrations in Nuxt 2 applications using the `@nuxtjs/axios` module.

## Workflow

1.  **Project Context Analysis:**
    *   Check `nuxt.config.js` for axios configuration and proxy settings.
    *   Search for custom axios plugins (e.g., `plugins/axios.js`) that might handle global interceptors, authentication headers, or error handling.
    *   Detect if a "Repository Pattern" is in use (e.g., `$api.users.get()`) by checking `plugins/` or `api/` directories.

2.  **Implementation Strategy:**
    *   **Existing Pattern:** If a centralized repository or custom plugin is detected, extend it or use it to implement the new API call.
    *   **Standard Nuxt 2 Hook:** Use `asyncData` or the Nuxt 2 `fetch()` hook for server-side data fetching to ensure SEO and performance.
    *   **Methods:** For client-side actions (e.g., form submission), implement calls within Vue methods using `this.$axios`.
    *   **Error Handling:** Implement try-catch blocks or use axios interceptors to handle 4xx/5xx responses, showing appropriate feedback to the user.

3.  **Code Structure:**
    *   **Data Binding:** Map API responses to reactive data properties.
    *   **Loading States:** Manage a `loading` state to provide visual feedback during requests.
    *   **Authentication:** Ensure requests include necessary tokens (e.g., from `this.$auth` or local storage) if the endpoint is protected.

## Guidelines

-   **SEO Friendly:** Favor `asyncData` for primary page content.
-   **Security:** Never hardcode API keys or sensitive URLs; use `process.env` or `publicRuntimeConfig`.
-   **Context Awareness:** Always check if the project uses a specific wrapper for axios before writing raw `$axios` calls.

## Examples

### Case 1: Simple GET in `asyncData`
**Output Snippet:**
```javascript
export default {
  async asyncData({ $axios, error }) {
    try {
      const { data } = await $axios.get('/api/posts')
      return { posts: data }
    } catch (e) {
      error({ statusCode: e.response?.status || 500, message: 'Failed to fetch posts' })
    }
  }
}
```

### Case 2: POST request in `methods` with loading state
**Output Snippet:**
```javascript
export default {
  data() {
    return {
      form: { email: '', password: '' },
      loading: false
    }
  },
  methods: {
    async handleLogin() {
      this.loading = true
      try {
        const response = await this.$axios.$post('/api/auth/login', this.form)
        this.$toast.success('Login successful')
        // handle redirection or state update
      } catch (e) {
        this.$toast.error(e.response?.data?.message || 'Login failed')
      } finally {
        this.loading = false
      }
    }
  }
}
```

### Case 3: Extending a Repository (If detected)
If the project uses `this.$api.users.list()`, the skill should follow that:
```javascript
// In a repository plugin or directly adding to existing one
export default (context, inject) => {
  const usersRepository = {
    list: () => context.$axios.$get('/users'),
    get: (id) => context.$axios.$get(`/users/${id}`),
    // Adding new method
    create: (data) => context.$axios.$post('/users', data)
  }
  inject('usersApi', usersRepository)
}
```
