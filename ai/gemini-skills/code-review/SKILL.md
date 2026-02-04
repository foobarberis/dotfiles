---
name: code-review
description: Analyzes code for bugs, security vulnerabilities, performance bottlenecks, and maintainability issues. Generates a detailed report in a file for subsequent processing, without making direct modifications to the source code.
---

# Code Review

## Overview

The `code-review` skill provides a systematic approach to evaluating code quality. It identifies critical and non-critical issues across various dimensions including correctness, security, performance, and readability. Instead of fixing issues directly, it produces a structured report that can be handed off to other agents or human developers.

## Workflow

### 1. Context Gathering
- Identify the target files or directories for review.
- Understand the project's purpose and existing conventions (if any).
- Check for relevant configuration files (e.g., `package.json`, `requirements.txt`).

### 2. Analysis
Perform a deep dive into the code, referencing the following guides:
- **Best Practices:** See [best-practices.md](references/best-practices.md) for general coding standards.
- **Security:** See [security-checklist.md](references/security-checklist.md) for common vulnerabilities.

Focus on:
- **Correctness:** Logic errors, edge cases, and potential bugs.
- **Security:** Data leaks, injection points, and insecure configurations.
- **Performance:** Inefficient algorithms or resource handling.
- **Maintainability:** Code complexity, naming, and structure.

### 3. Report Generation
- Use the [review-report-template.md](assets/review-report-template.md) to structure your findings.
- **Do not modify the source code.** Your goal is observation and reporting only.
- Save the final report to a file (e.g., `code-review-report.md`) in the project directory or a specified location.

## Example Request

"Perform a code review on the `src/auth.ts` file and save the report to `review_auth.md`. Focus on security and performance."

## Guidelines
- Be objective and constructive.
- Prioritize issues by severity.
- Provide clear explanations for *why* something is an issue.
- Suggest conceptual improvements rather than providing code patches.