# syntax=docker/dockerfile:1

FROM python:3.10.2-bullseye

WORKDIR /var/www/GSB-RV-Visiteur-Serveur

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

WORKDIR /var/www/GSB-RV-Visiteur-Serveur/app

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]