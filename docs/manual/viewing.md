# Looking at a model

## Properties

Click an element to select it, in a 3D view or a plan or section. Its properties replace the
view's at the bottom of the left panel:

- IFC class, name and GlobalId (selectable, so you can copy it);
- storey and material, with the material's family;
- number of triangles and volume, in m³.

++esc++, or **← View properties**, clears the selection.

In a `.bimble` model, the same panel lets you change the element: see
[Editing a model](editing.md).

## Selecting several elements

Hold ++ctrl++ (++cmd++ on macOS) and click to add an element to the selection, or take it out.
A plain click selects one element again. The properties show the element clicked first.

## Hide and isolate

Select one or more elements, then use **View → Visibility** or right-click on the view:

| Command | Does |
|---|---|
| **Hide for now** | Hides them until you leave the view or close the model |
| **Isolate for now** | Shows only them, for now |
| **Hide in view** | Hides them in this view, saved with it |
| **Isolate in view** | Shows only them in this view, saved with it (new elements stay hidden until unhidden) |
| **Reveal hidden** | Shows what is hidden, in another colour, so you can select it |
| **Unhide in view** | With Reveal hidden on: shows the selected hidden elements again |

What is hidden is always said in the status bar: *For now: 3 hidden ×* (its **×** shows them
again) and, for the view, *Hidden: 2 elements, 4 isolated ×* (its **×** shows everything in the
view).

## Section box

The section box is for 3D views; plans and sections are cut by their [view range](views.md#view-range)
instead. The section box (++b++) shows only what is inside a box. Solids it cuts show their cut face, so
you can see inside walls, slabs and columns.

- **View → Section box**, or press ++b++. The box starts around the selected element,
  or around everything visible when nothing is selected.
- **Drag the arrows** on its faces to move them. A face follows the mouse whatever the view.
- **Box to selection** fits the box around the selected element, with a small margin.
  **Box to visible**, shown when nothing is selected, fits it around everything visible.
- ++b++ again switches the box off and the model comes back whole. The box is kept for the next time.

The same box can be used from the command line: `bimble render model.ifc out.png --clip x0,y0,z0,x1,y1,z1`
(model coordinates in mm).

## Measuring

Measure (++m++) takes dimensions on the model: two clicks make one dimension.

1. **Model → Measure**, or press ++m++.
2. Move over the model. The point snaps to what is under the cursor, in this order:
    - a **corner** within 10 pixels;
    - an **edge** within 8 pixels;
    - otherwise the **face**.

    Corners and edges hidden behind something are ignored.
3. Click the first point, then the second. ++esc++ drops a first point you don't want.

    - Hold ++shift++ for the second point to stay on the X, Y or Z axis through the first, the
      one it is nearest to (as Revit's Shift and AutoCAD's Ortho).
    - Hold ++alt++ (++option++ on macOS) to measure to the face under the cursor, without
      snapping to corners and edges.

In a plan or a section, the points also snap to the corners and lines of the view's
[reference plans](views.md#reference-plans).

Each dimension is listed under **Measurements** in the model navigator with:

- the distance;
- its ΔX, ΔY and ΔZ;
- when both points lie on parallel faces, the distance **between the faces**, measured square to
  them. That gives a slab's thickness or the gap between two walls, wherever you click on them.

**x** deletes one dimension, **Clear all** deletes them all. Measurements last as long as the
model is open: they aren't saved in the file yet.

## Warnings

Problems found while reading a file are listed under **Warnings** at the bottom of the model navigator.
A typical one: an opening that couldn't be cut because a wall's geometry isn't a closed solid. The
element is then drawn uncut.

## Share for viewing

**File → Share for viewing… (.bimbleview)** writes a file for someone who only wants to look at
the model: a client, a site manager, a colleague on a small laptop or in a browser. It holds what
the viewer shows (the elements with their class, name, storey, material and shape, the storeys
and grid axes), compressed, with each repeated shape stored once. It opens without reading the
IFC: much faster and in much less memory. It is read-only, and it has no property sets.

Open it like any model: **Open…**, drop it on the window, `bimble view model.bimbleview`, or in
the [browser version](browser.md). From the command line:

```sh
bimble pack model.ifc model.bimbleview      # also from a .bimble model
```

It isn't offered while only part of a model is shown (below): it would look like the whole.

## Models too large for the machine

Before opening a file, Bimble estimates the memory it needs. When that is more than the
[memory setting](window.md#settings) allows (80 % of the computer's memory by default; 4 GB in
a browser), it asks what to show first: pick by storey, IFC class or material, tick the ones to show, and
it says how much memory they need and whether that fits. **Show the chosen part** opens only that; **Show all of it
anyway** opens everything.

On the desktop, IFC files of 5 GB and more open on a machine with the memory for them. Large
models stay smooth while you move around them: what is smallest on screen is left out while the
view moves, at the rate set in [Settings](window.md#settings), and the still view is whole.
