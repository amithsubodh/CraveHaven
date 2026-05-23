<![CDATA[<div align="center">

# 🍔 CraveHaven

### A Full-Stack Food Delivery Web Application

[![CI Pipeline](https://github.com/amithsubodh/CraveHaven/actions/workflows/ci.yml/badge.svg)](https://github.com/amithsubodh/CraveHaven/actions)
![Node.js](https://img.shields.io/badge/Node.js-18-339933?logo=node.js&logoColor=white)
![React](https://img.shields.io/badge/React-18-61DAFB?logo=react&logoColor=black)
![MySQL](https://img.shields.io/badge/MySQL-8-4479A1?logo=mysql&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Compose-2496ED?logo=docker&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?logo=terraform&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Helm-326CE5?logo=kubernetes&logoColor=white)

---

*Browse restaurants, explore menus, add items to your cart, and manage orders — all from a sleek, modern interface backed by a robust DevOps pipeline.*

</div>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Architecture](#-architecture)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [API Reference](#-api-reference)
- [DevOps & CI/CD](#-devops--cicd)
- [Monitoring](#-monitoring)
- [Environment Variables](#-environment-variables)
- [License](#-license)

---

## 🔍 Overview

**CraveHaven** is a full-stack food delivery application built with a React frontend and an Express.js/Node.js backend, powered by a MySQL database through Sequelize ORM. The project demonstrates a production-grade DevOps workflow using Docker, Terraform, Kubernetes (Helm), Ansible, GitHub Actions CI/CD, and Prometheus + Grafana monitoring.

---

## ✨ Features

| Category | Details |
|---|---|
| 🏠 **Home Page** | Hero banner, restaurant cards, food categories, and popular brands |
| 🍽️ **Restaurant Browsing** | View all restaurants with ratings, specialties, and pricing |
| 📖 **Menu Details** | Drill into a restaurant to see its full menu with images |
| 🛒 **Cart Management** | Add, update quantity, and remove items from the cart |
| 👤 **User Authentication** | Sign up and log in functionality |
| 📬 **Contact Form** | Submit inquiries via a contact form |
| ❤️ **Health Check** | Built-in `/health` endpoint for container orchestration |

---

## 🛠 Tech Stack

### Frontend

| Technology | Purpose |
|---|---|
| **React 18** | UI library for building component-driven interfaces |
| **React Router v6** | Client-side routing and navigation |
| **Axios** | HTTP client for API communication |
| **Formik** | Form handling and validation |
| **Nginx** | Production static file server (Docker) |

### Backend

| Technology | Purpose |
|---|---|
| **Node.js 18** | JavaScript runtime |
| **Express.js 4** | Web framework for REST API |
| **Sequelize 6** | ORM for MySQL database interactions |
| **MySQL2** | MySQL database driver |
| **CORS** | Cross-Origin Resource Sharing middleware |
| **dotenv** | Environment variable management |
| **Nodemon** | Hot-reload during development |

### Database

| Technology | Purpose |
|---|---|
| **MySQL 8** | Relational database for persistent storage |
| **SQL Init Script** | Pre-seeds the database with schema and sample data |

### DevOps & Infrastructure

| Technology | Purpose |
|---|---|
| **Docker** | Containerization with multi-stage builds |
| **Docker Compose** | Multi-container local orchestration |
| **Terraform** | Infrastructure as Code (Docker provider) |
| **Ansible** | Configuration management and automation |
| **Helm** | Kubernetes package manager |
| **Kubernetes** | Container orchestration (manifests included) |
| **GitHub Actions** | CI/CD pipeline |
| **Prometheus** | Metrics collection and monitoring |
| **Grafana** | Metrics visualization and dashboards |

---

## 🏗 Architecture

```
┌──────────────────────────────────────────────────────────┐
│                     GITHUB ACTIONS CI                    │
│          (Lint → Build → Validate → Docker Build)        │
└──────────────────────┬───────────────────────────────────┘
                       │
         ┌─────────────▼──────────────┐
         │     Docker Compose /       │
         │     Terraform / Helm       │
         └─────────────┬──────────────┘
                       │
    ┌──────────────────┼──────────────────┐
    │                  │                  │
    ▼                  ▼                  ▼
┌────────┐      ┌───────────┐      ┌──────────┐
│Frontend│      │  Backend  │      │  MySQL 8 │
│React 18│─────▶│Express.js │─────▶│ Database │
│ :3000  │ API  │  :3001    │  ORM │  :3306   │
│(Nginx) │      │(Sequelize)│      │          │
└────────┘      └───────────┘      └──────────┘
                      │
              ┌───────┴────────┐
              ▼                ▼
        ┌──────────┐    ┌──────────┐
        │Prometheus│    │ Grafana  │
        │(Metrics) │───▶│(Dashbrd) │
        └──────────┘    └──────────┘
```

---

## 📁 Project Structure

```
CraveHaven/
├── .github/
│   └── workflows/
│       └── ci.yml                  # GitHub Actions CI pipeline
├── ansible/
│   ├── inventory.ini               # Ansible host inventory
│   └── playbook.yml                # Automation playbook (Terraform + Docker)
├── client/                         # ── React Frontend ──
│   ├── Dockerfile                  # Multi-stage build (Node → Nginx)
│   ├── nginx.conf                  # Nginx config for SPA routing
│   ├── package.json                # Frontend dependencies
│   ├── public/                     # Static public assets
│   └── src/
│       ├── App.js                  # Root component with routing
│       ├── index.js                # React entry point
│       ├── components/
│       │   ├── Header.js           # Navigation header
│       │   ├── Footer.js           # Page footer
│       │   ├── ResCards.js          # Restaurant card grid
│       │   ├── Res.js              # Individual restaurant card
│       │   ├── FoodTypes.js        # Food category section
│       │   └── FoodBrands.js       # Popular brands section
│       ├── pages/
│       │   ├── Home.js             # Landing page
│       │   ├── ResDetail.js        # Restaurant detail & menu
│       │   ├── Cart.js             # Shopping cart page
│       │   ├── SignUp.js           # User registration
│       │   ├── Login.js            # User login
│       │   ├── Contact.js          # Contact form
│       │   ├── About.js            # About page
│       │   └── assets/
│       │       └── styles.css      # Global stylesheet
│       └── images/                 # Static image assets
├── server/                         # ── Express.js Backend ──
│   ├── Dockerfile                  # Multi-stage build (Builder → Production)
│   ├── index.js                    # Server entry point & route mounting
│   ├── package.json                # Backend dependencies
│   ├── config/
│   │   └── config.json             # Sequelize DB configuration
│   ├── models/
│   │   ├── index.js                # Sequelize initialization & model loader
│   │   ├── Reastaurant.js          # Restaurant model
│   │   ├── MenuItem.js             # MenuItem model
│   │   ├── Users.js                # Users model
│   │   ├── Cart.js                 # Cart model
│   │   └── Contact.js              # Contact model
│   ├── routes/
│   │   ├── Restaurant.js           # Restaurant API endpoints
│   │   ├── Users.js                # Auth API endpoints (signup/login)
│   │   ├── Cart.js                 # Cart CRUD endpoints
│   │   └── Contact.js              # Contact form endpoints
│   └── init-db/
│       └── dbms.sql                # Database schema & seed data
├── cravehaven/                     # ── Helm Chart ──
│   ├── Chart.yaml                  # Helm chart metadata
│   ├── values.yaml                 # Default Helm values
│   └── templates/
│       ├── backend-deployment.yaml
│       ├── backend-service.yaml
│       ├── frontend-deployment.yaml
│       ├── frontend-service.yaml
│       ├── mysql-statefulset.yaml
│       ├── mysql-service.yaml
│       ├── mysql-secret.yaml
│       └── ingress.yaml
├── terraform/
│   └── main.tf                     # Docker provider: network, MySQL, backend, frontend
├── docker-compose.yml              # Local multi-container orchestration
├── grafana-pvc.yaml                # Grafana PersistentVolumeClaim
├── grafana-values.yaml             # Grafana Helm values override
├── prometheus-values.yaml          # Prometheus Helm values override
└── .gitignore
```

---

## 🚀 Getting Started

### Prerequisites

| Tool | Version |
|---|---|
| **Node.js** | ≥ 18.x |
| **npm** | ≥ 9.x |
| **Docker** & **Docker Compose** | Latest |
| **Terraform** | ≥ 1.0 *(optional – for IaC deployment)* |
| **Helm** | ≥ 3.0 *(optional – for Kubernetes deployment)* |
| **Ansible** | ≥ 2.9 *(optional – for automation)* |

### Option 1 — Docker Compose (Recommended)

The fastest way to spin up the entire stack:

```bash
# Clone the repository
git clone https://github.com/amithsubodh/CraveHaven.git
cd CraveHaven

# Start all services (MySQL + Backend + Frontend)
docker compose up --build
```

| Service | URL |
|---|---|
| Frontend | [http://localhost:3000](http://localhost:3000) |
| Backend API | [http://localhost:3001](http://localhost:3001) |
| MySQL | `localhost:3306` |

### Option 2 — Local Development

**1. Start the database**

```bash
docker compose up db
```

**2. Start the backend**

```bash
cd server
npm install

# Create a .env file
cat <<EOF > .env
DB_HOST=localhost
DB_USER=devuser
DB_PASSWORD=devpassword
DB_NAME=dbms
DB_DIALECT=mysql
PORT=3001
EOF

npm start
```

**3. Start the frontend**

```bash
cd client
npm install
npm start
```

The React dev server will start at [http://localhost:3000](http://localhost:3000).

### Option 3 — Terraform

```bash
# Build Docker images first
docker build -t backend ./server
docker build -t frontend ./client

# Deploy with Terraform
cd terraform
terraform init
terraform apply -auto-approve
```

### Option 4 — Ansible (Full Automation)

```bash
cd ansible
ansible-playbook -i inventory.ini playbook.yml
```

### Option 5 — Kubernetes with Helm

```bash
# Install the Helm chart
helm install cravehaven ./cravehaven

# Verify pods
kubectl get pods
```

---

## 📡 API Reference

Base URL: `http://localhost:3001`

### Restaurants

| Method | Endpoint | Description |
|---|---|---|
| `GET` | `/api/restaurants` | Fetch all restaurants |
| `GET` | `/api/restaurants/:id` | Fetch menu items for a restaurant |
| `POST` | `/api/restaurants` | Create a new restaurant |

### Users (Authentication)

| Method | Endpoint | Description |
|---|---|---|
| `POST` | `/api/signup` | Register a new user |
| `POST` | `/api/signup/login` | Log in an existing user |

### Cart

| Method | Endpoint | Description |
|---|---|---|
| `GET` | `/api/carts` | Get all cart items |
| `POST` | `/api/carts` | Add an item to the cart |
| `PUT` | `/api/carts/:id` | Update item quantity |
| `DELETE` | `/api/carts/:id` | Remove an item from the cart |

### Contact

| Method | Endpoint | Description |
|---|---|---|
| `GET` | `/api/contact` | Get all contact submissions |
| `POST` | `/api/contact` | Submit a contact form |

### Health

| Method | Endpoint | Description |
|---|---|---|
| `GET` | `/health` | Health check (returns `{ status: "OK" }`) |

---

## ⚙ DevOps & CI/CD

### GitHub Actions CI Pipeline

The CI pipeline (`.github/workflows/ci.yml`) runs on every push and pull request to `main`:

```
┌─────────────┐    ┌──────────────┐    ┌──────────────┐    ┌────────────┐
│  Checkout    │───▶│ Setup Node   │───▶│   Install &  │───▶│  Build     │
│  Repository  │    │  v24 + Cache │    │   Validate   │    │  Frontend  │
└─────────────┘    └──────────────┘    │  Backend     │    └────────────┘
                                       └──────────────┘
```

**Pipeline Steps:**
1. **Checkout** — Clones the repository
2. **Setup Node.js** — Configures Node 24 with npm caching
3. **Install Server Dependencies** — `npm install` in `/server`
4. **Validate Backend Syntax** — `node --check index.js`
5. **Install Client Dependencies** — `npm install` in `/client`
6. **Build Frontend** — `npm run build` to create production bundle

> **Note:** Docker image build & push to Docker Hub is configured but currently commented out. Uncomment the `docker-build` job and add `DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN` secrets to enable it.

### Terraform

Uses the **kreuzwerker/docker** provider to manage:
- A Docker bridge network (`tf-network`)
- MySQL 8 container with init script volume mount
- Backend container connected to the app network
- Frontend container serving the React build via Nginx

### Ansible

The playbook automates the full deployment:
1. Runs `terraform apply -auto-approve`
2. Verifies running containers
3. Ensures backend, frontend, and MySQL containers are started

### Helm / Kubernetes

The `cravehaven/` Helm chart deploys:
- **Frontend** — Deployment + ClusterIP Service
- **Backend** — Deployment + ClusterIP Service with MySQL env vars
- **MySQL** — StatefulSet + Service + Secret
- **Ingress** — Optional ingress resource for external access

---

## 📊 Monitoring

### Prometheus

Lightweight configuration (`prometheus-values.yaml`):
- AlertManager, PushGateway, kube-state-metrics, and NodeExporter disabled
- Server resource limits: **250Mi–400Mi memory**, **150m–250m CPU**

```bash
helm install prometheus prometheus-community/prometheus -f prometheus-values.yaml
```

### Grafana

Persistent storage via a 1Gi PVC (`grafana-pvc.yaml` + `grafana-values.yaml`):

```bash
kubectl apply -f grafana-pvc.yaml
helm install grafana grafana/grafana -f grafana-values.yaml
```

---

## 🔐 Environment Variables

### Backend (`server/.env`)

| Variable | Description | Default |
|---|---|---|
| `DB_HOST` | MySQL host address | `db` |
| `DB_USER` | MySQL username | `devuser` |
| `DB_PASSWORD` | MySQL password | `devpassword` |
| `DB_NAME` | Database name | `dbms` |
| `DB_DIALECT` | Sequelize dialect | `mysql` |
| `PORT` | Server listening port | `3001` |

### Frontend (`client/.env`)

| Variable | Description | Default |
|---|---|---|
| `REACT_APP_API_URL` | Backend API base URL | `http://localhost:3001` |

---


<div align="center">

**Built with 🧠 by [amithsubodh](https://github.com/amithsubodh)**

</div>
]]>