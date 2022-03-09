<template>
  <main>
    <header class="container">
      <Navbar />
    </header>

    <div class="container">
      <slot />
    </div>
  </main>
</template>

<script>
import { Link } from '@inertiajs/inertia-vue3'
import Navbar from "./Navbar"

export default {
  components: {
    Link,
    Navbar
  }
}
</script>
