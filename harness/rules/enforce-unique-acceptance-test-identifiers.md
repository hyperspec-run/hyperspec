---
trigger: glob
globs: *.md
---
## Enforce unique Acceptance Test identifiers

When specifying a new acceptance test, you must: 

1. read the `/.hyperspec.json` file (if it does not exist, create it with the `init-hyperspec` skill). It contains the next usable index to be used for the new test identifier.
2. create new acceptance criteria with new unique IDs, in the format `aac-[index]`
3. Update `.hyperspec.json` with the new next usable index
