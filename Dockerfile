# Utiliser l'image Ubuntu comme base
FROM ubuntu:latest

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le script Python et le script de démarrage dans le conteneur
COPY main.py /app/main.py

# Installer Python dans le conteneur
RUN apt-get update && \
    apt-get install -y python3

# Rendre le script de démarrage exécutable

# Commande à exécuter lorsque le conteneur démarre
CMD ["python3", "main.py"]
