# Stage 1: Image de production
FROM ubuntu:latest AS production

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le script Python et le script de démarrage dans le conteneur
COPY main.py /app/main.py


# Installer Python dans le conteneur
RUN apt-get update && \
    apt-get install -y python3


# Commande à exécuter lorsque le conteneur démarre
CMD ["python3", "main.py"]

# Stage 2: Image de integration
FROM production AS integration


# Copier le script Python et le script de démarrage dans le conteneur
COPY mainTwo.py /app/mainTwo.py


# Commande à exécuter lorsque le conteneur démarre
CMD ["python3", "mainTwo.py"]

# Stage 3: Image de developpement
FROM production AS developpement 


# Copier le script Python et le script de démarrage dans le conteneur
COPY mainThree.py /app/mainThree.py


# Commande à exécuter lorsque le conteneur démarre
CMD ["python3", "mainThree.py"]
