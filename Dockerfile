# Wybierz obraz bazowy z Node.js
FROM node:14

# Ustaw katalog roboczy w kontenerze
WORKDIR /usr/src/app

# Kopiuj pliki konfiguracyjne projektu
COPY package*.json ./

# Zainstaluj zależności projektu wraz z brakującym pakietem
RUN npm install
RUN npm install @material-ui/core

# Kopiuj pozostałe pliki źródłowe projektu
COPY . .

# Zbuduj aplikację dla produkcji
RUN npm run build

# Zainstaluj serwer HTTP globalnie w kontenerze
RUN npm install -g serve

# Uruchom serwer HTTP, serwując zawartość z folderu build na porcie 80
CMD ["serve", "-s", "build", "-l", "80"]

# Informuj Docker, że kontener nasłuchuje na porcie 80
EXPOSE 80
