# Comparing with another model

You can load a second model next to yours as a reference: typically the architect's IFC next to
your structural model. The two are placed by their world coordinates, so files from the same
project line up.

## Link a model

- **Link model…** in the toolbar (once a model is open), or
- `bimble view structure.ifc --link architecture.ifc`.

The linked model appears under **Links** in the model navigator. It can be shown three ways:

| Mode | Shows |
|---|---|
| Solid | The linked model in the reference colour |
| Edges | Only its edges |
| Hidden | Nothing (it stays loaded) |

Where both models have the same face, yours is drawn. Only your model can be selected.

**Unlink** removes the linked model.

## Show differences

Tick **Show differences** to colour what only one of the two models has:

- elements that are **only in your model**;
- elements that are **only in the linked model**.

The two counts are written under the checkbox.

Elements are matched **by position**, not by GlobalId, because two offices' files never share ids.
An element is matched when elements of the other model, one or several, cover at least 80 % of its
bounding box, with 20 mm of tolerance. A wall split in two in one model still matches the whole wall in the other.

The colours are part of the [graphic style](styles.md): `only_here`, `only_in_reference`,
`reference` and `reference_edges`.
