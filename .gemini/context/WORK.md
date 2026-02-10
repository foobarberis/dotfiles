# 3P Connect V4 - DevOps Infrastructure

This document provides a technical overview of the DevOps infrastructure and CI/CD workflows for the 3P Connect V4 project, designed for AI agents to quickly gain familiarity with the system.

## 1. Core DevOps Philosophy
- **Hybrid Infrastructure**: Orchestration and builds occur on Linux (GitLab CI), while deployments and specialized builds (installers, UI tests) target Windows environments.
- **Component-Based CI/CD**: Each service (Web, ETL, Report, Front) has its own lifecycle, but they are orchestrated centrally.
- **Automation First**: Heavy use of PowerShell for VM lifecycle management and component configuration.

## 2. Repository Overview (DevOps Perspective)
| Repository | Key Role | DevOps Tech Stack |
| :--- | :--- | :--- |
| **`3pc-devops`** | Central Hub | GitLab CI, Maven, PowerShell, PowerCLI, Telegraf/Choco |
| **`3pc-web-back`** | Core Backend | Maven (Java 21), SonarQube, BlackDuck |
| **`3pc-web-front`** | Core Frontend | Node/NPM (Angular), Maven (packaging) |
| **`3pc-installer`** | Packaging | Windows Runners, InnoSetup, Maven |
| **`3pc-test`** | Quality Gate | Robot Framework, Playwright, Windows Runners |
| **`3pc-antora`** | Documentation | Antora, Node, Rsync (Linux) |

## 3. CI/CD Workflows

### 3.1 GitLab CI (Modern)
The project leverages GitLab CI with modular pipeline includes.
- **Triggers**: Pipeline inputs allow manual execution of specific workflows (e.g., `upd_3pc`, `create_vm`).
- **VM Lifecycle**: Triggered from `3pc-devops`, uses `vmware/powerclicore` and `create_vm.ps1` to clone templates in vSphere.
- **Component Updates**:
    1. Maven downloads artifacts from Artifactory via specific profiles (`-Pdownload-web-back`, etc.).
    2. Files are transferred via `scp` to the target Windows VM.
    3. Remote PowerShell scripts (`update_properties.ps1`) configure the application.
    4. WinSW-managed services are restarted via SSH.

### 3.2 Jenkins (Legacy/Specific Deployment)
Still used for matrix-based deployments to specific internal IP ranges.
- **Targets**: `10.7.131.51`, `10.7.130.128`.
- **Logic**: Handles artifact fetching from Artifactory using `rtDownload`, service management via `sshCommand`, and file transfers via `sshPut`.
- **Delays**: Implements wait times (e.g., 90s for Hub) to ensure service dependencies are met.

## 4. Key Infrastructure Components
- **Artifact Management**: JFrog Artifactory (`bmxrdartifactoryfr.jfrog.io`).
- **Secret Management**:
    - **HashiCorp Vault**: Runtime secret management.
    - **GitLab Secure Files**: CI-time delivery of `settings.xml` and SSH keys (`id_ed25519`).
- **Service Management**: **WinSW** wraps Java JARs as Windows Services (e.g., `bmx3pConnectServer`, `bmx3pConnectEtl`).
- **Reverse Proxy**: Apache HTTP Server (Port 443).

## 5. Automated Testing Integration (`3pc-test`)
- **Execution**: Runs on dedicated Windows runners.
- **Stack**: Python-based Robot Framework with Playwright.
- **Feedback Loop**: Extracts data from `output.xml`, generates SWRS reports, and can send email notifications with attached logs.
- **Monitoring**: Integrates with a monitoring server (Prometheus/Grafana via InfluxDB/Telegraf).

## 6. Networking & Security
- **Inbound**: Port 443 (HTTPS/WSS) only.
- **Internal**: Heavy use of loopback (localhost) for inter-service communication (ActiveMQ on 8883, RServe on 6311, etc.).
- **Authentication**: Skeeper (CAS/OpenDJ) integrated with Customer Active Directory.

## 7. Operational Tooling
- **`3pc-devops/tools/delete_job_artifacts.sh`**: Cleanup utility for GitLab.
- **`3pc-devops/monitoring/telegraf-chocolatey/`**: Custom monitoring agent packaging.
- **`update_properties.ps1`**: Dynamic configuration of `application.yml` and other properties on target servers.


# Instruction for AI Agents

- You SHALL use Antora (AsciiDoc) for all project documentation in `3pc-antora` and SHALL NOT use Markdown in that specific repository.
