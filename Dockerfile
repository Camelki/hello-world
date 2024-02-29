# Stage 1: Image de production
FROM ubuntu:latest AS base

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Installer Python dans le conteneur
RUN apt-get update && \
    apt-get install -y python3

FROM base AS prod

COPY main_prod.py /app/main_prod.py

CMD ["python3", "main_prod.py"]

# Stage 2: Image de integration
FROM base AS int

# Copier le script Python et le script de démarrage dans le conteneur
COPY main_int.py /app/main_int.py

# Commande à exécuter lorsque le conteneur démarre
CMD ["python3", "main_int.py"]

# Stage 3: Image de developpement
FROM base AS devel

# Copier le script Python et le script de démarrage dans le conteneur
COPY main_devel.py /app/main_devel.py

# Commande à exécuter lorsque le conteneur démarre
CMD ["python3", "main_devel.py"]
