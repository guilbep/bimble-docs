# Schedules

A **schedule** is a table of elements and their quantities, like Revit's nomenclatures: one per
kind of element and material. The values are **measured from the geometry**, so schedules work the
same on a `.bimble` model and on any IFC.

## Open one

**Schedules** in the project browser lists them with their number of elements (empty ones are
greyed). Click one, or type its name in the [command palette](window.md#the-command-palette)
("conc col"). It opens in the main view, with its own tab.

Built in:

| Schedule | Lists | Columns |
|---|---|---|
| Concrete / Steel / Timber columns | IfcColumn of that family | Level, Location, Name, Material, Section, Length, Volume (steel: and Mass) |
| Concrete / Steel / Timber beams | IfcBeam of that family | Level, Name, Material, Section, Length, Width, Height, Volume (steel: and Mass) |
| Slabs | IfcSlab | Level, Name, Material, Height, Area, Volume |
| Walls | IfcWall | Level, Name, Material, Width, Length, Height, Area, Volume |
| Footings | IfcFooting | Level, Location, Name, Material, Section, Height, Volume |
| All elements | everything | Level, Name, IFC class, Material, Volume, Mass |

Rows are grouped by level, lowest first, with a subtotal under each level and a total at the end.
Within a level they are sorted by location, then name, in natural order (P9 before P10). Click a
column's title to sort by it; again for the other way; **Default order** goes back.

- Click a row to **select its element**; **Show in the view** goes back to the view, framed on it.
- **Export CSV…** writes the table (rows, subtotals, total) for a spreadsheet.

## What is measured

| Column | How |
|---|---|
| Location | The grid crossing nearest the element's centre in plan, within 1.5 m: "B-2". From the model's grid, or, without one, from axes through the columns (A, B… and 1, 2…), as on plans |
| Section | As on plans: "30/30" (cm), "Ø30" for a round column, "GL24h 24x46" for timber with a material name |
| Length | Along the element, m: a column's height, a beam's or wall's length |
| Width, Height | Across it and up, cm: a beam's width and depth, a wall's thickness and height, a slab's thickness |
| Area | m²: a wall's face (length × height), else the plan area |
| Volume | m³, from the closed solid |
| Mass | kg: volume × the density of the material's grade, found in the [material library](materials.md) by name ("S235(R)" → S235). Empty when the grade isn't known |

An element's direction is that of its longest level edge, so rotated beams and walls are measured
along themselves.

## Change a schedule

With a schedule open, the properties (left) show its settings:

- **Name** (for your own schedules), **IFC classes** (separated by commas; empty: all), **Family**;
- **Group by level, with subtotals** and **Total at the end**;
- **Columns**: tick the ones to show; **Earlier** moves a column one place to the left.

A built-in schedule you change is kept with your model, under its name; **Back to built-in**
forgets the change. **New schedule** (in the project browser) and **Duplicate** make your own;
they can be renamed and deleted. Schedules are saved in the `.bimble` model (undo, history), or in
the views file next to an IFC.

## From the command line

```sh
bimble schedules model.ifc                           # each schedule and its number of rows
bimble schedule model.ifc "Concrete columns"         # printed as a table
bimble schedule model.ifc "Steel beams" --csv steel.csv
```
