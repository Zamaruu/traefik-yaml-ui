import dotenv from "dotenv";
import express from "express";
import configRouter from "./controller/config.controller";

dotenv.config();

const app = express();
const port = process.env.PORT || 3000;
const path = process.env.TRAEFIK_CONFIG_PATH;

if (!path) {
    throw new Error("TRAEFIK_CONFIG_PATH not set in .env file!");
}

export const configPath = path;

app.use("/config", configRouter);

// Beispiel-Endpunkt mit Typen

app.listen(port, () => {
    console.log(`✅ Server läuft auf http://localhost:${port}`);
});
