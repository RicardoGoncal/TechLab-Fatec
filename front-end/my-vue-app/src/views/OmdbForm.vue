<template>
    <div class="container">
      <h1>Omdb Form</h1>
  

      <!-- Formulário de pesquisa -->
      <div class="form-container">
        <form @submit.prevent="fetchMovieData">
          <input
            type="text"
            v-model="movieTitle"
            placeholder="Digite o nome do filme"
            class="movie-input"
          />
          <button type="submit" class="modern-button">Pesquisar</button>
          <button type="button" class="modern-button reset-button" @click="resetSearch">
            Resetar Pesquisa
          </button>
          <button class="modern-button" @click="goToMainPage"> Go to MainPage </button>
        </form>
      </div>
  
      <!-- Exibição de dados -->
      <div v-if="movieData" class="movie-info-container">
        <img :src="movieData.Poster" alt="Poster do Filme" class="movie-poster" />
        <div class="movie-details">
          <h2>{{ movieData.Title }}</h2>
          <p><strong>Ano:</strong> {{ movieData.Year }}</p>
          <p><strong>Diretor:</strong> {{ movieData.Director }}</p>
          <p><strong>Gênero:</strong> {{ movieData.Genre }}</p>
          <p><strong>Descrição:</strong> {{ movieData.Plot }}</p>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import { API_URL } from "@/config";

  export default {
    data() {
      return {
        movieTitle: '',
        movieData: null,
      };
    },
    methods: {
      async fetchMovieData() {
        const response = await fetch(`${API_URL}/movie/${this.movieTitle}`);
        const data = await response.json();
        this.movieData = data;
      },
      resetSearch() {
        this.movieTitle = '';
        this.movieData = null;
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
  
  .movie-input {
    padding: 10px;
    font-size: 16px;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-right: 10px;
  }
  
  .movie-info-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
  }
  
  .movie-poster {
    width: 200px;
    border-radius: 10px;
    margin-right: 20px;
  }
  
  .movie-details {
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
  