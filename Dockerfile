# Wybierz obraz bazowy z Node.js
FROM node:14

# Ustaw katalog roboczy w kontenerze
WORKDIR /usr/src/app

# Kopiuj pliki konfiguracyjne projektu
COPY package*.json ./
COPY .firebaserc .
COPY .gitignore .
COPY firebase.json .
COPY README.md .

# Zainstaluj zależności projektu
RUN npm install

# Kopiuj pozostałe pliki źródłowe projektu
COPY public/ public/
COPY src/ src/

# Skopiuj pozostałe pliki i katalogi, jeśli są niezbędne
# Na przykład, jeśli korzystasz z Firebase:
COPY firebase/ firebase/

# Zbuduj aplikację dla produkcji
RUN npm run build

# Zainstaluj serwer HTTP globalnie w kontenerze
RUN npm install -g serve

# Uruchom serwer HTTP, serwując zawartość z folderu build
CMD ["serve", "-s", "build", "-l", "5000"]

# Informuj Docker, że kontener nasłuchuje na porcie 5000
EXPOSE 80
