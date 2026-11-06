# Plan templates

A plan template is a JSON file that sets everything around the model on a [storey plan](../manual/plans.md):

- the title, the level note and the dimension unit;
- what is shown and what is hidden;
- the legend's words;
- the title block.

Every key is optional: a template lists only what differs from the built-in template below. Unknown
keys are errors, so a typo is reported instead of being ignored.

```sh
bimble plan-template                    # print the built-in template
bimble plan-template mine.json          # check a template and print it in full
bimble plan model.ifc plan.pdf --storey N01 --template mine.json --field phase="Tender"
```

## Keys

| Key | Default | Meaning |
|---|---|---|
| `title` | `"Plan {storey}, {scale}"` | Title under the drawing, bold and underlined. Ceiling plans and sections use `"{view}, {scale}"` instead |
| `level_note` | `"{storey}: {level} m"` | Note above the title block, at the right. `""`: none |
| `dimension_unit` | `"cm"` | `"mm"`, `"cm"` or `"m"`. cm are whole when they can be, else one decimal (`12.5`) |
| `hidden_classes` | reinforcement, spaces, openings, annotations, terrain | IFC classes left out of the plan (any letter case) |
| `seen_fills` | `true` | Fill what is seen below the cut, lighter than what is cut |
| `axes` | `"model-or-columns"` | Grid axes: `"off"`, `"model"` (the IFC grid only) or `"model-or-columns"` (else through the cut columns) |
| `dimensions` | `true` | Dimension chains, top and left |
| `slab_levels` | `true` | Top-of-slab levels on the slabs seen below the cut |
| `opening_crosses` | `true` | A cross in the rectangular openings of slabs seen below the cut |
| `opening_dimensions` | `true` | Size of rectangular slab openings ("100x200", cm) and their distance to the nearest grid axes |
| `element_labels` | `true` | Section labels: "30/30" beside cut columns, beams, members and piles, along beams above the cut; "GL24h 24x46" for timber |
| `section_markers` | `true` | Marks of the section views crossing a plan: line, arrows, tag |
| `legend` | see below | The legend's words |
| `title_block` | see below | The title block's columns |
| `fields` | `{}` | Your own values for placeholders, e.g. `{"phase": "Tender"}` |

### `legend`

| Key | Default | Meaning |
|---|---|---|
| `show` | `true` | Draw the legend |
| `title` | `"Legend"` | Its title |
| `cut`, `seen` | `"{family}, cut"`, `"{family}, seen"` | Label of each material's cut and seen swatch |
| `above` | `"Above the cut"` | Label of the dashed lines. `""`: not listed |
| `families` | `{}` | Material family names in your language: keys `Concrete`, `Steel`, `Timber`, `Masonry`, `Insulation`, `Earth`, `Glass`, `Other` |

### `title_block`

A band across the bottom of the frame, divided into columns. Each column holds one or more entries
stacked on top of each other.

| Key | Meaning |
|---|---|
| `height_mm` | Height of the band, 10 to 120 mm (default 28) |
| `columns` | The columns, left to right |
| `columns[].width_mm` | Width in mm. Leave it out and the columns without a width share what is left |
| `columns[].entries[].label` | Caption, in bold |
| `columns[].entries[].value` | Text under it. `\n` starts a new line |
| `columns[].entries[].color` | Colour of the value, e.g. `"#d22020"`. Default: the ink colour |
| `columns[].entries[].size` | Text size relative to the normal size, 0.2 to 5 (default 1) |

## Placeholders

Any text can contain placeholders, replaced when the plan is drawn:

| Placeholder | Becomes |
|---|---|
| `{project}` | The project name: `--project`, else the file name |
| `{storey}` | The storey's name |
| `{view}` | The view drawn (`bimble plan --view`, or **Draw** in the viewer); empty for a storey plan |
| `{drawing}` | The view's name, else "Plan *storey*" |
| `{level}` | The storey's level in m, signed: `+3.00` |
| `{scale}` | `1:100` |
| `{n}` | `100` |
| `{paper}` | `A2`, or `A2 portrait` |
| `{date}` | Today, `YYYY-MM-DD` |
| `{bimble}` | Bimble's version |
| `{anything}` | The value of `anything` in `fields`, or given with `--field anything=…` |

An unknown placeholder is left as it is, so a typo shows on the sheet.

## Example: a French office template

[`docs/templates/plan-fr.json`](https://github.com/guilbep/bimble/blob/main/docs/templates/plan-fr.json)
in the source is a complete example. It has:

- French words: *Plan N01, éch 1 : 100*, *Béton coupé*, *Béton vu*;
- a title block with the office, project, phase in red, client, architect, revision, drawn/checked,
  format/scale and date/plan number;
- `fields` to fill in per project.

A shorter one:

```json
{
  "title": "Plan {storey}, éch 1 : {n}",
  "legend": {
    "title": "Légende :",
    "cut": "{family} coupé",
    "seen": "{family} vu",
    "families": { "Concrete": "Béton", "Timber": "Charpente bois" }
  },
  "title_block": {
    "columns": [
      { "entries": [{ "label": "PROJET", "value": "{project}" }] },
      { "width_mm": 45, "entries": [{ "label": "PHASE", "value": "{phase}", "color": "#d22020" }] },
      { "width_mm": 30, "entries": [{ "label": "ÉCHELLE", "value": "1 : {n}" }, { "label": "DATE", "value": "{date}" }] }
    ]
  },
  "fields": { "phase": "Avant-projet" }
}
```

## The built-in template

```json
{
  "title": "Plan {storey}, {scale}",
  "level_note": "{storey}: {level} m",
  "dimension_unit": "cm",
  "hidden_classes": [
    "IfcReinforcingBar",
    "IfcReinforcingMesh",
    "IfcTendon",
    "IfcTendonAnchor",
    "IfcSpace",
    "IfcOpeningElement",
    "IfcAnnotation",
    "IfcGeographicElement"
  ],
  "seen_fills": true,
  "axes": "model-or-columns",
  "dimensions": true,
  "slab_levels": true,
  "opening_crosses": true,
  "opening_dimensions": true,
  "element_labels": true,
  "section_markers": true,
  "legend": {
    "show": true,
    "title": "Legend",
    "cut": "{family}, cut",
    "seen": "{family}, seen",
    "above": "Above the cut",
    "families": {}
  },
  "title_block": {
    "height_mm": 28.0,
    "columns": [
      {
        "width_mm": null,
        "entries": [
          {
            "label": "PROJECT",
            "value": "{project}",
            "color": null
          }
        ]
      },
      {
        "width_mm": 60.0,
        "entries": [
          {
            "label": "DRAWING",
            "value": "{drawing}",
            "color": null
          }
        ]
      },
      {
        "width_mm": 30.0,
        "entries": [
          {
            "label": "SCALE",
            "value": "{scale}",
            "color": null
          },
          {
            "label": "FORMAT",
            "value": "{paper}",
            "color": null
          }
        ]
      },
      {
        "width_mm": 30.0,
        "entries": [
          {
            "label": "DATE",
            "value": "{date}",
            "color": null
          },
          {
            "label": "REVISION",
            "value": "",
            "color": null
          }
        ]
      },
      {
        "width_mm": 24.0,
        "entries": [
          {
            "label": "DRAWN",
            "value": "",
            "color": null
          },
          {
            "label": "CHECKED",
            "value": "",
            "color": null
          }
        ]
      },
      {
        "width_mm": 40.0,
        "entries": [
          {
            "label": "DRAWING N°",
            "value": "",
            "color": null
          }
        ]
      }
    ]
  },
  "fields": {}
}
```
