# Code Review Best Practices

## General Principles
- **KISS (Keep It Simple, Stupid):** Avoid unnecessary complexity.
- **DRY (Don't Repeat Yourself):** Avoid logic duplication.
- **YAGNI (You Ain't Gonna Need It):** Don't add functionality until it's necessary.
- **Principle of Least Astonishment:** Code should behave in a way that is intuitive and expected.

## Readability & Maintainability
- **Naming:** Use clear, descriptive names for variables, functions, and classes.
- **Function Size:** Keep functions small and focused on a single task.
- **Comments:** Use comments to explain *why*, not *what*. Code should be self-documenting.
- **Consistency:** Follow the existing project's style and conventions.

## Performance
- **Complexity:** Be mindful of time and space complexity (Big O).
- **Resource Management:** Ensure proper closing of files, connections, and other resources.
- **Avoid Premature Optimization:** Focus on clear code first, then optimize hotspots if needed.

## Testing
- **Testability:** Code should be easy to test (e.g., dependency injection).
- **Edge Cases:** Consider null inputs, empty collections, and boundary values.
