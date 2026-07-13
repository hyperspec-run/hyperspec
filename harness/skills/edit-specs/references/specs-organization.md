# Specification Directory Structure & Organization

This document details the expected organization and folder hierarchy for specifications within the repository.

## Directory Separation

- **Specifications (`specs/`):** All specification documents must reside strictly inside the `specs/` directory. Each specification file must be a markdown file named `spec.md`, organized in the directory tree of the product (see below).
- **Codebase:** Any other directories and files in the repository are reserved for code, configurations, or other assets.

## 🏗️ Organization Principles

Specs can be organized in multiple ways depending on the complexity of the subject:

- **Hierarchical:** Breaking down a large spec into sub-specs in subdirectories.
- **By Aggregation:** Creating a master spec that links to multiple smaller specs.
- **By Decomposition:** Starting from a high-level spec and drilling down.

### Recommended Layout

A recommended layout to maintain organization is:

- **Master product brief:** Located under `specs/spec.md` (e.g., authentication, styling guidelines, global state).
- **Cross-Cutting Concerns:** Located under `specs/01-cross-cutting/` (e.g., product architecture, authentication, coding or styling guidelines, global state...).
- **Component-Specific Specs:** Located under `specs/02-components/<component>/` for each individual product component (eg. backend, frontend, iac, worker...).
- create an `specs/index.md` file for easing the specs navigation