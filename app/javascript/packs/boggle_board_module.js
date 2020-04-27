import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'

import BoggleBoardApp from './Boggle/Board.vue'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#boggle-board-app',
     render: h => h(BoggleBoardApp)

    // data: () => {
    //   return {
    //     message: "Can you say hello?"
    //   }
    // },
    // components: { App }
  })
})