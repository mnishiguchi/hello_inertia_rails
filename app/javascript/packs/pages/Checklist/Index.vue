<template>
  <Head>
    <title>{{ title }}</title>
  </Head>

  <h1>{{ title }}</h1>

  <p>This is an <a href="https://inertiajs.com">inertiajs</a>-powered page.</p>

  <ul>
    <li v-for="checklist in checklists" :key="checklist.id">
      <Link :href="checklist.url">{{ checklist.name }}</Link>
    </li>
  </ul>

  <Link :href="new_checklist_url">New list</Link>
</template>

<script>
import { Head, Link, useForm } from '@inertiajs/inertia-vue3'

export default {
  components: {
    Head,
    Link
  },
  props: {
    checklists: Array,
    new_checklist_url: String,
    errors: Object
  },
  data: function () {
    return {
      title: 'Checklists'
    }
  },
  setup() {
    const form = useForm({
      name: null
    })

    return { form }
  }
}
</script>
