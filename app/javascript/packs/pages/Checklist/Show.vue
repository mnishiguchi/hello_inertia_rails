<template>
  <Head>
    <title>{{ title }}</title>
  </Head>

  <h1>{{ title }}</h1>

  <p><Link :href="`${checklist.url}/edit`">edit</Link></p>

  <div
    v-for="checklist_item in checklist_items"
    :key="checklist_item.id"
    class="row"
  >
    <span class="column column-50" style="font-size: 2.5rem">
      <span @click="toggleCheck(checklist_item)">
        <span v-if="checklist_item.checked">☑</span>
        <span v-else>☐</span>
      </span>
      &nbsp;
      {{ checklist_item.name }}
    </span>
    <span class="column">
      <button
        :title="`edit ${checklist_item.name}`"
        @click="editItem(checklist_item)"
        class="button button-outline"
        style="margin-right: 0.5rem"
      >
        🖊️
      </button>
      <button
        :title="`remove ${checklist_item.name}`"
        @click="removeItem(checklist_item)"
        class="button button-outline"
      >
        🗑
      </button>
    </span>
  </div>

  <form
    @submit.prevent="
      form.post(checklist.checklist_items_url, {
        onSuccess: () => form.reset('name')
      })
    "
  >
    <div class="row">
      <div class="column cilumn-50">
        <input id="name" v-model="form.name" placeholder="item name" />
        <div v-if="errors && errors.name" class="invalid-feedback">
          {{ errors.name[0] }}
        </div>
      </div>
      <div class="column cilumn">
        <button
          type="submit"
          :disabled="form.processing"
          class="button button-outline"
        >
          ➕
        </button>
      </div>
    </div>
  </form>

  <section>
    <h2>Danger zone</h2>
    <p>
      <button
        :title="`delete ${checklist.name}`"
        @click="deleteChecklist(checklist)"
      >
        delete list
      </button>
    </p>
  </section>
</template>

<script>
import { Inertia } from '@inertiajs/inertia'
import { Head, Link, useForm } from '@inertiajs/inertia-vue3'

export default {
  components: {
    Head,
    Link
  },
  props: {
    checklist: Object,
    checklist_items: Array,
    errors: Object
  },
  data: function () {
    return {
      title: this.$props.checklist.name
    }
  },
  methods: {
    toggleCheck(checklist_item) {
      Inertia.put(checklist_item.url, { checked: !checklist_item.checked })
    },
    editItem(checklist_item) {
      Inertia.get(`${checklist_item.url}/edit`, {})
    },
    removeItem(checklist_item) {
      if (window.confirm('Are you sure?')) {
        Inertia.delete(checklist_item.url, {})
      }
    },
    deleteChecklist(checklist) {
      if (window.confirm('Are you sure?')) {
        Inertia.delete(checklist.url, {})
      }
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
