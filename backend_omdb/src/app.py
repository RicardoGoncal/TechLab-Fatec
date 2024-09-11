from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import httpx
import os

app = FastAPI()

# Configurações de CORS
origins = [
    "http://localhost:8080",  # Substitua pelo endereço do seu frontend Vue.js
    "http://localhost",        # Endereço local
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# JSONPlaceholder API URL
API_URL = f"http://www.omdbapi.com/?apikey={os.getenv('OMDB_KEY')}="

@app.get("/health-check")
async def health_check():
    return {"API Saudavel!!"}


@app.get("/movie/{movie_name}")
async def get_movie(movie_name: str):
    # Make an asynchronous request to the public API
    async with httpx.AsyncClient() as client:
        response = await client.get(API_URL+movie_name)
        # Check if the response was successful
        if response.status_code == 200:
            return response.json()
        else:
            return {"error": "Failed to fetch data"}
