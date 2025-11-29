# DEPI Graduation Project — R3 DevOps

هذا المشروع يجمع بين Backend (Node.js)، Frontend، ونظام مراقبة متكامل (Prometheus + Node Exporter + Grafana) بالإضافة إلى Alertmanager. يهدف المشروع إلى توفير بنية قابلة للتشغيل محليًا أو على الخوادم باستخدام Docker Compose.

---

## 🎯 نظرة عامة

المشروع يحتوي على:

* Backend Node.js
* Frontend
* Prometheus لمراقبة المقاييس
* Node Exporter لمراقبة الموارد
* Grafana للـ Dashboards
* Alertmanager للتنبيهات

---

## 🗂️ هيكل المشروع

```
DEPI_Graduation_Project_R3_DevOps/
│
├── backend/
│   ├── Dockerfile
│   ├── package.json
│   └── src/
│
├── frontend/
│   ├── Dockerfile
│   └── src/
│
├── prometheus/
│   ├── prometheus.yml
│   └── alerting.rules.yml
│
├── alertmanager/
│   ├── alertmanager.yml
│   └── templates/
│
├── grafana/
│   └── provisioning/
│       ├── datasources/
│       │   └── datasource.yml
│       └── dashboards/
│           └── dashboard.json
│
└── docker-compose.yml
```

---

## 🚀 طريقة التشغيل

### 1️⃣ استنساخ المشروع

```
git clone https://github.com/mohamed3ssal/DEPI_Graduation_Project_R3_DevOps.git
cd DEPI_Graduation_Project_R3_DevOps
```

### 2️⃣ تشغيل المشروع باستخدام Docker Compose

```
docker compose up --build -d
```

### 3️⃣ التحقق من الحاويات

```
docker ps
```

---

## 🔧 أماكن الخدمات

* Backend → [http://localhost:3000](http://localhost:3000)
* Frontend → [http://localhost:8080](http://localhost:8080)
* Prometheus → [http://localhost:9090](http://localhost:9090)
* Node Exporter → [http://localhost:9100](http://localhost:9100)
* Grafana → [http://localhost:3001](http://localhost:3001)
* Alertmanager → [http://localhost:9093](http://localhost:9093)

---

## 📡 إعداد Prometheus

`prometheus/prometheus.yml` يحتوي على إعدادات Scraping وملفات التنبيه.

```
global:
  scrape_interval: 15s

rule_files:
  - "alerting.rules.yml"

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']

  - job_name: 'node_exporter'
    static_configs:
      - targets: ['node_exporter:9100']

  - job_name: 'backend'
    static_configs:
      - targets: ['backend:3000']
```

---

## 🔔 إعداد Alertmanager

`alertmanager/alertmanager.yml` يحتوي على إعداد إرسال التنبيهات.

```
global:
  resolve_timeout: 5m

route:
  receiver: 'team-email'

receivers:
- name: 'team-email'
  email_configs:
  - to: 'you@example.com'
    from: 'grafana@example.com'
    smarthost: 'smtp.example.com:587'
    auth_username: 'smtp_user'
    auth_password: 'smtp_password'
```

---

## 📊 إعداد Grafana Provisioning

### Datasource

`grafana/provisioning/datasources/datasource.yml`

```
apiVersion: 1
datasources:
  - name: Prometheus
    type: prometheus
    url: http://prometheus:9090
    access: proxy
    isDefault: true
```

### Dashboard Provider

`grafana/provisioning/dashboards/dashboard.yml`

```
apiVersion: 1
providers:
  - name: 'default'
    folder: ''
    type: file
    options:
      path: /etc/grafana/provisioning/dashboards
```

---

## 💾 استخراج Dashboards من Grafana

### من الواجهة GUI

Dashboard → Share → Export → Save to file

### من API

```
curl -H "Authorization: Bearer API_KEY" http://localhost:3000/api/dashboards/uid/UID
```

---

## 🛡️ GitHub Authentication

GitHub لا يقبل الباسورد → استخدم Personal Access Token أو SSH Key.

---

## 📞 تواصل

email: [mohamedassal52003@gmail.com](mailto:mohamedassal52003@gmail.com)
