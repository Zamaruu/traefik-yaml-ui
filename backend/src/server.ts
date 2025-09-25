import fs from "fs";
import yaml from "js-yaml";
import dotenv from "dotenv";
import { TraefikConfig } from "./models/types";
import express, { Request, Response } from "express";

dotenv.config();

const app = express();
const port = process.env.PORT || 3000;
const configPath = process.env.TRAEFIK_CONFIG_PATH;

if (!configPath) {
    throw new Error("TRAEFIK_CONFIG_PATH not set in .env file!");
}

// Beispiel-Endpunkt mit Typen
app.get("/config", (req: Request, res: Response) => {
    try {
        const fileContent = fs.readFileSync(configPath, "utf8");
        const parsed = yaml.load(fileContent) as TraefikConfig;

        res.json(parsed);
    } catch (err) {
        console.error("Fehler beim Laden der Config:", err);
        res.status(500).json({ error: "Konnte Config nicht laden" });
    }
});

app.listen(port, () => {
    console.log(`✅ Server läuft auf http://localhost:${port}`);
});
