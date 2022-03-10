<template>
  <Head>
    <title>{{ title }}</title>
  </Head>

  <h1>{{ title }}</h1>

  <p>This is an <a href="https://inertiajs.com">inertiajs</a>-powered page.</p>
</template>

<script>
import { Head } from '@inertiajs/inertia-vue3'

export default {
  components: {
    Head
  },
  props: {},
  data: function () {
    return {
      title: 'Home'
    }
  }
}
</script>
