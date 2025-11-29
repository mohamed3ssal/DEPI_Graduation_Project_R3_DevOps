# DevOps Engineer — Monitoring a Containerized URL Shortener Webservice

This README is tailored specifically for the required graduation DevOps project. It reflects **your actual implementation**, where:

* **Prometheus, Grafana, and Node Exporter run directly on the Host (non-Docker)**
* **cAdvisor runs as a Docker container**
* **Custom Prometheus metrics are implemented inside the Backend Node.js code**
* **Backend + Frontend + Mongo DB run on Docker**

This document provides a full professional overview of the project, its weekly deliverables, architecture, monitoring setup, and API documentation.

---

# 📌 Project Overview

A complete DevOps project that builds, containerizes, and monitors a fully functional **URL Shortener Webservice**.

The project includes:

* A Dockerized URL Shortener Application (Backend + Frontend)
* Custom Prometheus Metrics
* Full Monitoring Stack (Prometheus, cAdvisor, Grafana)
* Alerting using Alertmanager
* Host-based metrics and dashboards

The goal is to produce a **production-like monitoring environment** running locally.

---

# 🗂️ Project Structure

```
DEPI_Graduation_Project_R3_DevOps/
│
├── backend/                 # Node.js URL Shortener + Custom Metrics
│   ├── Dockerfile
│   ├── package.json
│   └── src/
│
├── frontend/                # Web UI (React or similar)
│   ├── Dockerfile
│   └── src/
│
├── prometheus/              # Prometheus configs (Host-based)
│   └── prometheus.yml
│   
│
├── alertmanager/            # Alertmanager configs
│   ├── alertmanager.yml
│   ├── alerting.rules.yml
│   └── templates/
│
├── grafana/                 # Provisioning for Host Grafana
│   └── provisioning/
│       ├── datasources/
│       │   └── datasource.yml
│       └── dashboards/
│           └── urlshortener-dashboard.json
│
├── docker-compose.yml       # Runs backend, frontend, cAdvisor
│
└── README.md
```

---

# 🧪 Week 1 — Build & Containerize the URL Shortener

## ✅ Work Completed

* Developed URL Shortener API using **Node.js (Express)**.
* Implemented two main endpoints:

  * `POST /shorten` — Accepts long URL, returns short code
  * `GET /:code` — Redirects to long URL
* Added **SQLite database** for local storage.
* Created **Dockerfile** for backend and frontend.
* Wrote initial **docker-compose.yml** including:

  * backend (container)
  * frontend (container)
  * Mongo DB (container)

## 📦 Deliverables

✔ Fully functional URL Shortener
✔ Backend + Frontend Dockerized
✔ docker-compose.yml running containers successfully
✔ Redirect workflow tested and working

---

# 📈 Week 2 — Instrumenting with Custom Prometheus Metrics

## 🎯 Work Completed

Custom Prometheus metrics implemented using `prom-client` inside the backend:

* **Counter** → Number of URLs shortened
* **Counter** → Number of successful redirects
* **Counter** → Failed lookups (404)
* **Histogram** → Latency for `/shorten` requests
* **Histogram** → Latency for redirects

## 🔧 Prometheus Setup (Host-based)

Prometheus runs directly on the host and scrapes:

* Backend metrics → `http://<host-ip>:3000/metrics`
* Node Exporter (host machine metrics)
* cAdvisor (container performance)

## 📦 Deliverables

✔ `/metrics` endpoint exposed
✔ Prometheus scraping all metrics
✔ cAdvisor integrated into scrape configs
✔ Metrics visible in Prometheus UI

---

# 📊 Week 3 — Grafana Dashboard & Visualization

## 🎯 Work Completed

* Grafana running on the host (system service)
* Connected Grafana to Prometheus using provisioning
* Built a **custom dashboard** visualizing:

  * URL creation rate
  * Redirect rate
  * Total shortened URLs (stat panel)
  * 95th percentile request latency
  * 404 error rate
  * cAdvisor container metrics (CPU, Memory, Health)

## 📦 Deliverables

✔ Grafana integrated with Prometheus
✔ Professional dashboard created
✔ All custom metrics visualized in real time

---

# 🚨 Week 4 — Alerting, Persistence & Final Documentation

## 🎯 Work Completed

* Setup Alertmanager on the host
* Added meaningful alerts:

  * High 404 error rate
  * High latency
  * Backend down alerts
* Enabled persistent storage:

  * Mongo DB stored on host
  * Prometheus data stored under `/var/lib/prometheus`
  * Grafana data stored under `/var/lib/grafana`
* Performed complete restart tests:

  

# 🚀 Running the Entire Stack

## 1️⃣ Start Prometheus (Host)

Prometheus runs on the host machine to scrape backend, node exporter, and cAdvisor metrics.

```bash
sudo systemctl start prometheus
```

Or run manually:

```bash
prometheus --config.file=/etc/prometheus/prometheus.yml
```

---

## 2️⃣ Start Grafana (Host)

Grafana runs as a systemd service on the host.

```bash
sudo systemctl start grafana-server
```

Access Grafana locally on:

```
http://<host-ip>:3000
```

---

## 3️⃣ Start Node Exporter (Host)

Node Exporter exposes host machine metrics directly to Prometheus.

### As a systemd service (recommended):

```bash
sudo systemctl start node_exporter
```

### OR run it as a container with host networking:

```bash
docker run -d --name node_exporter --net=host --pid=host prom/node-exporter:latest
```

---

## 4️⃣ Start Backend + Frontend + MongoDB (Docker)

The application stack runs inside Docker using `docker-compose`.

### Start all application containers:

```bash
docker compose up --build -d
```

This starts:

* **Backend** (Node.js URL shortener + custom metrics)
* **Frontend** (React UI)
* **MongoDB** (Persistent database)

> ⚠️ **Note:** cAdvisor is *not* part of the docker-compose stack.
> You have already downloaded & run cAdvisor as a standalone Docker container outside docker-compose.

If cAdvisor is not running, start it manually:

```bash
docker run -d \
  --name=cadvisor \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8080:8080 \
  gcr.io/cadvisor/cadvisor:latest
```

---

📞 Contact

**Mohamed El-Sayed**
Email: **[mohamedassal52003@gmail.com](mailto:mohamedassal52003@gmail.com)**
