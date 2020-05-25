<template>
  <div id="boggle-app" class="text-center">
    <div class="mr-5" id="stop-time" style="position: absolute; left: 80%; top: 10%;">
      <button class="btn btn-danger" @click="startGame">Quit Game</button>
    </div>
    <div class="row pt-3 text-center">
      <div class="col-md-4 offset-md-4">
        <div class="row">
          <div class="col-md-6 text-left">
            <h6 class="">Player: </h6>
            <p>{{ userName }}</p>
          </div>
          <div class="col-md-6 text-right" id="stop-time">
            <h6 >Total time  Remaining</h6>
            <p id="time" style="color: red;"></p> 
          </div>
        </div>
        <div class="game">
          <div class="boggle-box">
              <div class="boggle pt-2">
                  <button id = "btn-0" rowId = "0" colId = "0" @click="selectWord" :disabled="active">0</button>
                  <button id = "btn-1" rowId = "0" colId = "1" @click="selectWord" :disabled="active">1</button>
                  <button id = "btn-2" rowId = "0" colId = "2" @click="selectWord" :disabled="active">2</button>
                  <button id = "btn-3" rowId = "0" colId = "3" @click="selectWord" :disabled="active">3</button>
                  <button id = "btn-4" rowId = "1" colId = "0" @click="selectWord" :disabled="active">4</button>
                  <button id = "btn-5" rowId = "1" colId = "1" @click="selectWord" :disabled="active">5</button>
                  <button id = "btn-6" rowId = "1" colId = "2" @click="selectWord" :disabled="active">6</button>
                  <button id = "btn-7" rowId = "1" colId = "3" @click="selectWord" :disabled="active">7</button>
                  <button id = "btn-8" rowId = "2" colId = "0" @click="selectWord" :disabled="active">8</button>
                  <button id = "btn-9" rowId = "2" colId = "1" @click="selectWord" :disabled="active">9</button>
                  <button id = "btn-10" rowId = "2" colId = "2" @click="selectWord" :disabled="active">10</button>
                  <button id = "btn-11"rowId = "2" colId = "3" @click="selectWord" :disabled="active">11</button>
                  <button id = "btn-12" rowId = "3" colId = "0" @click="selectWord" :disabled="active">12</button>
                  <button id = "btn-13" rowId = "3" colId = "1" @click="selectWord" :disabled="active">13</button>
                  <button id = "btn-14" rowId = "3" colId = "2" @click="selectWord" :disabled="active">14</button>
                  <button id = "btn-15" rowId = "3" colId = "3" @click="selectWord" :disabled="active">15</button>
              </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-4 offset-md-4 pt-5 text-center">
      <div class="row text-center">
        <strong class="mt-1 h-5 w-100">New Word: </strong>
        <span class="text-center w-100 py-2"> {{ newWord }} </span>
      </div>
      <button class="row btn btn-success my-2" @click="calculateTotal">Submit</button>
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
                <td><strong>{{ totalScore }}</strong></td>
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
      totalScore: 0,
      clicked: false,
      active: false,
      prevElementRow: "",
      prevElementCol: "",
      temp: []
    }
  },

  mounted(){
    var timeLeft = 60 * 3,
    display = document.querySelector('#time');
    this.startTimer(timeLeft, display);

    this.allButton = document.querySelectorAll('.boggle button');
    this.diceGrid = document.querySelector('.boggle');
    this.randomizer();
  },

  methods: {

    startTimer(duration, display) {
      var start = Date.now(),
          diff,
          hours,
          minutes,
          seconds;

      function timer() {
          diff = duration - (((Date.now() - start) / 1000) | 0);
          hours = (diff / 3600) | 0;
          minutes = ((diff % 3600)/60) | 0;
          seconds = (diff % 60) | 0;

          hours = hours < 10 ? "0" + hours : hours;
          minutes = minutes < 10 ? "0" + minutes : minutes;
          seconds = seconds < 10 ? "0" + seconds : seconds;
          display.textContent = hours + ":" + minutes + ":" + seconds;

          if (diff <= 0) {
              // start = Date.now() + 1000;
            clearInterval(timer, 0);
            document.getElementById("stop-time").style.display="none";
            document.getElementById("final-modal").style.display="block";
          }
      };
      timer();
      setInterval(timer, 1000);
  },

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
      var currentRowVal = event.currentTarget.attributes.rowid.value
      var currentColVal = event.currentTarget.attributes.colid.value
      this.temp.push(event.currentTarget.id)
      if(currentRowVal == parseInt(this.prevElementRow) && currentColVal == parseInt(this.prevElementCol)){
        return true
      }
      else{
        for( var i=0; i < this.boggle.length; i++){
          var rowVal = this.allButton[i].attributes.rowid.value
          var colVal = this.allButton[i].attributes.colid.value

          var colDiff = Math.abs(currentRowVal - rowVal);
          var rowDiff = Math.abs(currentColVal - colVal);
          if (colDiff <= 1 && rowDiff <= 1) {
            if(this.temp.includes(this.allButton[i].id)){
              this.allButton[i].disabled = true
            }else{
              this.allButton[i].disabled = false
              event.currentTarget.style.backgroundColor = "#acceec"
            }
          } else {
            this.allButton[i].disabled = true
          }
        }
      }
      this.enteredWord.push(event.target.innerHTML)
      if(this.enteredWord.length > 1){
        this.newWord = this.enteredWord.join().replace(/,/g, '');
      }else{
        this.newWord = this.enteredWord.join();
      }

      this.prevElementRow = currentRowVal
      this.prevElementCol = currentColVal
    },

    calculateTotal(){
      this.enteredWord = []
      for( var i=0; i < this.boggle.length; i++){
        this.allButton[i].style.backgroundColor="#ffffff"
        this.allButton[i].disabled = false
      }
      if(this.words_array.includes(this.newWord)){
        alert("Word already taken...")
        this.newWord = ''
      }
      else{
        if(this.newWord.length > 2){
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
          alert("Word must contain at least three letters")
        }
      }
    }
  },


}
</script>

<style>
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
