const express = require("express");
const client = require("prom-client");

const app = express();
const PORT = process.env.PORT || 3000;

const register = new client.Registry();

client.collectDefaultMetrics({
    register
});

const httpRequests = new client.Counter({
    name: "node_app_http_requests_total",
    help: "Total number of HTTP requests"
});

register.registerMetric(httpRequests);

app.get("/", (req, res) => {

    httpRequests.inc();

    res.status(200).json({
        application: "Node.js Monitoring App",
        status: "Running",
        metrics: "/metrics",
        health: "/health"
    });

});


app.get("/health", (req, res) => {

    res.status(200).send("OK");

});


app.get("/metrics", async (req, res) => {

    res.set("Content-Type", register.contentType);

    res.end(await register.metrics());

});

app.listen(PORT, () => {

    console.log(`Server running on port ${PORT}`);

});