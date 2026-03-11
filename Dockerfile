FROM ubuntu:24.04

# Installation de git et nettoyage pour optimiser l'image 
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/* 

EXPOSE 22
