<template>
  <Head>
    <title>{{ title }}</title>
  </Head>

  <h1>{{ title }}</h1>

  <form
    @submit.prevent="
      form.put(checklist.url, {
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
        <button type="submit" :disabled="form.processing">Update</button>
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
    checklist: Object,
    errors: Object
  },
  data: function () {
    return {
      title: `Edit ${this.$props.checklist.name}`
    }
  },
  setup(props) {
    const form = useForm({
      name: props.checklist.name
    })

    return { form }
  }
}
</script>
