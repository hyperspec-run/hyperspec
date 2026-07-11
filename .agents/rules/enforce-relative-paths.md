---
trigger: always_on
---
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