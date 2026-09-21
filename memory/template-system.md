# Template System

- Templates are declared in `app.js` as `TEMPLATES` entries that create editable layers.
- Generated background images are in `assets/templates/`. They preload together with the legacy base artwork before templates become available, so thumbnails and exports never render without their background.
- Template text coordinates use the 2362 × 1181 panel reference size through `nameplateTextOptions`, so defaults scale with the card size.
