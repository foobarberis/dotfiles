# PARA Notes System Report

This report provides an overview of the organization, conventions, and workflows used in this Obsidian vault. It is designed to help AI agents gain familiarity with the notes system and operate within it effectively.

## 1. Overview

The vault is organized using the **PARA method** (Projects, Areas, Resources, Archives), tailored for a DevOps engineer/student workflow. It primarily covers professional tasks at **bioMérieux** (GitLab CI, monitoring, VM management) and academic projects at **42 School**.

## 2. Folder Structure

- **`0 Inbox/`**: Temporary storage for new notes and information before they are processed.
- **`1 Projects/`**: Active, short-term projects with specific goals.
- **`2 Areas/`**: Ongoing responsibilities and long-term focuses.
    - **`(A) Journal/`**: Contains daily notes named by date (`YYYY-MM-DD.md`).
- **`3 Resources/`**: Reference materials, cheatsheets, and general knowledge.
- **`4 Archives/`**: Completed projects, old journal templates, and historical data.

## 3. Conventions

### Naming Conventions
- **Projects**: Folders and main files are prefixed with `(P)`. Example: `1 Projects/(P) Compléter avaj-launcher/`.
- **Areas**: Folders and main files are prefixed with `(A)`. Example: `2 Areas/(A) Maintenance/`.
- **Daily Notes**: Formatted as `YYYY-MM-DD.md`.

### Standardized Templates
Most notes follow a specific header structure:
1. **`# Actions`**: Checklist of tasks related to the note.
2. **`# Suivi`** (Tracking): Status updates or links to external tickets (Service-now, GitLab).
3. **`# Notes`**: General information and brainstorming.
4. **`# Ressources`**: Links and references.

**Daily Notes** (`2 Areas/(A) Journal/`) use a specialized template:
- Navigation link to the previous day.
- **`# Actions`**: Recurring maintenance tasks.
- **`# Aujourd'hui`**: Work completed or in progress today.
- **`# Demain`**: Planned tasks for the next day.
- **`# Notes`**: Raw notes from the day.

### Linking
- The vault uses **absolute path links** (configured in Obsidian).
- Extensive use of **WikiLinks** (`[[Path/To/File|Display Name]]`).

## 4. Technical Environment

The notes reflect a heavy focus on:
- **CI/CD**: GitLab CI, Artifactory.
- **Monitoring**: Telegraf, Prometheus metrics.
- **Infrastructure**: AWS, Docker, Windows/Linux VMs.
- **Tools**: PowerShell, Bash, Git, Chocolatey, Blackduck.
- **Languages**: C, Java (42 School projects).

## 5. Guidelines for AI Agents

When interacting with this vault, AI agents should:
1. **Adhere to PARA**: Place new notes in `0 Inbox/` unless a specific project or area is identified.
2. **Use Templates**: Follow the `# Actions` / `# Suivi` / `# Notes` structure for new project/area notes.
3. **Respect Daily Workflow**: When summarizing work, update the current daily note in `2 Areas/(A) Journal/` under `# Aujourd'hui`.
4. **Link Contextually**: Link to existing projects `(P)` or areas `(A)` when relevant.
5. **Technical Tone**: Keep notes concise, technical, and neutral, as per the user's preferences.
6. **CLI First**: Prefer providing shell commands (Bash/PowerShell) for tasks, referencing `3 Resources/Cheatsheet.md` for established patterns.
