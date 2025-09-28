FROM python:3.9-slim-bookworm AS builder

# Instala o git para que possamos clonar o repositório
RUN apt-get update && apt-get install -y git postgresql-client

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Clona o repositório do Todoism para o diretório de trabalho
RUN git clone https://github.com/greyli/todoism.git .

# Cria um ambiente virtual para isolar as dependências
RUN python -m venv /opt/venv

# Ativa o ambiente virtual e instala as dependências do projeto
RUN /opt/venv/bin/pip install --no-cache-dir -r requirements.txt

# Adiciona o executável do ambiente virtual ao PATH do sistema.
ENV PATH="/opt/venv/bin:$PATH"

# Copia o entrypoint.sh para o container
COPY entrypoint.sh /usr/local/bin/

# Concede permissão de execução
RUN chmod +x /usr/local/bin/entrypoint.sh

# Executa os comandos de inicialização do banco de dados e de tradução.
ENTRYPOINT ["entrypoint.sh"]

# Expõe a porta 5000, que o servidor de desenvolvimento do Flask usará
EXPOSE 5000

# O '--host=0.0.0.0' é essencial para que o servidor seja acessível de fora do container.
CMD ["flask", "run", "--host=0.0.0.0"]