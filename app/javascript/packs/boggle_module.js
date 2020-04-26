import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'

import BoggleApp from './Boggle/Default.vue'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#boggle-app',
     render: h => h(BoggleApp)

    // data: () => {
    //   return {
    //     message: "Can you say hello?"
    //   }
    // },
    // components: { App }
  })
})