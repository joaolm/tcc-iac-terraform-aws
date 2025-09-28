#!/bin/sh

# Define as variáveis a partir do ambiente, com valores padrão
DB_HOST=${DB_HOST:-db}
DB_PORT=${DB_PORT:-5432}
DB_USER=${DB_USER:-admin}

# Espera até que o banco de dados esteja pronto para aceitar conexões
echo "Aguardando o banco de dados em ${DB_HOST}:${DB_PORT}..."

# O comando 'pg_isready' checa o status do servidor PostgreSQL. O '-q' (quiet) suprime a saída.
# O loop continua até que o comando retorne sucesso (código de saída 0).
while ! pg_isready -h ${DB_HOST} -p ${DB_PORT} -U ${DB_USER} -q; do
  sleep 1
done
echo "Banco de dados pronto!"

# Executa os comandos de inicialização do Flask
echo "Inicializando o banco de dados e as traduções..."
flask initdb
flask translate compile
echo "Inicialização concluída."

# Executa o comando principal do container
exec "$@"