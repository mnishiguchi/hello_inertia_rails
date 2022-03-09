// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import Rails from '@rails/ujs'
import * as ActiveStorage from '@rails/activestorage'
import { createApp, h } from 'vue'
import { createInertiaApp } from '@inertiajs/inertia-vue3'
import { InertiaProgress } from '@inertiajs/progress'

// https://milligram.io/
import 'milligram/dist/milligram.min.css'

import Layout from './layouts/Layout.vue'

Rails.start()
ActiveStorage.start()
InertiaProgress.init()

// https://inertiajs.com/client-side-setup
createInertiaApp({
  resolve: (name) => {
    const page = require(`./pages/${name}`).default
    page.layout = page.layout || Layout
    return page
  },
  setup({ el, App, props, plugin }) {
    createApp({ render: () => h(App, props) })
      .use(plugin)
      .mount(el)
  }
})
