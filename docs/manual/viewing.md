# Looking at a model

## Properties

Click an element to select it. Its properties open in a panel on the right:

- IFC class, name and GlobalId (selectable, so you can copy it);
- storey and material, with the material's family;
- number of triangles and volume, in m³.

++esc++ clears the selection.

In a `.bimble` model, the same panel lets you change the element: see
[Editing a model](editing.md).

## Section box

The section box (++b++) shows only what is inside a box. Solids it cuts show their cut face, so
you can see inside walls, slabs and columns.

- Tick **Section box** in the toolbar, or press ++b++. The box starts around the selected element,
  or around everything visible when nothing is selected.
- **Drag the arrows** on its faces to move them. A face follows the mouse whatever the view.
- **Box to selection** fits the box around the selected element, with a small margin.
  **Box to visible**, shown when nothing is selected, fits it around everything visible.
- ++b++ again switches the box off and the model comes back whole. The box is kept for the next time.

The same box can be used from the command line: `bimble render model.ifc out.png --clip x0,y0,z0,x1,y1,z1`
(model coordinates in mm).

## Measuring

Measure (++m++) takes dimensions on the model: two clicks make one dimension.

1. Tick **Measure** in the toolbar, or press ++m++.
2. Move over the model. The point snaps to what is under the cursor, in this order:
    - a **corner** within 10 pixels;
    - an **edge** within 8 pixels;
    - otherwise the **face**.

    Corners and edges hidden behind something are ignored.
3. Click the first point, then the second. ++esc++ drops a first point you don't want.

Each dimension is listed under **Measurements** in the left panel with:

- the distance;
- its ΔX, ΔY and ΔZ;
- when both points lie on parallel faces, the distance **between the faces**, measured square to
  them. That gives a slab's thickness or the gap between two walls, wherever you click on them.

**x** deletes one dimension, **Clear all** deletes them all. Measurements last as long as the
model is open: they aren't saved in the file yet.

## Warnings

Problems found while reading a file are listed under **Warnings** at the bottom of the left panel.
A typical one: an opening that couldn't be cut because a wall's geometry isn't a closed solid. The
element is then drawn uncut.
