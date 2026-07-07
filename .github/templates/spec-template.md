---
hyperspec-version: 0.1
status: DRAFT | APPROVED | ALIGNED
---
# [Feature/Component Name]

> **Hyperspec Declarative Guideline**: [Remove this guideline once the spec is written and don't add any further comment about it]
> - Describe only the absolute target state. Do not include implementation steps, migration instructions, before/after details, or history.
> - Replace/remove all placeholder text by the actual specification content.
> 
> ### 2. Supporting Assets
> Prefer leveraging visual diagrams whenever you can. Put it in the relevant spec section, not in a dedicated "supporting assets" section.
> - **Diagrams:** Mermaid diagrams for flows, states, or architecture.
> - **Mockups:** Visual representations if there is a UI component.
> - **Reference Data:** JSON examples, CSV tables, etc.


## Context & Goal [Mandatory]
[A clear description of the component's goal, purpose, and visual/operational boundaries.]

## Functional Requirements [Mandatory]
[Describe here what this spec covers with Use cases, business rules,...]

## Technical Design [Optional]
[If applicable. Create a sub paragraph for each concern, for example: Data models, API definitions, architectural diagrams,component interactions, ]

## UI / Visual Layout [Optional]
[Describe the layout components, positions, hierarchy, and responsive behaviors.]

## Activable Acceptance Criteria [Mandatory for leaf specs, optional otherwise, when acceptance coverage is not fully enforced by child specs]
[Define the exact test scenarios as acceptance criteria. Each criterion must map to exactly one dedicated E2E test function with its current implementation status. One E2E test function cannot cover multiple acceptance criteria. Acceptance criteria IDs must be lowercase (e.g. `aac-1`), and the E2E test names in the test files must be prefixed with the lowercase ID of the corresponding activable acceptance criteria (e.g. `aac_1_test_name`) for easy backtracking. Ensure that all links in the spec use relative paths, that they are not wrapped in backticks, and that the corresponding E2E test function includes a comment pointing back to the spec line for two-way traceability. Links in markdown must be written as `[link_text](relative/path/to/file)` without outer backticks.]
