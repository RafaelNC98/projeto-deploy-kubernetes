#!/bin/bash

echo "Criando as imagens................"

docker build -t rafael625198/projeto-backend:1.0 backend/.
docker build -t rafael625198/projeto-database:1.0 database/.

echo "Realizando push das imagens.............."

docker push rafael625198/projeto-backend:1.0
docker push rafael625198/projeto-database:1.0

echo "Criando serviços no cluster kubernetes.............."

kubectl apply -f ./services.yml

echo "Criando deployments.........."


kubectl apply -f ./deployment.yml
