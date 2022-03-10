<template>
  <main>
    <header class="container" style="margin-bottom: 2rem">
      <Navbar />
    </header>

    <div class="container">
      <FlashMessage />

      <slot />
    </div>
  </main>
</template>

<script>
import { Link } from '@inertiajs/inertia-vue3'
import Navbar from './Navbar'
import FlashMessage from './FlashMessage'

export default {
  components: {
    Link,
    Navbar,
    FlashMessage
  }
}
</script>
