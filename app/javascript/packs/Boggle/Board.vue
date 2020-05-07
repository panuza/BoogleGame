<template>
  <div id="boggle-app" class="text-center">
    <div class="mr-5" style="position: absolute; left: 80%; top: 10%;">
      <h5 class="blinking">Total time  Remaining</h5>
      <h2 id="timer" style="color: red;"></h2>
    </div>
    <div class="mr-5" style="position: absolute; right: 80%; top: 10%;">
      <button class="btn btn-danger" @click="startGame">New Game</button>
    </div>
    <h5 class="pt-5">Hi {{ userName }}</h5>
    <p>Click the letters on the box to make a word.</p>

    <div class="row pt-5 text-center">
      <div class="col-md-4 offset-md-4">
        <section class="game">
          <section class="boggle-box">
              <div class="boggle pt-2">
                  <button @click="selectWord">0</button>
                  <button @click="selectWord">1</button>
                  <button @click="selectWord">2</button>
                  <button @click="selectWord">3</button>
                  <button @click="selectWord">4</button>
                  <button @click="selectWord">5</button>
                  <button @click="selectWord">6</button>
                  <button @click="selectWord">7</button>
                  <button @click="selectWord">8</button>
                  <button @click="selectWord">9</button>
                  <button @click="selectWord">10</button>
                  <button @click="selectWord">11</button>
                  <button @click="selectWord">12</button>
                  <button @click="selectWord">13</button>
                  <button @click="selectWord">14</button>
                  <button @click="selectWord">15</button>
              </div>
          </section>
        </section>
      </div>
    </div>
    <div class="col-md-4 offset-md-4 pt-5 text-center">
      <div class="row text-center">
        <strong class="mt-1 h-5 w-100">New Word: </strong>
        <span class="text-center w-100 py-2"> {{ newWord }} </span>
      </div>
      <button class="row btn btn-primary my-2" @click="calculateTotal">Submit</button>
      <div class="row text-center pt-5">
        <table class="table text-center">
          <thead class="thead-dark">
            <tr>
              <th scope="col">Words</th>
              <th scope="col">Score</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(word, key) in words_array" :key="key">
              <td>{{word}}</td>
              <td>{{word.length}}</td>
            </tr>
            <tr>
              <td><strong>Total</strong></td>
              <td>{{ totalScore }} </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <div id="final-modal"  style="display: none;">
    <transition name="modal is-larger" >
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-container">
            <div class="pt-3">
              <span class="row align-center">
                <h2 class="font-roboto-15 pl-2 py-2 text-center">GAME OVER!!!!!!!!!</h2>
              </span>
              <p class="font-roboto-15 pl-2 py-2 align-center">Your total score is {{ totalScore }}</p>
              <span class="row mt-5" style="justify-content: center;">
                <button class="btn btn-danger" @click="startGame">OK</button>
              </span>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  props: ["userName", "useruid"],
  data() {
    return {
      user_name: '',
      boggle: [
              "censt",
              "eiilt",
              "eilpt",
              "eipst",
              "dhnot",
              "hhlor",
              "hlnor",
              "hlnor",
              "iiitt",
              "mottt",
              "nsssu",
              "iprsy",
              "orrvw",
              "prrry",
              "ootuw",
              "oottu"
          ],
      diceGrid: '',
      allButton: '',
      enteredWord: [],
      newWord: '',
      words_array: [],
      totalScore: 0
    }
  },

  mounted(){
    var seconds=30;
    var timer;
    function myFunction() {
      if(seconds < 30) { // I want it to say 1:00, not 60
        document.getElementById("timer").innerHTML = seconds + "s";
      }
      if (seconds >0 ) { // so it doesn't go to -1
         seconds--;
      } else {
        clearInterval(timer);
        document.getElementById("final-modal").style.display="block"; 
      }
    }
      if(!timer) {
        timer = window.setInterval(function() { 
          myFunction();
        }, 1000); // every second
      }
    document.getElementById("timer").innerHTML="30s"; 

    this.allButton = document.querySelectorAll('.boggle button');
    this.diceGrid = document.querySelector('.boggle');
    this.randomizer();
  },

  methods: {
    startGame(){
      window.location.reload();
    },

    randomizer(){
     for( var i=0; i < this.boggle.length; i++){
          // get each die
          var currentButton = this.boggle[i].split('');
          // random die side
          var boggleRoll = Math.floor(Math.random() * 5);
          // set die innerHTML to current charactor
          this.allButton[i].innerHTML = currentButton[boggleRoll];
     };
    },

    selectWord(event){
      this.enteredWord.push(event.target.innerHTML)
      if(this.enteredWord.length > 1){
        this.newWord = this.enteredWord.join().replace(/,/g, '');
      }else{
        this.newWord = this.enteredWord.join();
      }

    },

    calculateTotal(){
      this.enteredWord = []
      if(this.newWord.length > 1){
        axios({
          method: "put",
          url: '/api/user_details/calculate_total.json',
          params: { word: this.newWord, useruid: this.useruid},
          withCredentials: false
        })
        .then(res => {
          if(this.totalScore >= res.data.user_detail.score){
            alert("Invalid word")
          }else{
            this.totalScore = res.data.user_detail.score
            this.words_array.push(this.newWord)
          }
            this.newWord = ''
        })
        .catch(error => {});
      }
      else{
        alert("Word must contain at least two letters")
      }
    }
  },


}
</script>

<style scoped>
  .align-center{
    justify-content: center;
  }
  .text-center{
    text-align: center;
  }
  .boggle button {
  height: 50px;
  width: 50px;
  margin: 3px;
  border-radius: 8px;
  background-color: #fff;
  box-shadow: -2px 2px 2px #000;
  outline: none;
  border: none;
  font-weight: 800;
  &:last-child {
  }
}

.boggle {
  text-align: center;
}

.boggle button:focus {
      background-color: #acceec;
  }

.boggle-box {
    border: 5px solid #000;
    width: 270px;
    height: 250px;
    margin: 0 auto;
    background-color: green;
}

.blinking{
    animation:blinkingText 1.5s infinite;
}
@keyframes blinkingText{
    0%{     color: #ffbc00;    }
    49%{    color: #ffbc00; }
    60%{    color: transparent; }
    99%{    color:transparent;  }
    100%{   color: #ffbc00;    }
}

.modal-mask {
    position: fixed;
    z-index: 9998;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(30, 28, 63, 0.7);    /* To change the opacity background*/
    display: table;
    transition: opacity .3s ease;
  }

  .modal-wrapper {
    display: table-cell;
    vertical-align: middle;
  }

  .modal-container {
    width: 600px;
    height: 250px;
    margin: 0px auto;
    padding: 20px 30px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, .33);
    transition: all .3s ease;
    font-family: Helvetica, Arial, sans-serif;
  }
  .modal-header{
    display: block!important;
  }
  .modal-header h3 {
    margin-top: 0;
    color: #42b983;
  }

  .modal-enter {
    opacity: 0;
  }

  .modal-leave-active {
    opacity: 0;
  }

  .modal-enter .modal-container,
  .modal-leave-active .modal-container {
    -webkit-transform: scale(1.1);
    transform: scale(1.1);
  }
</style>
