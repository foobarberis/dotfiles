# Security Review Checklist

## Injection Vulnerabilities
- **SQL Injection:** Are parameters properly escaped or are prepared statements used?
- **Command Injection:** Is user input used directly in shell commands?
- **XSS (Cross-Site Scripting):** Is output properly encoded for the target context (HTML, JS, etc.)?

## Authentication & Authorization
- **Broken Authentication:** Are passwords hashed securely? Are session tokens handled safely?
- **Insecure Direct Object References (IDOR):** Does the code verify that the user has permission to access the requested resource?

## Data Protection
- **Sensitive Data Exposure:** Is sensitive information (PII, secrets) encrypted at rest and in transit?
- **Logging Secrets:** Are API keys, passwords, or tokens accidentally logged?

## Configuration & Environment
- **Hardcoded Secrets:** Are there any API keys, database credentials, or other secrets in the source code?
- **Default Credentials:** Are default passwords or insecure default settings being used?

## Dependencies
- **Vulnerable Libraries:** Are there any known vulnerabilities in the third-party libraries used?
