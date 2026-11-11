# Sheets

A **sheet** is a page to print: several views at their own scales, one title block, one legend,
and your texts. Sheets are numbered (S-101, S-102…) and saved with the views: in a `.bimble`
model, or in the views file next to an IFC.

## Open and make sheets

Sheets are listed under **Layouts** in the project browser.

- Click one to open it in the main view. It is drawn from its own PDF drawing, so what you see is
  what prints, sharp at any zoom.
- **New sheet** (here, or in the **Sheets** tab) adds an empty A1 sheet.
- Right-click a sheet: **Export PDF…**, **Delete sheet**.

Scroll zooms at the pointer, a right or middle drag pans, ++f++ fits the sheet.

With nothing selected, the properties show the sheet's number, name, paper (A4 to A0, portrait or
landscape) and the title block's fields (phase, revision, drawn, checked…).

## Place views

Drag a plan, ceiling plan or section from **Views** onto the sheet. It is placed at its
[scale](views.md#scale) under the pointer.

- Click it to select it, then drag it to move it.
- Its **scale** is the view's: changing it here changes the view, on every sheet and on screen.
  **Remove from sheet** (or ++delete++) takes it off.
- **Double-click** it to open the view On paper.

## Texts and dimensions

Choose the tool in the **Annotate** tab:

- **Text**: click where the text goes. Inside a placed view, the text belongs to the view (at a
  point of the model: it shows wherever the view is placed). Elsewhere it belongs to the sheet.
- **Dimension**: click two points (they snap to the ends of the drawn lines, else to the lines),
  then where the dimension line goes. Above or below both points, it measures across; left or
  right of both, up; between, along the two points. Dimensions belong to the view: they show on
  every sheet the view is on, on paper plans, and over the view on screen.

Next to the tools, choose the **dimension type** and **text type** new ones get (unit, decimals,
colour, size: see [Standards](styles.md#text-and-dimension-types)). Select a text or a dimension to
change its type, text or size.

Every change can be undone in a `.bimble` model.

## From the command line

```sh
bimble sheets model.bimble                          # number, name, paper, views placed
bimble sheet-new model.bimble --name Plans \
    --place "Plan Level 1:100" --place "Section A:50"   # views side by side, next free number
bimble sheet model.bimble S-101 S-101.pdf            # .pdf, .svg or .png
```

`sheet-new` takes `--number`, `--paper` (default A1) and `--portrait`. `sheet` takes `--style`,
`--template`, `--project` and `--dpi`, like `plan`.
