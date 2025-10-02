# ---- Stage 1: Flutter build ----
FROM debian:bookworm-slim AS build

ENV FLUTTER_VERSION=3.35.4
ENV FLUTTER_HOME=/usr/local/flutter
ENV PATH="$FLUTTER_HOME/bin:$PATH"

RUN apt-get update && apt-get install -y \
    git curl unzip xz-utils zip libglu1-mesa \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/flutter/flutter.git -b $FLUTTER_VERSION $FLUTTER_HOME
RUN flutter config --enable-web

WORKDIR /app/frontend

# Nur pubspec reinwerfen und Abhängigkeiten laden
COPY frontend/pubspec.* ./
RUN flutter pub get

# Jetzt erst den Rest
COPY frontend/. .

# Sicherheitshalber: Alte Artefakte killen
RUN rm -rf .dart_tool build
RUN flutter clean
RUN flutter pub get
RUN flutter build web --release

# ---- Stage 2: Backend (NodeJS + Express) ----
FROM node:20-alpine

WORKDIR /app

# Dependencies installieren
COPY backend/package*.json ./
RUN npm install --production

# Source rein
COPY backend/tsconfig.json ./
COPY backend/src ./src

# Flutter Build-Ergebnisse ins Backend public-Verzeichnis legen
COPY --from=flutter_builder /app/frontend/build/web ./public

# Build
RUN npm run build

EXPOSE 3000
CMD ["npm", "start"]
