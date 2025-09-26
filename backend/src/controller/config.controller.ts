import {NextFunction, Router} from "express";
import {Middleware, TraefikRouter, ServersTransport, Service, TraefikConfig} from "../models/types";
import fs from "fs";
import yaml from "js-yaml";
import {configPath} from "../server";

function loadConfig(path: string): TraefikConfig {
    const raw = yaml.load(fs.readFileSync(path, "utf8")) as any;

    const http = raw.http;

    const middlewares: Middleware[] = Object.entries(http.middlewares || {}).map(
        ([name, value]: [string, any]) => ({ name, ...value })
    );

    const serversTransports: ServersTransport[] = Object.entries(http.serversTransports || {}).map(
        ([name, value]: [string, any]) => ({ name, ...value })
    );

    const services: Service[] = Object.entries(http.services || {}).map(
        ([name, value]: [string, any]) => ({ name, ...value })
    );

    const routers: TraefikRouter[] = Object.entries(http.routers || {}).map(
        ([name, value]: [string, any]) => ({ name, ...value })
    );

    return {
        http: {
            middlewares,
            serversTransports,
            services,
            routers,
        },
    };
}

function saveConfig(config: TraefikConfig, path: string) {
    const http = config.http;

    const middlewares = Object.fromEntries(
        (http.middlewares || []).map(m => {
            const { name, ...rest } = m;
            return [name, rest];
        })
    );

    const serversTransports = Object.fromEntries(
        (http.serversTransports || []).map(t => {
            const { name, ...rest } = t;
            return [name, rest];
        })
    );

    const services = Object.fromEntries(
        (http.services || []).map(s => {
            const { name, ...rest } = s;
            return [name, rest];
        })
    );

    const routers = Object.fromEntries(
        (http.routers || []).map(r => {
            const { name, ...rest } = r;
            return [name, rest];
        })
    );

    const yamlObj = { http: { middlewares, serversTransports, services, routers } };
    const yamlStr = yaml.dump(yamlObj);

    fs.writeFileSync(path, yamlStr, "utf8");
}

const router = Router();

router.get("/", (req , res) => {

    try {
        const parsed = loadConfig(configPath);

        res.json(parsed);
    } catch (err) {
        console.error("Fehler beim Laden der Config:", err);
        res.status(500).json({ error: "Konnte Config nicht laden" });
    }
})


export default router;