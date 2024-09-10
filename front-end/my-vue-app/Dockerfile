# Use a imagem oficial do Node.js como imagem base
FROM node:22-alpine

# Crie um diretório de trabalho no contêiner
WORKDIR /app

# Copie o package.json e package-lock.json (se houver) para o diretório de trabalho
COPY package*.json ./

# Instale as dependências da aplicação
RUN npm install

# Copie o restante do código fonte para o diretório de trabalho
COPY . .

# Construa a aplicação para produção
RUN npm run build

# Exponha a porta em que o servidor da aplicação estará rodando
EXPOSE 8080

# Defina o comando para iniciar o servidor de desenvolvimento
CMD ["npm", "run", "serve"]
