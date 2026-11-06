# Comparing with another model

You can load other models next to yours as references: typically the architect's IFC next to
your structural model. Yours is the **host**: it owns the views and sheets, and only it is edited.
Linked models are read-only. All are placed by their world coordinates, so files from the same
project line up.

## Link a model

- **Links → Model…** (once a model is open), as many times as you have models to link, or
- `bimble view structure.ifc --link architecture.ifc`.

Linking a file that is already linked replaces it. Each linked model appears under **Links** in the
project browser, and can be shown three ways:

| Mode | Shows |
|---|---|
| Solid | The linked model in the reference colour |
| Edges | Only its edges |
| Hidden | Nothing (it stays loaded) |

Where both models have the same face, yours is drawn.

**Unlink** removes a linked model.

## In each view

A view's **Visibility** lists each linked model ("Link: architecture.ifc"): untick it to hide that
model in this view only. Like the rest of the view's visibility, it is saved with the view.

## Select, measure, snap

Click an element of a linked model to select it: it is outlined, and its properties show, read
only: which model, name, GlobalId, storey, material, volume, and whether your model has something
at the same place. Measuring snaps to linked models' corners, edges and faces like to yours.

## Show differences

Tick **Show differences** under a linked model (one at a time) to colour what only one of the two
models has:

- elements that are **only in your model**;
- elements that are **only in the linked model**.

The two counts are written under the checkbox.

Elements are matched **by position**, not by GlobalId, because two offices' files never share ids.
An element is matched when elements of the other model, one or several, cover at least 80 % of its
bounding box, with 20 mm of tolerance. A wall split in two in one model still matches the whole wall in the other.

The colours are part of the [graphic style](styles.md): `only_here`, `only_in_reference`,
`reference` and `reference_edges`.
