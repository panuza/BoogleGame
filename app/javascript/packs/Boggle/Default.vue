<template>
  <div id="boggle-app" class="text-center">
    <div id="boggle-start">
      <p class="pt-5">Welcome to boggle game!!!</p>
      <div class="row">
        <div class="col-md-2 offset-md-5">
          <div class="form-group mx-sm-3 mt-5 mb-2">
            <label for="name" class="sr-only text-center">Password</label>
            <input type="text" class="form-control" id="name" placeholder="Enter your name" v-model="userName" required="true">
          </div>
          <button class="btn btn-primary mb-2 mt-3" @click="showBoard">Start Game</button>
        </div>
      </div>
    </div>
    <Board v-if="displayBoard" :userName="userName" :useruid="useruid"></Board>
  </div>
</template>; 

<script>
import axios from 'axios'
import Board from './Board'

export default {
  data() {
    return {
      userName: '',
      displayBoard: false,
      useruid: ''
    }
  },

  components: {
    Board
  },

  mounted(){
  },

  methods: {
    showBoard(){
      axios({
              method: "post",
              url: '/api/user_details.json',
              params: { name: this.userName},
              withCredentials: false
            })
      .then(res => {
        document.getElementById('boggle-start').style.display= 'none';
        this.useruid = res.data.user_detail.user_uid
        this.displayBoard = true
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
