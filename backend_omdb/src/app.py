from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import httpx  # Biblioteca para fazer requisições HTTP de maneira assíncrona
import os  # Biblioteca para acessar variáveis de ambiente

app = FastAPI()  # Inicializa a aplicação FastAPI

# Configurações de CORS (Cross-Origin Resource Sharing)
origins = [
    "http://localhost:8080",  # Substitua pelo endereço do seu frontend Vue.js
    "http://localhost",        # Endereço local
]

# Adiciona o middleware de CORS para permitir requisições de outros domínios
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Permite requisições de qualquer origem
    allow_credentials=True,  # Permite o uso de cookies e credenciais
    allow_methods=["*"],  # Permite todos os métodos HTTP (GET, POST, etc.)
    allow_headers=["*"],  # Permite todos os tipos de cabeçalhos
)

# URL da API do OMDb (OMDB_KEY é uma variável de ambiente contendo a chave da API)
API_URL = f"http://www.omdbapi.com/?apikey={os.getenv('OMDB_KEY')}="

# Endpoint para verificar se a API está funcionando
@app.get("/api1/health-check")
async def health_check():
    return {"API Saudavel!!"}  # Retorna uma mensagem simples de saúde

# Endpoint para buscar informações de um filme pelo nome
@app.get("/api1/movie/{movie_name}")
async def get_movie(movie_name: str):
    # Faz uma requisição assíncrona para a API pública (OMDb)
    async with httpx.AsyncClient() as client:
        response = await client.get(API_URL + movie_name)
        # Verifica se a resposta foi bem-sucedida
        if response.status_code == 200:
            return response.json()  # Retorna os dados do filme em formato JSON
        else:
            return {"error": "Failed to fetch data"}  # Retorna uma mensagem de erro se a requisição falhar
