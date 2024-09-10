<template>
  <div class="container">
    <h1>Main Page</h1>

    <!-- Card List -->
    <div class="card-list">
      <div class="card" @click="goToOmdbForm">
        <img src="@/assets/omdb_logo.png" alt="omdbapi" class="card-image"/>
        <h3>OMDB API</h3>
        <p>Para usar a API de filmes clique aqui!</p>
      </div>

      <div class="card" @click="goToPokeForm">
        <img src="@/assets/pokemon_logo.png" alt="pokemonapi" class="card-image"/>
        <h3>POKEMON API</h3>
        <p>Para usar a API do Pokemon clique aqui!</p>
      </div>
    </div>

    <div class="button-container">
      <button class="modern-button" @click="goToHomePage">Go to HomePage</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'MainPage',
  methods: {
    goToHomePage() {
      this.$router.push({ name: 'HomePage' });
    },
    goToOmdbForm() {
      this.$router.push({ name: 'OmdbForm' });
    },
    goToPokeForm() {
      this.$router.push({ name: 'PokeForm' });
    }
  }
}
</script>

<style scoped>
/* Centralizando os títulos */
h1, h3, ul {
  text-align: center;
}

.card-list {
  display: flex;
  justify-content: center;
  gap: 20px;
  margin-top: 40px;
}

.card {
  background-color: #f9f9f9;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  padding: 20px;
  text-align: center;
  cursor: pointer;
  transition: transform 0.3s ease;
  max-width: 200px;
}

.card:hover {
  transform: scale(1.05);
}

.card-image {
  max-width: 100%;
  border-radius: 5px;
}

.button-container {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.modern-button {
  background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
  border: none;
  color: white;
  padding: 15px 30px;
  font-size: 16px;
  font-weight: bold;
  border-radius: 25px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.modern-button:hover {
  background: linear-gradient(90deg, #2575fc 0%, #6a11cb 100%);
  transform: scale(1.05);
}

.modern-button:focus {
  outline: none;
}
</style>
