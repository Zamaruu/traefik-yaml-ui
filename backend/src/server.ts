import dotenv from "dotenv";
import express from "express";
import cors from "cors";
import configRouter from "./controller/config.controller";
import path from "path";

dotenv.config();

const app = express();
const port = process.env.PORT || 3000;
const envPath = process.env.TRAEFIK_CONFIG_PATH;

if (!envPath) {
    throw new Error("TRAEFIK_CONFIG_PATH not set in .env file!");
}

export const configPath = envPath;

// 🚀 CORS aktivieren (für alle Domains)
app.use(cors());

// Statische Flutter Dateien ausliefern
const __dirname = path.resolve();
app.use(express.static(path.join(__dirname, "public")));

// SPA Routing: Alle anderen Requests auf index.html umleiten
app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "public", "index.html"));
});

app.use("/config", configRouter);

// Beispiel-Endpunkt mit Typen

app.listen(port, () => {
    console.log(`✅ Server läuft auf http://localhost:${port}`);
});
