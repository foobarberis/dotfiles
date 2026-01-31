# 42 School Context

This document outlines the specific context and requirements for 42 school
projects, focusing on the transition from the common core to advanced topics.

## Progress & Focus

- **Current State:** Completed the C / C++ common core.
- **Next Objectives:** Advanced Java applications (3-project series),
  Kubernetes infrastructure, and functional programming paradigms.

## School-Specific Constraints

- **Beyond "The Norm":** For advanced projects, do **not** apply the 42 Norm.
  Instead, follow the "Clean Code & Modern Best Practices" outlined in
  `USER.md`.
- **Peer Evaluations:** Code must be explainable to peers. Documentation (via
  tests) is crucial for defense preparation.
- **Robust README:** Each project requires a README that explains fundamental
  concepts (e.g., virtual memory for malloc), repository organization, and
  core algorithms/data structures. The goal is to regain familiarity within
  minutes even 6 months later.
- **Testing:** Each project must include a comprehensive test suite.

## Defense Preparation
- **Technical Justification:** For every major architectural decision or
  algorithm, provide a concise one-sentence explanation of its complexity
  and trade-offs.
- **Peer-Ready Logic:** Ensure all code can be explained in plain technical
  language to a peer evaluator.

## Target Standards & Learning Objectives

*Note: These represent the intended technical direction for new projects.*

### Java 21+ (Current Focus)
- **Idioms:** Leverage modern features like Records for data carriers, Sealed
  Classes for restricted hierarchies, and Pattern Matching.
- **Concurrency:** Prefer Virtual Threads (Project Loom) for high-throughput
  I/O tasks.
- **Functional Style:** Use Streams API, Lambdas, and Method References
  effectively.

### Modern C++
- **Standards:** Move beyond C++98/03. Use C++17/20 features (Smart Pointers,
  `auto`, `std::optional`, `std::variant`, Ranges).
- **RAII:** Strict adherence to Resource Acquisition Is Initialization.

### Kubernetes (k8s) (Future Objective)
- **Manifests:** Use declarative YAML with clear resource limits,
  liveness/readiness probes, and labels for organization.
- **Simplicity:** Prefer standard objects (Deployment, Service, ConfigMap).

## Golden Example: Modern Java 21

```java
public sealed interface Shape permits Circle, Rectangle {
    double area();
}

public record Circle(double radius) implements Shape {
    @Override
    public double area() {
        return Math.PI * radius * radius;
    }
}

public record Rectangle(double length, double width) implements Shape {
    @Override
    public double area() {
        return length * width;
    }
}

public class ShapeProcessor {
    public static String describe(Shape shape) {
        return switch (shape) {
            case Circle c when c.radius() > 10 -> "Large circle";
            case Circle c -> "Small circle";
            case Rectangle r -> "Rectangle of area " + r.area();
        };
    }
}
```

## Tools & Environment

- **Tools:** `kubectl`, `helm`, `maven`/`gradle`, and modern C++ compilers.
- **Deployment:** Focus on k8s-based workflows for upcoming projects.
