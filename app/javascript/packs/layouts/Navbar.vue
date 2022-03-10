<template>
  <nav class="navbar" role="navigation" aria-label="main navigation">
    <Link href="/" class="navbar-item"> Home</Link>
    &middot;
    <Link href="/checklists" class="navbar-item">Checklists</Link>
    &middot;
    <Link href="/about" class="navbar-item">About</Link>
    &middot;
    <a href="/rails" class="navbar-item">Rails</a>
  </nav>
</template>

<script>
import { Link } from '@inertiajs/inertia-vue3'

export default {
  components: {
    Link,
  }
}
</script>
