---
name: assess-alignment
description: Guidelines for performing a two-way alignment audit between the specifications and the codebase, executing test suites, and identifying drift.
---

# Agent Skill: Assess Alignment

This skill details how to perform an Alignment Assessment to ensure the codebase perfectly matches the specifications, and vice versa.

---

## 🎯 Role & Objective
Your objective is to run a two-way alignment audit and verify the system's correctness, resolving any regressions or gaps before declaring the codebase fully aligned.

---

## 🛠️ Execution Protocol

### Step 1: Initialize the Assessment Reports
1. Create both a markdown and a JSON assessment report by copying the [alignment-assessment-template.md](../../templates/alignment-assessment-template.md) template and the [alignment-assessment-template.json](../../templates/alignment-assessment-template.json) template to unique report files (e.g., `alignment_assessment_report.md` and `alignment_assessment_report.json` in the current conversation artifacts directory or as requested by the user).
2. All findings must be documented inside both of these reports.

### Step 2: Run Validation & Test Suites
1. Run the codebase compilation, linting, and type-checking commands.
2. Execute all unit and integration test suites.
3. Record the commands used and their outputs/status in the Verification Execution Log section of the reports.
4. **Note**: If any tests fail, document the failures in the reports. Do NOT modify the codebase to fix them during this assessment phase.

### Step 3: Two-Way Alignment Audit (Identify Gaps)
Perform a thorough two-way audit to identify all discrepancies. **Do not perform any code or spec updates during this process.**

1. **Specification against Code (Spec ➔ Code)**:
   - Inspect all active specification files.
   - For every requirement, API definition, database schema rule, UI/UX instruction, and Acceptance Criterion in the specs, trace it to the codebase.
   - If a specification detail is missing, incomplete, or incorrectly implemented in the code, document it as a **Spec ➔ Code Gap** in the reports.
2. **Code against Specification (Code ➔ Spec)**:
   - Inspect the codebase (directories, source files, config files, router paths, database migrations, etc.).
   - Verify if there are any features, logic branches, extra fields, endpoints, or options present in the code that are not defined in the specifications.
   - If undocumented code features or logic exist, document them as a **Code ➔ Spec Gap** in the reports.

### Step 4: Finalize the Reports
1. Summarize the total count of gaps and list them clearly in both reports.
2. Formulate a Recommended Action Plan in the reports describing what needs to be done next (e.g. update specifications using the `edit-specs` skill, or modify the codebase using the `align-code-to-specs` skill).
3. Deliver the completed assessment reports to the user.

---

## 🚫 Critical Constraints & Rules

1. **No Code Updates**: The assessment skill is strictly analytical and diagnostic. Under no circumstances should you make any modifications, edits, deletions, or updates to the codebase or specs while executing this skill.
2. **Two-Way Completeness**: You must examine both directions. Merely verifying that the code satisfies the specs (one-way) is insufficient. You must also check that the code contains nothing extra beyond the specs.
3. **Use Relative Paths**: When linking to files in the assessment report, always use relative paths.

