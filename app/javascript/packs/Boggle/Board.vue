<template>
  <div id="boggle-app" class="text-center">
    <h1 class="pt-5">Boggle Board</h1>
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
            <tr>
              <td>Otto</td>
              <td>@mdo</td>
            </tr>
          </tbody>
        </table>
      </div>
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
      populate_word: ''

    }
  },

  mounted(){
    this.allButton = document.querySelectorAll('.boggle button');
    this.diceGrid = document.querySelector('.boggle');
    this.randomizer();
  },

  methods: {
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
      axios({
        method: "put",
        url: '/api/user_details/calculate_total.json',
        params: { word: this.newWord, useruid: this.useruid},
        withCredentials: false
      })
      .then(res => {
        if(res.data.user_detail.invalid){
          alert("Invalid word")
          this.newWord = ''
        }else{
          this.populate_word = this.newWord
        }
        // document.getElementById('boggle-start').style.display= 'none';
        // this.displayBoard = true
        // window.location.href = "/board"
      })
      .catch(error => {});
    }
  }

}
</script>

<style scoped>
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
</style>
