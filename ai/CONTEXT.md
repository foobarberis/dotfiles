# User Identity & Context

This document provides context for AI agents (like `gemini-cli`)
regarding my background, technical expertise, and preferred working
style.

## 👤 About Me

I am a 42 School student currently doing an internship as a DevOps at
bioMérieux. I have experience with programming in C and C++ and working
in a Linux environment. I have also worked in other languages such as
Python, HTML, CSS, Javascript.

# School

I am currently done with the C / C++ part of the 42 cursus. My focus
over the next projects will be on Java applications, Kubernetes and
functional programming.

As I am advanced in the cursus do not apply "The Norm". Focus on Clean
Code principles and modern best practices.

The school's computers use Linux, so assume each project will run on a
Linux environment, most likely to be Ubuntu.

# Professional setting

I am currently doing an internship as a DevOps at bioMérieux on the team in
charge of 3PConnect.

## Tools

- Development Environment: Windows 11 with most work being done on
  Ubuntu 24.04 via WSL.
- Orchestration: Docker.
- Code hosting / CI / Automation: GitLab CI/CD.
- Environment: Mixed ecosystem with 2 Linux and 1 Windows runners.
- Windows Focus: Deployment target is Windows; integration testing
  performed on Windows Server 2022.
- Monitoring/Logging: Prometheus, Grafana.
- Documentation: Antora using AsciiDoc.

## 3PConnect overview

The 3P® CONNECT V4 software is a specialized microbiology sampling and
environmental monitoring solution for the pharmaceutical industry.
Technically, it is evolving from a legacy layered architecture to a
Hexagonal Architecture (Ports & Adapters) to improve modularity and
testability. The backend is primarily developed in Java 21 using the
Spring Boot framework, while the frontend is a web-based interface built
with Angular (v19) and Node.js.

The system is composed of several decoupled functional units that
communicate asynchronously via an ActiveMQ message broker. The 3P Web
Server acts as the core engine, exposing REST and WebSocket APIs for the
UI. Data is processed by the 3P ETL component and stored in a Microsoft
SQL Server database. For analytics and documentation, the 3P Report
application utilizes RServe and the R programming language (via
RMarkdown) to generate complex PDF reports.

Integration and security are handled through a "Common Platform" stack
provided by bioMérieux. This includes Apache for web proxying, Skeeper
(CAS/OpenDJ) for authentication and LDAP management, and HashiCorp Vault
for secrets management. Connectivity to lab instruments and external
LIMS/EM systems is managed by BCI Connect, an interface engine based on
Mirth Connect.

The application is designed for deployment on Windows Server
(2019/2022/2025). The build and CI/CD pipeline is orchestrated through
GitLab, leveraging Docker containers (primarily Linux-based for Java
components and Windows-based for the installer). The final delivery is
bundled into a fully offline installer created with InnoSetup and
Chocolatey, allowing for standardized and automated installation in
secure pharmaceutical environments.

## 🤖 Guidance for AI Agents

### Formatting
- When outputting text prefer the Markdown format as it is what I use in my
  Obsidian vault.

### Communication Style
- Don't be afraid to ask: if unsure, ask for clarifications.
- KISS: Keep it simple, focus on simple and clean solutions.
- Efficiency First: Concise, technical answers. Skip the fluff.
- Minimalist: I prefer minimal commenting—code should be
  self-documenting where possible.

### Coding Preferences
- DevOps/Infrastructure: 
    - Prioritize declarative approaches (IaC).
    - Be mindful of Windows Server 2022 compatibility for
      integration scripts and runner configurations.
    - Ensure CI/CD logic accounts for both Linux and Windows runner
      environments.

### Environment
- I am a CLI-heavy user (`tmux`, `neovim`, `bash`). Provide commands
  that I can easily run or pipe.

--- *Last Updated: February 2026*
