import express, { Request, Response } from "express";

const app = express();
const PORT = process.env.PORT || 3000;

// Beispiel-Endpunkt mit Typen
app.get("/api/hello", (req: Request, res: Response): void => {
    res.json({ message: "Hallo von der Express API mit TypeScript 🚀" });
});

app.listen(PORT, () => {
    console.log(`✅ Server läuft auf http://localhost:${PORT}`);
});
