<template>
    <div class="container">
      <h1>Poke Form</h1>
  
      <!-- Formulário de pesquisa -->
      <div class="form-container">
        <form @submit.prevent="fetchpokeData">
          <input
            type="text"
            v-model="pokeName"
            placeholder="Digite o nome do pokemon"
            class="poke-input"
          />
          <button type="submit" class="modern-button">Pesquisar</button>
          <button type="button" class="modern-button reset-button" @click="resetSearch">
            Resetar Pesquisa
          </button>
          <button class="modern-button" @click="goToMainPage"> Go to MainPage </button>
        </form>
      </div>
  
      <!-- Exibição de dados -->
      <div v-if="pokeData" class="poke-info-container">
        <img :src="pokeData.poster" alt="Poster do Pokemon" class="poke-poster" />
        <div class="poke-details">
          <h2>{{ pokeData.name }}</h2>
            <ul>
              <li v-for="(ability, index) in pokeData.abilities" :key="index">
                <p><strong>Ability:</strong> {{ ability.ability.name }}</p>
              </li>
            </ul>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        pokeName: '',
        pokeData: null,
      };
    },
    methods: {
      async fetchpokeData() {
        const response = await fetch(`http://localhost:8001/pokemon/${this.pokeName}`);
        const data = await response.json();
        this.pokeData = data;
      },
      resetSearch() {
        this.pokeName = '';
        this.pokeData = null;
      },
      goToMainPage() {
      this.$router.push({name:"MainPage"});
    }
    },
  };
  </script>
  
  <style scoped>
  .container {
    text-align: center;
    padding: 20px;
  }
  
  /* Estilo do formulário */
  .form-container {
    margin-top: 20px;
  }
  
  .poke-input {
    padding: 10px;
    font-size: 16px;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-right: 10px;
  }
  
  .poke-info-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
  }
  
  .poke-poster {
    width: 200px;
    border-radius: 10px;
    margin-right: 20px;
  }
  
  .poke-details {
    text-align: left;
  }
  
  .modern-button {
    background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
    border: none;
    color: white;
    padding: 10px 20px;
    font-size: 14px;
    font-weight: bold;
    border-radius: 25px;
    cursor: pointer;
    transition: all 0.3s ease;
    margin-top: 20px;
  }
  
  .modern-button:hover {
    background: linear-gradient(90deg, #2575fc 0%, #6a11cb 100%);
    transform: scale(1.05);
  }
  
  .reset-button {
    background-color: red;
    margin-left: 10px;
  }
  
  .reset-button:hover {
    background-color: darkred;
  }
  </style>
  