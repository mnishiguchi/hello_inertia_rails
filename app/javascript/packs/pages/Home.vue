<template>
  <Head>
    <title>{{ title }}</title>
  </Head>

  <h1>{{ title }}</h1>
  <p>This page was loaded at {{ time }}</p>
</template>

<script>
import { Head } from '@inertiajs/inertia-vue3'

export default {
  components: {
    Head
  },
  props: {
    time: String
  },
  data: function () {
    return {
      title: 'Home'
    }
  }
}
</script>
