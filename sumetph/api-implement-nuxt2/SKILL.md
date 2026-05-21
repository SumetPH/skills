---
name: api-implement-nuxt2
description: Use when implementing API integrations, setting up axios calls, managing client-side data fetching (mounted/fetch/asyncData), or handling API states in Nuxt 2 (Vue 2) SPA applications.
---

# API Implementation - Nuxt 2 (SPA-focused)

## Overview
Guidelines and best practices for setting up and calling APIs in Nuxt 2 Single Page Applications (SPA) using `@nuxtjs/axios` and client-side hooks (`mounted`, component-level `fetch`, and `asyncData`).

## When to Use
- Implementing client-side API requests in Nuxt 2.
- Handling states such as loading and error handlers for SPA pages and components.
- Setting up Axios plugins and interceptors (e.g. inject tokens, global error handling).

### When NOT to Use
- Nuxt 3 projects (use `api-implement-nuxt3` instead).
- SSR-focused optimization instructions (e.g. server-side payload caching).

## Core Patterns

### 1. Standard Client Fetching: `mounted` or `methods`
Most common pattern in SPA apps for user-triggered loading or deferred loading.
```js
// components/PostList.vue
export default {
  data() {
    return {
      posts: [],
      loading: false,
      error: null
    }
  },
  mounted() {
    this.fetchPosts()
  },
  methods: {
    async fetchPosts() {
      this.loading = true
      this.error = null
      try {
        this.posts = await this.$axios.$get('/posts')
      } catch (err) {
        this.error = err.message || 'Failed to load posts'
      } finally {
        this.loading = false
      }
    }
  }
}
```

### 2. Route-bound/Pre-render Fetching: `asyncData`
Runs on route transition before navigating to the page. Blocks navigation transition until resolved.
> [!IMPORTANT]
> `asyncData` has **no access** to `this`. Access Axios via the `context` argument.

```js
// pages/posts/_id.vue
export default {
  async asyncData({ $axios, params, error }) {
    try {
      const post = await $axios.$get(`/posts/${params.id}`)
      return { post } // Merges into component local data
    } catch (err) {
      error({ statusCode: err.response?.status || 500, message: err.message })
    }
  }
}
```

### 3. Axios Interceptors (Plugins)
Defined in `plugins/axios.js` to manage authentication tokens and API headers.
```js
// plugins/axios.js
export default function ({ $axios, redirect }) {
  $axios.onRequest(config => {
    // Add auth token dynamically from localStorage/sessionStorage
    const token = localStorage.getItem('auth_token')
    if (token) {
      config.headers.Authorization = `Bearer ${token}`
    }
    return config
  })

  $axios.onError(error => {
    if (error.response?.status === 401) {
      localStorage.removeItem('auth_token')
      redirect('/login')
    }
  })
}
```

## Common Mistakes
- **Accessing `localStorage` inside SSR-safe code**: Even in `ssr: false` mode, referencing `window` or `localStorage` directly in root module scope of files (outside of `mounted`, client plugins, or functions called on the client) can lead to reference errors during build or testing.
- **Using `this` inside `asyncData`**: Returns `undefined` as it resolves before the component instance exists.
- **Forgetting Loading States**: In SPA mode, data fetch starts on navigation. Always implement explicit `loading` states to give users immediate feedback while waiting for API responses.
