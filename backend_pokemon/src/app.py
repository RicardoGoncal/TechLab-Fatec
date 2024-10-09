from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import httpx  # Biblioteca para requisições HTTP assíncronas
from pydantic import BaseModel  # Biblioteca para definição de modelos de dados
from typing import List  # Utilizado para definir uma lista de objetos como tipo

app = FastAPI()  # Inicializa a aplicação FastAPI

# Configurações de CORS (Cross-Origin Resource Sharing)
origins = [
    "http://localhost:8080",  # Substitua pelo endereço do frontend Vue.js
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

# Define o modelo para as habilidades do Pokémon (BaseModel é a estrutura do Pydantic)
class AbilityDetail(BaseModel):
    name: str  # Nome da habilidade
    url: str   # URL com mais informações sobre a habilidade

class Ability(BaseModel):
    ability: AbilityDetail  # Detalhes da habilidade
    is_hidden: bool  # Se a habilidade é oculta
    slot: int  # Posição da habilidade

# Define o modelo para o Pokémon com nome, URL, imagem (poster) e habilidades
class Pokemon(BaseModel):
    name: str  # Nome do Pokémon
    url: str  # URL com mais detalhes do Pokémon
    poster: str  # URL da imagem oficial do Pokémon
    abilities: List[Ability]  # Lista de habilidades do Pokémon

# URL da API pública do PokeAPI
API_URL = "https://pokeapi.co/api/v2/pokemon/"

# Endpoint para verificar se a API está saudável
@app.get("/api2/health-check")
async def health_check():
    return {"API Saudavel!!"}  # Retorna uma mensagem simples de saúde

# Endpoint para buscar informações de um Pokémon pelo nome
@app.get("/api2/pokemon/{pokemon_name}")
async def get_pokemon(pokemon_name: str):
    # Faz uma requisição assíncrona para a API pública (PokeAPI)
    async with httpx.AsyncClient() as client:
        response = await client.get(API_URL + pokemon_name)
        # Verifica se a resposta foi bem-sucedida
        if response.status_code == 200:
            data = response.json()  # Converte a resposta em JSON

            # Combina os dados que serão retornados ao cliente
            combined_data = {
                "name": data["forms"][0]["name"],  # Nome do Pokémon
                "url": data["forms"][0]["url"],  # URL do Pokémon
                "poster": data["sprites"]["other"]["official-artwork"]["front_default"],  # Imagem oficial do Pokémon
                "abilities": data["abilities"]  # Lista de habilidades
            }

            # Constrói o objeto Pokemon com os dados combinados
            pokemon = Pokemon(**combined_data)
            return pokemon  # Retorna o Pokémon com nome, URL, poster e habilidades
        else:
            return {"error": "Failed to fetch data"}  # Retorna um erro caso a requisição falhe
