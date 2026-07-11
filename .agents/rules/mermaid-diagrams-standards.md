---
trigger: glob
globs: *.md
---
## Mermaid Diagrams Standards

When you decide to write or modify Mermaid diagrams anywhere in the workspace, you must adhere to the following standards:

1. **HTML Links:** When adding cross-links inside a mermaid diagram, you MUST use HTML tags (e.g., `Node["<a href='./file.md'>Text</a>"]`) instead of standard markdown links, as standard markdown links break the rendering.
2. **Standard Syntax:** DO NOT use the C4 syntax of mermaid (e.g., `C4Context`, `C4Component`) as it may not be fully supported. Use standard `flowchart`, `graph`, or `classDiagram` instead.
3. **Line Breaks in Labels:** Do NOT use `\n` inside node labels as carriage returns do not render. Use `<br/>` HTML tags instead (e.g., `Node["Line 1<br/>Line 2"]`).
4. **Theme-Aware Styling:** Avoid hardcoding hex colors for `fill` or `stroke` in Mermaid `style` definitions. These break when switching between light and dark themes. Rely on default theme-aware styles or use structural styling (e.g., `stroke-width`, `stroke-dasharray`) without color overrides.
