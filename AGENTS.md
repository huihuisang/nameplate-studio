# Nameplate Studio Agent Guide

## Project Scope

This repository contains the standalone nameplate editor and media projects. The [README](README.md) describes its public integration.

## Required Constraints

- Push only when the user explicitly requests it for the current change.
- Keep editor changes scoped to the standalone source. Apply the parent site publication contract only when changing or delivering the integration.
- Preserve font licensing and the editor's export behavior.

## Verification

- Run the local server described in the README. Verify the affected editor interaction and export in the browser. Inspect the deployment workflow before touching publication.

## Read for This Task

- Export, fonts, or parent-site integration → README.
- Promo or review video changes → read the relevant scoped guide under [videos](videos/).
