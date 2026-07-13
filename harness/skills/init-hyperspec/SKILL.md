---
name: init-hyperspec
description: Skill to run in order to initialize Hyperspec
---
Create a `/.hyperspec.json` file with the following content:
```json
{
  "version": "0.1.0",
  "next-acceptance-test-identifiers": [
    "aac-1",
  ]
}
```

If specs in `specs/` are already present, update `.hyperspec.json` to set the next usable identifier for each type of acceptance test accordingly.