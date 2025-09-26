# Web UI for [Traefik](https://traefik.io/) Configurations with [File Provider](https://doc.traefik.io/traefik/reference/routing-configuration/dynamic-configuration-methods/#enabling-the-file-provider)

> A simple to use web interface to create, update or delete routers, middlewares and services via the traefik dynamic config (file provider).

Just map the path of your existing `dynamic-config.yaml` to the app / the container and let the app do the rest for you. Create a user, so not everybody on your network can edit your proxy configuration and you are ready.

## Setup

This app is pre configured to just run alongside your pre-existing treafik instance. Just put it next to traefik in your `docker-compose.yaml`, map the path, set your ports and you will directly see your existing treafik configuration.

```yaml
# ToDo build pipeline & ghcr.io setup 
```

## Project Structure & Development

### Flutter Frontend

The web app in which you will work most of the time, is written in Flutter and Dart for web. It uses a combination of packages like riverpod, get-it and local-storage solution to deliver a smooth and snappy but also safe way to edit your traefik config so you or the app dont break you existing traefik instance.

### NodeJS Express Backend

A simple express backend solution which is mainly just a through station for the (de)serialized `dynamic-config.yaml`, validation and light sqlite database handling.