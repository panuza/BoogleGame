<template>
  <div id="boggle-app" class="text-center">
    <img src="https://process.filestackapi.com/cache=expiry:max/resize=width:700/GliZS1I9QHKlu0FPNocW" alt="avatar">
    <div id="boggle-start">
      <div class="text-left">
        <div class="row">
          <div class="col-md-4 offset-md-4" >
          <h1 class="pt-5 text-left">Welcome to boggle game!!!</h1>
          <span style="font-size: 14px;">
            Boggle game is played using a grid of letters, in which the players attempt to find words in sequences of adjacent letters,
            which is a word game invented by Allan Turoff and originally distributed by Parker Brothers. 
            </br>
            Basically, The player searches for words that can be constructed from the letters of sequentially adjacent cubes, where "adjacent" cubes are those horizontally, vertically and diagonally neighboring. Words must be at least three letters long, may include singular and plural (or other derived forms) separately. The application records all the words that is submitted by the player. After three minutes have elapsed, the application stops the player from the game play and the game displays the total score.
          </span>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4 offset-md-4">
          <div class="form-group mx-sm-3 mt-5 mb-2">
            <label for="name" class="sr-only text-center">Password</label>
            <input type="text" class="form-control" id="name" placeholder="Enter your name" v-model="userName" required="true">
          </div>
          <button class="btn btn-success w-50 mt-5" @click="showBoard">Start Game</button>
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

input {
  height: 60px;
}
</style>
