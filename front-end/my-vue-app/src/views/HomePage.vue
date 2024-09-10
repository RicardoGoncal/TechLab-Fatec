<template>
  <div class="hello">
    <!-- Adicionando a imagem no topo -->
    <img src="@/assets/labfatec.png" alt="Logo" class="top-image"/>
    
    <!-- Título centralizado -->
    <h1>{{ msg }}</h1>

    <h3>Essential Links</h3>
    <ul>
      <li><a href="https://minikube.sigs.k8s.io/docs/" target="_blank" rel="noopener">Minikube</a></li>
      <li><a href="https://br.vuejs.org/" target="_blank" rel="noopener">Vue Org</a></li>
      <li><a href="https://hub.docker.com/" target="_blank" rel="noopener">Docker Hub</a></li>
      <li><a href="https://docs.docker.com/engine/install/" target="_blank" rel="noopener">Docker Install</a></li>
      <li><a href="https://www.python.org/" target="_blank" rel="noopener">Python Org</a></li>
    </ul>

    <h3>APIs Links</h3>
    <ul>
      <li><a href="https://www.omdbapi.com/" target="_blank" rel="noopener">OMDb API</a></li>
      <li><a href="https://pokeapi.co/" target="_blank" rel="noopener">PokeApi</a></li>
    </ul>
    <div class="button-container">
      <button class="modern-button" @click="goToMainPage"> Entrar no Lab </button>
    </div>
    
  </div>
</template>

<script>
export default {
  name: 'HomePage',
  methods: {
    goToMainPage() {
      this.$router.push({name:"MainPage"});
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
/* Centralizando os títulos */
h1, h3, ul {
  text-align: center;
}

/* Estilizando a imagem no topo */
.top-image {
  display: block;
  margin: 0 auto;
  max-width: 250px; /* Ajuste o tamanho da imagem conforme necessário */
}

/* Mantendo os estilos existentes */
h3 {
  margin: 40px 0 0;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}

/* Centralizando o botão no contêiner */
.button-container {
  display: flex;
  justify-content: center; /* Centraliza horizontalmente */
  margin-top: 20px; /* Adiciona um espaço superior, se necessário */
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