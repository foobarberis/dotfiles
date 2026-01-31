# Professional Context: bioMérieux (3P® CONNECT V4)

This document serves as the primary context for the 3P® CONNECT V4 project,
incorporating architecture, tech stack, CI/CD infrastructure, and operational
procedures.

## 1. Role & Identity
- **Position:** DevOps Intern.
- **Team:** 3P® CONNECT V4.
- **Environment:** Windows 11 with Ubuntu 24.04 (WSL).
- **Core Principles:** Clean code, KISS, Security by Design, Automation,
  Declarative/IaC, Testing as Documentation.

## 2. Project Overview: 3P® CONNECT V4
A software solution for pharmaceutical companies to digitize, execute, and
trace environmental monitoring (microbiology) workflows. It manages the
lifecycle of samples (petri dishes) from definition to incubation and analysis.
- **Target Domain:** Environmental Control (Pharma).
- **Key Integrations:** 3P® STATION (Incubators), LIMS, Environmental
  Monitoring (EM) systems, VITEK® 2/MS.
- **Hosting:** On-premise (Customer Datacenter) on Virtual Machines.
- **Support:** Remote access via VILINK.

## 3. System Architecture
Transitioning from legacy layered to **Hexagonal Architecture (Ports &
Adapters)** to decouple business logic from infrastructure.

### Core Components (Spring Boot)
1.  **3P Web Server:** Exposes REST API & WebSockets. Handles core logic
    (Sampling, Maps, Users, Incubation workflow).
2.  **3P ETL:** Listens to ActiveMQ messages, transforms data, and populates
    a flat-design database for reporting.
3.  **3P Report:** Generates PDF reports using RServe and R scripts.

### "Core Assets" (Common Platform v9.0.0)
The solution relies on the *SWCA Common Platform* shared internal services:
- **Skeeper (CAS/OpenDJ):** User authentication (proxies to Customer AD).
- **Vault (HashiCorp):** Secret management (no plain-text credentials).
- **Audit Trail:** Centralized logging of sensitive actions.
- **BCI Connect (Mirth Connect):** Connectivity engine for LIMS, 3P Stations,
  and external EM systems.

### Directory Structure (Hexagonal)
- `module/adapter/inbound`: REST Controllers, MQTT Consumers.
- `module/adapter/outbound`: Repositories, External API clients.
- `module/application`: Infrastructure/Framework logic.
- `module/domain`: Pure business logic (Entities, Rules). **No Spring.**

## 4. Technology Matrix
| Category | Component / Version | Detail |
| :--- | :--- | :--- |
| **Backend** | **Java 21** (Eclipse Temurin) | Spring Boot 3.x |
| **Frontend** | **Angular 19**, Node.js 20/22 | Web UI |
| **Database** | MS SQL Server (2019/2022) | Application Data |
| **Database** | PostgreSQL | Audit Trail (via Platform) |
| **Messaging** | **ActiveMQ** (Classic) | Async Comm (Single point of failure) |
| **Reporting** | **R (4.4.2)**, RServe (1.8-11) | Statistical Analysis |
| **Formatting** | TinyTeX (2025.03), Pandoc (3.6.3) | PDF Rendering |
| **Reverse Proxy**| Apache HTTP Server | Security entry point (Port 443) |
| **Service Wrapper**| **WinSW (2.3.0)** | Wraps JARs as Windows Services |
| **Target OS** | Windows Server 2019 / 2022 | Production Environment |

## 5. DevOps & CI/CD Infrastructure
Primary automation is handled via **GitLab CI/CD**, with **Jenkins** used for
specific deployment targets.

### Core Repositories
- **`3pc-devops`**: Central hub. Contains VM creation/update pipelines,
  GitLab runner configs, Dockerfiles, and documentation.
- **`3pc-web-back` / `3pc-web-front`**: Main application source.
- **`3pc-installer`**: InnoSetup packaging logic.
- **`3pc-test`**: Automated testing (Robot Framework).
- **`3pc-docs` / `3pc-antora`**: Documentation and site generation.
- **`3pc-rfolder` / `3pc-simu`**: Supporting components and simulators.

### GitLab CI/CD Pipeline
- **Runners:** Mixed Linux (Java/Maven/Node/Antora) and Windows (Installer/Test).
- **Stages:** `prepare` -> `dependencies` -> `build` -> `analyze` -> `publish`.
- **Docker Images:**
    - `maven:3.9.9-eclipse-temurin-21-alpine` (Linux Build)
    - `node:20-alpine` (Frontend Build)
    - `windows-servercore:ltsc2022` (Installer Build)
    - `maven-windows`: Windows Server Core + JDK 21 + Maven 3.9.9 (via Chocolatey).
    - `vmware/powerclicore`: vSphere interactions.
- **Secure Files:** Manages `settings.xml` and SSH keys (`id_ed25519`).
- **Includes:** Leverages `bmx-common-pipeline` for modularity.

### Jenkins (Deployment/Legacy)
- Defines matrix-based deployment to specific Windows instances.
- **Features:** Artifact fetching from Artifactory, service stop/start, SCP.
- **Logic:** Specific wait times (e.g., 90s for Hub to wait for Web) and
  version validation (Snapshot vs. Release).

### Artifact & Dependency Management
- **JFrog Artifactory**: `bmxrdartifactoryfr.jfrog.io`.
- **Types:** Maven JARs, NPM packages, Docker images, PowerShell/NuGet
  (`bmx-powercli-library`).
- **Chocolatey**: Used for COTS (R, RServe) bundled in the offline installer.

## 6. Deployment & Operations
### Installation Logic
- **Mechanism:** Fresh install only (Common Platform V6 -> V9 upgrade path).
- **Installer:** Generated via **InnoSetup (6.2.0)**.
- **Dependencies:** Bundled for **offline** installation at customer sites.

### Windows Services (Runtime)
Managed via WinSW:
- `3pConnectServer` (Web), `3pConnectEtl` (ETL), `3pConnectReport` (PDF),
  `3pConnectRserve` (R).
- *Dependency on:* `bMxMirthConnectServer`, `bMxCAS`, `bMxAuditTrailServer`,
  `bMxVaultServer`.

### Network & Security (TLS 1.2/1.3)
- **External Port:** `443` (HTTPS/WSS) is the **only** inbound port.
- **Internal Loopback (Localhost only):**
    - `8883`: ActiveMQ (MQTT over TLS)
    - `15123`: 3P UI (Served by Apache locally)
    - `8443`: 3P Web Server API
    - `7443`: 3P ETL
    - `8463`: 3P Report
    - `6311`: RServe (TCP)
    - `15161`: ActiveMQ Management UI

### Infrastructure & Resilience
- **Model:** Single-server vertical scaling (No HA/Clustering).
- **Requirements:** 16-32 vCPU, 16-32 GB RAM, 80GB+ Disk.
- **Backup:**
    - *Audit Trail/Config:* Daily/Weekly via Platform tools.
    - *App Database (SQL Server):* Customer responsibility.

## 7. Automated Testing (`3pc-test`)
- **Framework:** **Robot Framework** with Playwright/Selenium.
- **Types:** UI/API Regression, Endurance, Capacity, Load Testing (JMeter).
- **Details:** Runs on Windows runners; extracts SWRS data; email notifications.

## 8. Documentation & Tooling
- **Antora:** Aggregates documentation; deployed via `rsync` to `10.82.130.217`.
- **PDF Generation:** Architecture docs via Maven + Graphviz.
- **Key Scripts:**
    - `create_vm.ps1` (PowerShell/vSphere)
    - `update_properties.ps1` (Component configuration)
- **Monitoring:** Prometheus, Grafana.