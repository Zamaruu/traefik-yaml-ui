# Traefik YAML UI

A modern web-based interface for managing **Traefik YAML configurations**.  
Traefik YAML UI reads your existing `traefik.yaml` file, visualizes it in an intuitive web UI, and allows you to edit configurations without manually touching YAML.

> 🚧 Writing back changes to the YAML file is currently in development and will be included in **v1.0.0**.

---

## 🧩 Features

- 🔍 **Visualize Traefik configurations** directly from YAML  
- 💡 **Understand routes, services, and middlewares** at a glance  
- 🧠 **Smart YAML parser** via a lightweight Dart Shelf API  
- 🌐 **Flutter Web UI** for a fast and responsive experience  
- 💾 **Built-in SQLite database** for user and log management  
- 🐳 **Docker-ready deployment** (single image for both API and UI)

---

## 🏗️ Project Structure

This repository is a **monorepo** containing both the backend (API) and frontend (Web UI).


## 🧠 Architecture Overview

┌────────────────────────────┐

│ Flutter Web UI │

│ (traefik-yaml-ui/frontend) │

└───────────────▲────────────┘

│ REST API (JSON)

▼
┌────────────────────────────┐

│ Dart Shelf API │

│ (traefik-yaml-ui/backend) │

│ - Reads traefik.yaml │

│ - Parses & serves config │

│ - SQLite for users/logs │

└───────────────▲────────────┘

│

▼

traefik.yaml file


---

## 💻 Development Setup

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (>=3.x)
- [Dart SDK](https://dart.dev/get-dart)
- [SQLite](https://www.sqlite.org/download.html)
- [Docker](https://docs.docker.com/get-docker/) *(optional for containerized dev)*

---

### 1️⃣ Clone the repository
```bash
git clone https://github.com/Zamaruu/traefik-yaml-ui.git
cd traefik-yaml-ui
```

### 2️⃣ Run the API locally
```bash
cd api
dart pub get
dart run bin/server.dart
```

By default, the API runs on http://localhost:8080

### 3️⃣ Run the Web App locally
```bash
cd web
flutter pub get
flutter run -d chrome
```

This starts the Flutter web app on http://localhost:5000 (or a similar local port).
Make sure the API is running so the web app can fetch the YAML configuration.

### 🐳 Docker Deployment

You can run the entire stack as a single container:
```bash
docker run -d \
  --name traefik-yaml-ui \
  -p 8080:8080 \
  -v /path/to/traefik.yaml:/app/traefik.yaml \
  ghcr.io/Zamaruu/traefik-yaml-ui:latest
```

| Variable         | Default                  | Description               |
| ---------------- | ------------------------ | ------------------------- |
| `PORT`           | `8080`                   | API + Web listening port  |
| `DB_PATH`        | `./data/database.sqlite` | Path to SQLite database   |
| `TRAEFIK_CONFIG` | `./traefik.yaml`         | Path to Traefik YAML file |

The container automatically serves:
- The API under /api
- The Web UI under /

Example:
```bash
http://localhost:8080 → Web Interface  
http://localhost:8080/api/config → YAML data as JSON
```

### 🧪 Future Roadmap

- ✅ YAML parsing and visualization
- 🕹️ Editable UI components
- 💾 YAML write-back support (v1.0.0)
- 👥 Multi-user management
- 🪵 Advanced logging and history tracking

### 🤝 Contributing

Contributions are welcome!
Please open an issue or pull request if you’d like to:
- Improve the UI/UX
- Add API routes
- Enhance YAML validation

### 🧾 License

This project is licensed under the MIT License.
See LICENSE for more details.

### 📦 Docker Image

Published on GitHub Container Registry:
👉 ghcr.io/Zamaruu/traefik-yaml-ui:latest

### 🧍‍♂️ Maintainer

Zamaruu
GitHub: [@Zamaruu](https://github.com/Zamaruu)