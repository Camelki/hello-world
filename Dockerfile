# Dockerfile
FROM ubuntu:latest

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers nécessaires dans le conteneur
COPY main.py /app/main.py
COPY start.sh /app/start.sh

# Installer Python
RUN apt-get update && \
    apt-get install -y python3

# Rendre le script start.sh exécutable
RUN chmod +x /app/start.sh

# Commande à exécuter lorsque le conteneur démarre
CMD ["/bin/bash", "/app/start.sh"]