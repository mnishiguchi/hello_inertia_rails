<template>
  <nav class="navbar" role="navigation" aria-label="main navigation">
    <Link href="/" class="navbar-item"> Home</Link>
    &middot;
    <Link href="/contact" class="navbar-item">Contact</Link>
    &middot;
    <Link href="/about" class="navbar-item">About</Link>
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
