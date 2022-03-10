<template>
  <Head>
    <title>{{ title }}</title>
  </Head>

  <h1>{{ title }}</h1>

  <form
    @submit.prevent="
      form.post(checklists_url, {
        onSuccess: () => form.reset('name')
      })
    "
  >
    <div class="row">
      <div class="column">
        <input id="name" v-model="form.name" placeholder="list name" />
        <div v-if="errors && errors.name" class="invalid-feedback">
          {{ errors.name[0] }}
        </div>
      </div>
      <div class="column">
        <button type="submit" :disabled="form.processing">Create</button>
      </div>
    </div>
  </form>
</template>

<script>
import { Head, Link, useForm } from '@inertiajs/inertia-vue3'

export default {
  components: {
    Head,
    Link
  },
  props: {
    checklists_url: String,
    errors: Object
  },
  data: function () {
    return {
      title: 'New Checklist'
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
