---
trigger: always_on
---
## Enforce Design Driven Development

All AI sessions MUST use one of the following entrypoint skill:
- edit-specs
- align-code-to-specs
- assess-alignment

If this is not the case, ask the user which skill he wants to activate for the session, or fail and stop.