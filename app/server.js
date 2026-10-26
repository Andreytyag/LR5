const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

app.get("/", (req, res) => {
  res.json({
    service: "myintegration-app",
    message: "Integration service is running",
    version: process.env.APP_VERSION || "1.0.0",
  });
});

app.get("/health", (req, res) => {
  res.status(200).json({ status: "ok" });
});

app.get("/api/orders/:id", (req, res) => {
  res.json({
    orderId: req.params.id,
    status: "confirmed",
    items: 2,
    total: 199.99,
  });
});

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server listening on port ${PORT}`);
});
