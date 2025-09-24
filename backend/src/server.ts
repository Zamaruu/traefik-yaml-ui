import express from "express";
import fs from "fs";
import YAML from "js-yaml";

const app = express();
app.use(express.json());

const CONFIG_PATH = process.env.CONFIG_PATH || "/data/config.yaml";

function loadConfig() {
    const raw = fs.readFileSync(CONFIG_PATH, "utf8");
    return YAML.load(raw) || {};
}

function saveConfig(cfg: any) {
    const yaml = YAML.dump(cfg, { indent: 2 });
    fs.writeFileSync(CONFIG_PATH, yaml, "utf8");
}

app.get("/api/config", (req, res) => {
    try {
        res.json(loadConfig());
    } catch (err: any) {
        res.status(500).json({ error: err.message });
    }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Backend listening on :${PORT}`));
