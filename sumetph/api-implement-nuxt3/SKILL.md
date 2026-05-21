---
name: api-implement-nuxt3
description: Use when implementing API integrations, using fetching composables (useFetch, useLazyFetch, $fetch), or configuring client-side APIs in Nuxt 3 (Vue 3) SPA applications.
---

# API Implementation - Nuxt 3 (SPA-focused)

## Overview
Best practices for client-side API integrations in Nuxt 3 Single Page Applications (SPA) using reactive fetching composables (`useFetch`, `useLazyFetch`) and the `$fetch` client.

## When to Use
- Implementing API fetching in Nuxt 3 SPA Mode (`ssr: false`).
- Fetching data dynamically on user interaction or page navigation.
- Hooking up dynamic query params or reactive API parameters.

### When NOT to Use
- Nuxt 2 projects (use `api-implement-nuxt2` instead).

## Core Patterns

### 1. Route/Component Data Fetching: `useLazyFetch`
In SPA mode, `useLazyFetch` is highly recommended because it does not block navigation transitions. It fetches data asynchronously on the client, letting the UI show a loading spinner.
```vue
<script setup lang="ts">
const route = useRoute()
const config = useRuntimeConfig()

// useLazyFetch allows the page to load immediately on route changes
const { data: posts, pending, error, refresh } = useLazyFetch('/posts', {
  baseURL: config.public.apiBase,
  params: { category: () => route.query.category } // reactive parameter query
})
</script>

<template>
  <div v-if="pending" class="loading-spinner">Loading posts...</div>
  <div v-else-if="error" class="error-alert">{{ error.message }}</div>
  <div v-else>
    <div v-for="post in posts" :key="post.id" class="post-card">
      <h3>{{ post.title }}</h3>
    </div>
  </div>
</template>
```

### 2. Client Actions / Mutations: `$fetch`
Always use `$fetch` for triggering requests inside methods, submit handlers, or any dynamic user-driven actions.
```vue
<script setup lang="ts">
const email = ref('')
const loading = ref(false)

const handleSubscribe = async () => {
  if (!email.value) return
  loading.value = true
  try {
    const res = await $fetch('/api/subscribe', {
      method: 'POST',
      body: { email: email.value }
    })
    alert('Subscribed!')
  } catch (err: any) {
    alert(err.data?.message || 'Error occurred')
  } finally {
    loading.value = false
  }
}
</script>
```

### 3. Dynamic Reactive Fetching
To trigger an API fetch whenever a filter or search query changes, pass the parameters as reactive refs or computed/getter functions.
```vue
<script setup lang="ts">
const searchQuery = ref('')
const page = ref(1)

// Passing getter functions ensures parameters are reactive
const { data: results, pending } = useFetch('/api/search', {
  query: {
    q: searchQuery, // Reactive ref
    p: () => page.value // Getter function (highly recommended)
  },
  watch: [searchQuery, page] // Explicitly watch to trigger re-fetches
})
</script>
```

## Common Mistakes
- **Using `useFetch` inside functions**: Never invoke `useFetch` or `useLazyFetch` inside button click handlers or lifecycle hooks. Use `$fetch` for event-driven API requests.
- **Directly accessing `window` or client APIs during setup**: Even in SPA, wrap `localStorage` access in check routines or `onMounted` blocks to prevent compile/dev warnings.
- **Forgetting to watch query parameters**: In Nuxt 3, changing a route parameter doesn't always recreate the component. If your API parameters depend on route changes, use a getter function inside `useFetch` options or explicitly watch them.
