# Use a imagem oficial do Node.js como imagem base
FROM python:3.10-slim

# Crie um diretório de trabalho no contêiner
WORKDIR /app

# Copie o requirements para instalar os pacotes
COPY ./requirements.txt /app/requirements.txt

# Instale as dependências da aplicação
RUN pip install -r /app/requirements.txt

# Copie o restante do código fonte para o diretório de trabalho
COPY . .

# Exponha a porta em que o servidor da aplicação estará rodando
EXPOSE 8000

# Defina o comando para iniciar o servidor de desenvolvimento
CMD ["uvicorn", "src.app:app", "--host", "0.0.0.0", "--port", "8000"]
