# Graphic styles

Every colour, hatch and light value of a Bimble drawing comes from a **graphic style**. The same
style is used on screen, in `bimble render` pictures and in plans, where it also sets the pen widths.

## In the viewer

**Style…** opens the style editor: colour pickers and sliders for the background, edges, selection,
hover and measurement colours, the light, and each material family's fill, hatch lines and stipple.
Changes show at once.

- **Save…** writes a style file. It contains only what differs from the default.
- **Load…** reads one.
- **Reset** goes back to the default.

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
```

Unknown fields and values out of range are errors, so a typo is reported instead of being ignored.

The fields are described in the source,
[`docs/styles/README.md`](https://github.com/guilbep/bimble/blob/main/docs/styles/README.md).
Two examples are next to it:

- `red-edges.json`: red edges.
- `black-and-white.json`: white fills, black hatches and flat light, to look like a print.

## On paper

The `paper` part of a style sets plans, in mm on the printed sheet. It is set in the style file:
the editor in the viewer doesn't show it yet.

- **pens**: cut outlines (0.5), seen edges (0.18), dashed edges above the cut (0.13, dash 2 / gap 1),
  hatches (0.13), frame (0.5), axes and dimensions (0.13);
- **text height**: 2.5;
- **how much lighter** seen elements are than cut ones (0.6).

The words, title block and what a plan shows are not part of the style: they are in the
[plan template](../reference/plan-template.md).
