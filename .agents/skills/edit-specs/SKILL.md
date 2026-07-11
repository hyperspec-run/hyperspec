---
name: edit-specs
description: Entrypoint for writing, updating, and collaborating on one or many absolute declarative specifications.
---

## 🎯 Role & Objective
Your objective is to help the user design the product by authoring or modifying one or many specification files inside the `specs/` directory. You do not write or edit any codebase files; your sole output is the specification files.

## 🛠️ Execution Protocol

### Step 1: Gather Requirements & User Intent
1. Listen to the user's description of the feature, component, or change they want to introduce.
2. Ask clarifying questions regarding edge cases, UI layout, state, API contracts, and business rules.

### Step 2: Write or Edit Specifications
1. Identify and navigate to the relevant specification file(s) or create new ones inside the `specs/` directory (editing can touch one or many spec files). Leverage the `specs/index.md` file.
2. Refer to the template structure from [spec-template.md](../../templates/spec-template.md) for any new specification files. Either apply it, or if already specified, make sure the spec file aligns with this template structure.
3. Set the metadata `status` field of all newly created or modified specifications to `DRAFT`.
4. Organize specification files according to the folder hierarchy defined in [specs-organization.md](references/specs-organization.md).
5. Ensure the specifications are **absolute and declarative**:
   - Describe only the target state (the "now" of the design).
   - Do not describe changes, migrations, history, or steps (e.g., avoid "Add a field" or "Rename button"; write "The interface includes X field").
6. Define tables for schemas, APIs, properties, and configurations.

### Step 3: Prompt for User Approval
1. Present the updated or newly created specification file(s) to the user.
2. Request explicit feedback and approval before ending your cycle. Do not proceed to any code changes.
3. Once the user explicitly approves the specification modifications, update the `status` metadata field of all approved specification files to `APPRO<VED`.
4. After the specification files are approved, trigger the index-content skill to update the indexes.

---

## 🚫 Critical Constraints & Rules

1. **No Code Modification**: Under no circumstances should you edit source files or config files outside of the specifications.
2. **Absolute Declarative Grammar**: Use present-tense, declarative statements describing the system behavior. No temporal transitions or step-by-step instructions.
3. **Template Adherence**: Always respect the headings and tabular layouts outlined in the template.
4. **Relative Paths**: Always use relative paths for file references, specifications, and links within specifications. Never use absolute paths (e.g. `file:///home/...`).
5. **Specification Organization**: Always structure specification files hierarchically inside the `specs/` folder as detailed in [specs-organization.md](references/specs-organization.md).
6. **No Code Snippets**: Specifications must not contain source code snippets (e.g., Rust, JavaScript, Python, etc.). Instead, leverage tables, text definitions, or Mermaid diagrams to specify workflows, data schemas, configurations, and behaviors.
7. **One-to-One E2E Test Mapping & Traceability**: Each activable acceptance criterion (AAC) must map to exactly one dedicated E2E test function, linked via a relative markdown link (e.g., `[test_name](../../path/to/test_file)`). One E2E test function must not cover multiple criteria. Acceptance criteria IDs must be lowercase, and E2E test names must be prefixed with the lowercase ID of the corresponding acceptance criteria for easy backtracking. Corresponding test code functions must include a comment referring to the spec and line number for bidirectional traceability.
