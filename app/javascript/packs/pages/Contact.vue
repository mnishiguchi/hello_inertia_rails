<template>
  <Head>
    <title>{{ title }}</title>
  </Head>

  <h1>{{ title }}</h1>
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
      title: 'Contact'
    }
  }
}
</script>
