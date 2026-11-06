# Editing a model

Bimble edits its own `.bimble` models. IFC files open for viewing, plans and comparison, but are
not edited: see [Questions](faq.md#can-i-edit-an-ifc-file).

Every change can be undone, and an element keeps its GlobalId through every edit, so the
[history](history.md) and comparisons know it is the same element.

To try it on a small model:

```sh
bimble demo frame.bimble
bimble view frame.bimble
```

With a `.bimble` model open, the toolbar shows **Undo**, **Redo**, **Save**, **Edit…** and
**History…**.

## Change an element

Click an element. The panel on the right shows its properties:

- **Name**;
- GlobalId, storey, material and generator, for information;
- its **sizes**, such as width, depth and height for a column, or length and thickness for a wall;
- **Origin X / Y / Z**: where it is placed, in mm. Z is relative to its storey's level.

Type a value or drag it. The change is applied when you leave the field or release the mouse: one
drag is one step to undo. A size that makes no sense, such as a negative height, is refused with a
message.

### Move, copy, delete

Under the properties, **Vector** is a displacement in mm (X, Y, Z), 1000 mm along X to start with.

- **Move** moves the element by the vector.
- **Copy** makes a copy moved by the vector, named like the original with " (2)" added, and selects it.
- **Delete**, or the ++delete++ key, deletes the selected element.

## Place new elements

**Edit…** opens **Place elements**:

1. Choose **Column**, **Beam**, **Wall** or **Slab**. The button stays on while you place.
2. Choose the **storey**.
3. Set the sizes: column section, beam width and height, wall or slab thickness.
4. Click in the view on the storey's level:
    - **Column**: one click, at its centre;
    - **Beam** and **Wall**: two clicks, the start and the end of its axis;
    - **Slab**: two clicks, two opposite corners of a rectangle.

Points are rounded to 10 mm. ++esc++ stops placing.

Where new elements go:

- Columns and walls stand on the storey level and are as high as the storey.
- Beams and slabs hang from the level above: their tops are flush with it.
- New elements are named P1, P2… (columns), B… (beams), M… (walls), D… (slabs). They are made of the
  model's concrete, which is added if the model has none.

!!! tip
    Look from the top (++t++) to place elements where you mean them. Placing doesn't snap to axes
    or other elements yet ([#25](https://github.com/guilbep/bimble/issues/25)).

## Undo, redo, save

| Keys | Does |
|---|---|
| ++ctrl+z++ (++cmd+z++ on macOS) | Undo |
| ++ctrl+y++ or ++ctrl+shift+z++ | Redo |
| ++ctrl+s++ | Save the model to its file |

**Save** shows **Save\*** when there are changes not saved. In a browser, saving downloads the
model.

## From the command line

```sh
bimble ls frame.bimble --class IfcBeam             # GlobalId, class, name, sizes
bimble set frame.bimble <GlobalId> height=600 -o frame2.bimble
bimble diff frame.bimble frame2.bimble             # what changed, element by element
bimble export-ifc frame2.bimble frame2.ifc         # IFC4, for other software
```
