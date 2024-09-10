from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import httpx
from pydantic import BaseModel
from typing import List


app = FastAPI()

# Configurações de CORS
origins = [
    "http://localhost:8080",  # Substitua pelo endereço do seu frontend Vue.js
    "http://localhost",        # Endereço local
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# Define o modelo para Hablidades
class AbilityDetail(BaseModel):
    name: str
    url: str

class Ability(BaseModel):
    ability: AbilityDetail
    is_hidden: bool
    slot: int

# Define modelo Pokemon
class Pokemon(BaseModel):
    name: str
    url: str
    poster: str
    abilities: List[Ability]


# JSONPlaceholder API URL
API_URL = "https://pokeapi.co/api/v2/pokemon/"

@app.get("/health-check")
async def health_check():
    return {"API Saudavel!!"}


@app.get("/pokemon/{pokemon_name}")
async def get_pokemon(pokemon_name: str):
    # Make an asynchronous request to the public API
    async with httpx.AsyncClient() as client:
        response = await client.get(API_URL+pokemon_name)
        # Check if the response was successful
        if response.status_code == 200:
            
            data = response.json()

            combined_data = {
                "name": data["forms"][0]["name"],
                "url": data["forms"][0]["url"],
                "poster": data["sprites"]["other"]["official-artwork"]["front_default"],
                "abilities": data["abilities"]
            }
            pokemon = Pokemon(**combined_data)
            return pokemon
        else:
            return {"error": "Failed to fetch data"}
