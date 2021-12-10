# Imagen base
FROM mybase

# Establecer variable para no interactuar
ARG DEBIAN_FRONTEND=noninteractive

# Descargar e instalar dependencias
#RUN apt-get update
#RUN apt-get upgrade
COPY ./config.json /home/
COPY ./nodeServer.js /home/
#RUN (cd /home; apt-get install -y build-essential)
#RUN (cd /home; apt install -y curl)
#RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN (cd /home; apt-get install -y nodejs)
RUN (cd /home; apt-get install -y npm)
RUN (cd /home; npm install -y rethinkdb)
#RUN (cd /home; node nodeServer.js)

# Comando de arranque
CMD node /home/nodeServer.js
# && node nodeServer.js
