<template>
  <div id="boggle-app" class="text-center">
    <p class="pt-5">Welcome to boggle game!!!</p>
    <div class="row">
      <div class="col-md-2 offset-md-5">
       <!--  <form class="text-center pt-3" accept-charset="UTF-8" @submit="showBoard"> -->
        <div class="form-group mx-sm-3 mt-5 mb-2">
          <label for="name" class="sr-only text-center">Password</label>
          <input type="text" class="form-control" id="name" placeholder="Enter your name" v-model="user_name" required="true">
        </div>
        <button class="btn btn-primary mb-2 mt-3" @click="showBoard">Start Game</button>
      <!-- </form> -->
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      user_name: '',

    }
  },

  mounted(){
  },

  methods: {
    showBoard(){
      axios({
              method: "post",
              url: '/api/user_details.json',
              params: { name: this.user_name},
              withCredentials: false
            })
      .then(res => {
        window.location.href = "/board"
      })
      .catch(error => {});

    }
  }

}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
  color: red;
}

.text-center{
  text-align: center;
}

.bg-color{
  background-color: #EBFC7E;
}

.vertical-center{
  vertical-align: ""
}
</style>
