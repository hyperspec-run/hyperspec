# Workspace Rules

## Enforce Design Driven Development

All AI sessions MUST use one of the following entrypoint skill:
- edit-spec
- align-code-to-specs
- assess-alignment

If this is not the case, ask the user which skill he wants to activate for the session, or fail and stop.

## Use Relative Paths for Internal Linking

To ensure repository portability and consistent rendering across different environments (local development, CI/CD, documentation portals), you MUST always use relative paths for internal links.

### 1. Mandatory Relative Paths

- **Never use absolute paths** (e.g., `/home/user/repo/...` or `C:\Users\...`).
- **Avoid root-relative paths** (e.g., `/docs/README.md`) unless the specific environment/framework explicitly requires them and handles them correctly across all platforms. Use directory-relative paths (e.g., `../README.md`) by preference.

### 2. Contexts of Application

- **Markdown Links:** `[Link Text](./relative/path/to/file.md)`
- **Images & Assets:** `![Alt text](../../assets/image.png)`
- **Mermaid Diagrams:** Use relative URLs in HTML tags for node links: `Node["<a href='./other-doc.md'>Label</a>"]`
- **Code Imports:** Always use relative imports (e.g., `import { foo } from './utils'`) unless using configured path aliases (e.g., `@/components/...`).

## Mermaid Diagrams Standards

When you decide to write or modify Mermaid diagrams anywhere in the workspace, you must adhere to the following standards:

1. **HTML Links:** When adding cross-links inside a mermaid diagram, you MUST use HTML tags (e.g., `Node["<a href='./file.md'>Text</a>"]`) instead of standard markdown links, as standard markdown links break the rendering.
2. **Standard Syntax:** DO NOT use the C4 syntax of mermaid (e.g., `C4Context`, `C4Component`) as it may not be fully supported. Use standard `flowchart`, `graph`, or `classDiagram` instead.
3. **Line Breaks in Labels:** Do NOT use `\n` inside node labels as carriage returns do not render. Use `<br/>` HTML tags instead (e.g., `Node["Line 1<br/>Line 2"]`).
4. **Theme-Aware Styling:** Avoid hardcoding hex colors for `fill` or `stroke` in Mermaid `style` definitions. These break when switching between light and dark themes. Rely on default theme-aware styles or use structural styling (e.g., `stroke-width`, `stroke-dasharray`) without color overrides.

## Specification Navigation

To gain a quick and comprehensive understanding of the repository's specification and its organization, you MUST start by reading the global index file:

- [specs/index.md](specs/index.md)

This file provides a tree-view of all available documentation artifacts across functional and technical domains. Use it as your primary entry point for exploring the project's knowledge base.
