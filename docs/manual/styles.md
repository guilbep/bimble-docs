# Standards and styles

Every colour, pen, line, text, dimension and hatch of a Bimble drawing comes from a **graphic
style**. The same style is used on screen, in `bimble render` pictures, and on plans and sheets.
An office keeps its standards in one style file and shares it.

## The Standards panel

**Manage → Graphic standards** (or "standards" in the [command palette](window.md#the-command-palette))
opens the **Standards** panel on the right, beside the drawing, so you see each change on it.

- At the top: where the standards come from (a file, or Bimble's default) and whether they are
  **changed, not saved**. The title row lists them under *Not saved* too.
- **Load…** reads a style file; **Save…** writes one (only what differs from the default), and
  what is saved becomes the reference for *changed*.
- **Revert** goes back to the file as loaded or last saved.
- **Reset to default…** puts every standard back to Bimble's default, after asking. Your file is not
  changed.
- The search box finds a section by its title or by the name of a type in it ("earth", "red",
  "2.5 mm"): sections that match open, the others hide.

The sections follow.

## Line weights

Sixteen pens, each with a width in mm on paper **for each scale**, as in Revit. Three tables:

- **Model**: lines of the model (cut outlines, seen edges, hatches);
- **Perspective**: for 3D pictures (kept, not used yet);
- **Annotation**: dimensions, texts, axes, the frame (the same width at every scale).

The default is Revit's metric table, with columns for 1:5, 1:10, 1:20, 1:50, 1:100, 1:200 and 1:500.
**Add scale 1:** adds a column, and the **x** in a column's heading removes it. A drawing at a scale between two
columns uses the nearest one (1:75 uses 1:100's widths).

## Line types

A line type is a **name**, a **colour**, a **dash pattern** (dash, gap, dash, gap… in mm on paper;
empty for a continuous line) and a **pen** (1 to 16). The defaults combine nine colours with
`continu` 1, 2, 3 and 5, `dash` 1, 2, 3 and 5, `axes` 1 and 2 (dash-dot) and `axes_detail_1`:
`black_continu_5`, `red_dash_1`…

**Lines on drawings** chooses the line type of each kind of line: cut outlines, seen edges, above
the cut, hatches (their width), grid axes, dimensions, frame and title block. Renaming a line type
updates what uses it.

## Text and dimension types

A **text type** is a font, a size in mm on paper and a colour. The defaults are Arial 5, 4, 3.5,
2.5 and 2 mm in black, red, green, brown and blue ("Arial 2.5 mm black").

A **dimension type** says how a length is written and drawn:

| Field | Values |
|---|---|
| Unit | m, cm or mm |
| Decimals | 0 to 4 |
| Unit shown | "1.00 m", or just "100" |
| Colour, text size | as on paper |
| Line | the line type of its lines |

The defaults, in black, red, blue and green: **cm** without unit ("600"), **m** with two
decimals and the unit ("6.00 m"), **mm** with the unit.

Texts and dimensions get their type from the tool when they are made ([sheets](sheets.md)). One
without a type uses the plan template's unit and the style's text size.

## Hatch types

A hatch type is a pattern **as printed**: its spacing is in mm on paper, the same at every scale.

- **Fill**: a solid colour under the lines, or none (white paper).
- **Lines**: one or more families of parallel lines, written `angle spacing [offset [dash gap…]]`,
  families separated by `;`. For example `45 1.5` is concrete's diagonals; `45 4 0; 45 4 0.5; 45 4 1`
  is earth (three lines 0.5 mm apart, every 4 mm).
- **Colour** and **pen** (its width comes from the Model line weights at the drawing's scale).

The panel shows every hatch type as a **swatch**; point at one to see which materials use it. The
defaults: concrete, masonry, steel and timber cut and seen, earth, drainage, insulation, diagonals in
five colours, solid black, grey and light grey.

**Hatches by material** chooses, for each material family, the hatch type where it is **cut** and
where it is **seen** from above. **Own pattern** keeps the family's screen pattern, scaled to paper:
that is what drawings use until you choose.

## On screen

**Colours and light**: background, edges, selection, hover and measurement colours, the light. Each
material family has its colour, up to two families of hatch lines and a stipple, used on screen.

## Style files

A style file is JSON and lists only what differs from the default:

```json
{ "edges": "#d01010" }
```

```sh
bimble style                       # the complete default style: the reference for every field
bimble style my-style.json         # checks a file and prints it in full
bimble view model.ifc --style my-style.json
bimble render model.ifc out.png --style my-style.json
bimble plan model.ifc plan.pdf --storey "Level 1" --style my-style.json
bimble sheet model.bimble S-101 S-101.pdf --style my-style.json
```

Unknown fields and values out of range are errors, so a typo is reported instead of being ignored.
The paper part is under `paper`: `pens`, `line_types`, `lines`, `text_types`, `dimension_types`,
`hatch_types`, `material_hatches`.

The fields are described in the source,
[`docs/styles/README.md`](https://github.com/guilbep/bimble/blob/main/docs/styles/README.md).
Two examples are next to it: `red-edges.json`, and `black-and-white.json` (white fills, black
hatches and flat light, to look like a print).

The words, title block and what a plan shows are not part of the style: they are in the
[plan template](../reference/plan-template.md).
