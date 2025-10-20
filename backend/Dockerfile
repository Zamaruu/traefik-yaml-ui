# -----------------------------
# 1️⃣ Build Stage
# -----------------------------
FROM dart:stable AS build

# Setze Arbeitsverzeichnis
WORKDIR /app

# Nur pubspec-Dateien zuerst kopieren (für Caching)
COPY pubspec.* ./

# Dependencies auflösen
RUN dart pub get

# Jetzt den Rest des Codes kopieren
COPY . .

# Erstelle ein kompiliertes AOT-Binary (für schnelle Starts)
RUN dart compile exe bin/server.dart -o bin/server

# -----------------------------
# 2️⃣ Runtime Stage (leichtgewichtig)
# -----------------------------
FROM scratch AS runtime

# Basis: Scratch (kein OS, nur Dart-Runtime)
COPY --from=build /runtime/ /runtime/
COPY --from=build /app/bin/server /app/bin/server

# Arbeitsverzeichnis
WORKDIR /app

# Standard-Port
EXPOSE 3000

# Startkommando
CMD ["/app/bin/server"]
