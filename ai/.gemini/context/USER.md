# User Identity & Preferences

This document provides core identity and general preferences for AI agents.

## About Me

I am a software engineering student at 42 School, currently interning as a
DevOps engineer at bioMérieux.

My technical experience includes C, C++, Python, Java (modern 17/21+), and
Javascript. I am proficient in Linux environments and Docker.

Currently, I am focused on growing my skills as a DevOps and as a developer
in general on the technical, organizational and human level.

## Engineering Principles

- **Clean Code & Modern Best Practices:** Regardless of the environment
  (School or Work), I prioritize clean, maintainable, and idiomatic code.
- **KISS (Keep It Simple, Stupid):** Focus on simple, clean, and efficient
  solutions.
- **Security by Design:** Prioritize security and the principle of least
  privilege in both infrastructure and application code.
- **Automate Everything:** If a task needs to be performed more than once, it
  should be automated (IaC, CI/CD, scripting).
- **Declarative & IaC:** Prefer declarative configurations and
  Infrastructure-as-Code (e.g., Docker Compose, GitLab CI) over imperative
  manual steps.
- **Testing as Documentation:** I value robust testing. Tests should
  explain the intended behavior.
- **Minimalist Documentation:** Prefer minimal commenting; code should be
  self-documenting where possible. Focus comments on "why" rather than
  "what". Below is an example of what I consider clean code (using C as a
  reference, though the principles are language-agnostic).
- **Use linters:** Whenever possible always use a linter to make sure the
  code is clean (like using `shellcheck` when writing Bash scripts).

```c
#include "libft.h"    /* f_printf */
#include <stddef.h>   /* size_t */
#include <sys/mman.h> /* mmap, munmap */
#include <unistd.h>   /* sysconf */

#define LOGGING_ENABLED 0

/* align to 16 bytes */
#define ALIGNMENT 16
/* maximum size for tiny allocations */
#define TINY_ALLOC_SIZE 128
/* maximum size for small allocations */
#define SMALL_ALLOC_SIZE 1024

void * malloc( size_t size );
void free( void * ptr );
void * realloc( void * ptr, size_t size );
void show_alloc_mem( void );

/* using static variable to avoid repeated calls to sysconf */
static inline size_t tiny_max_size( void ) {
    static size_t v = 0;
    if ( v == 0 )
        v = 4 * sysconf( _SC_PAGESIZE );
    return v;
}

/* align 'size' up to the nearest multiple of ALIGNMENT. Returns 0 on overflow. */
static inline size_t align( size_t size ) {
    if ( size > ( size_t )-1 - ( ALIGNMENT - 1 ) )
        return 0;
    return ( size + ( ALIGNMENT - 1 ) ) & ~( ( size_t )ALIGNMENT - 1 );
}

/* structure to hold block metadata */
typedef struct s_block {
    size_t size;           /* size of the data payload (user capacity) */
    struct s_block * next; /* next block in this specific zone */
    int is_free;           /* 1 if free, 0 if allocated */
} __attribute__( ( aligned( 16 ) ) ) t_block;
```

## Knowledge Management (Obsidian PARA)

I use the PARA method (Projects, Areas, Resources, Archives) for my Obsidian
vault, adhering to a clear hierarchy and strict naming conventions.

- **0 Inbox**: Initial triage for new notes and files.
- **1 Projects**: Active goal-oriented tasks. Prefixed with `(P)`.
  Professional projects often follow Jira naming: `(P) B3PCB-[ID] [Desc]`.
- **2 Areas**: Ongoing responsibilities (Daily Journal, Maintenance).
  Prefixed with `(A)`. Journals are named `YYYY-MM-DD.md`.
- **3 Resources**: Documentation and references. Prefixed with `(R)`.
- **4 Archives**: Completed projects, maintaining original structure.

### Conventions
- **Naming**: Files/folders within project/area directories often share
  identical names. Prefixes `(P)`, `(A)`, `(R)` are mandatory.
- **Structure**: Assets (images, attachments) are stored in `assets/`
  subfolders relative to the note.
- **Source of Truth**: `Index.md` provides a high-level view of active
  actions and projects.

## Guidance for AI Agents

### Formatting & Style
- **Markdown (Obsidian):** Prefer Markdown format for all text output. Use
  clear headings and structured lists.
- **Checklists**: Use Markdown checkboxes (`[ ]`, `[x]`) for all tasks.
- **Links**: Use Wikilinks `[[Link]]` for all internal vault references.
- **No emojis:** Refrain from using emojis unless asked otherwise.
- **Minimalism**: Focus on "why" rather than "what". No "fluff" or
  conversational filler.

### Obsidian Workflow & Interaction
- **Information Discovery**: Search `Index.md` and the most recent journal
  entries before answering questions about current work.
- **Note Creation**: Follow this structure for new project notes:
  - `# Actions` (Checklist)
  - `---`
  - `# Suivi` (Follow-up)
  - `---`
  - `# Notes` (Technical details, code snippets)
  - `---`
  - `# Ressources` (Links)
- **Language**: Content is naturally bilingual (French/English). Default to
  this mix unless specified otherwise.
- **Technical Rigor**: Include high-value data (shell one-liners, snippets,
  config excerpts) in notes.

### Communication Style
- **Don't be afraid to ask:** If unsure about a request or context, ask for
  clarification.
- **Minimalism & Precision:** Provide the fix followed by a short (2-3
  sentences) technical explanation. No analogies or fluff.
- **Technical Rigor:** Include high-value data (shell one-liners, snippets,
  config excerpts) in notes.
- **Be neutral:** No sycophantry or flattery of any kind.

### Security & Debugging
- **Security by Design:** Always prioritize the principle of least privilege.
  Strictly no hardcoded secrets; use environment variables or Vault.
- **Logs-First Debugging:** Prioritize analyzing logs and configurations
  before suggesting code changes.
- **Verification:** Always provide a verification step (e.g., a specific
  curl command, CLI check, or test run) to confirm a fix.

### Tooling & Environment
- **Editor:** Primarily a **VS Code** user, with **neovim** used as a
  secondary/side editor.
- **CLI-First Workflow:** Prefer CLI tools (`glab`, `docker`, `kubectl`,
  `git`) over editor-specific extensions.
- **Shell:** Heavy user of `bash`, `tmux`, and `git`.
- **OS:** Primary work is done on **Ubuntu (via WSL on Windows 11)**.
