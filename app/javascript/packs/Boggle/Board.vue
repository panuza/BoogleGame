<template>
  <div id="boggle-app" class="text-center">
    <h1 class="pt-5">Boggle Board</h1>
    <div class="row pt-5 text-center">
      <div class="col-md-2 offset-md-5">
        <section class="game">
          <section class="boggle-box">
              <div class="boggle pt-2">
                  <button>0</button>
                  <button>1</button>
                  <button>2</button>
                  <button>3</button>
                  <button>4</button>
                  <button>5</button>
                  <button>6</button>
                  <button>7</button>
                  <button>8</button>
                  <button>9</button>
                  <button>10</button>
                  <button>11</button>
                  <button>12</button>
                  <button>13</button>
                  <button>14</button>
                  <button>15</button>
              </div>
          </section>
        </section>
      </div>
    </div>
  </div>
</template>

<script>
export default {
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
      allDie: ''

    }
  },

  mounted(){
    this.allDie = document.querySelectorAll('.boggle button');
    this.diceGrid = document.querySelector('.boggle');
    this.randomizer();

  },

  methods: {
    randomizer(){
     for( var i=0; i < this.boggle.length; i++){
          // get each die
          var currentDie = this.boggle[i].split('');
          // random die side
          var boggleRoll = Math.floor(Math.random() * 5);
          // set die innerHTML to current charactor
          this.allDie[i].innerHTML = currentDie[boggleRoll];
     };
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
