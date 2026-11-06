# First steps

## Open a model

Start the viewer and open a file in one of these ways:

- **Open…** in the title row;
- drop a `.ifc` or `.bimble` file on the window;
- from a terminal: `bimble view model.ifc`.

No model to hand? Make the demo frame (2 storeys, 3 × 2 bays, concrete):

```sh
bimble demo frame.bimble
bimble view frame.bimble
```

The status bar at the bottom shows the file, the number of elements and triangles, how long it
took to load, and the graphics card in use.

## Move around

| Do | To |
|---|---|
| Drag | Orbit around the model |
| Right-drag, or Shift-drag | Pan |
| Scroll | Zoom |
| Click | Select an element (its properties appear at the bottom left) |
| Double-click, or ++f++ | Fit everything visible in the view |
| ++t++ | Look from the top |
| ++o++ | Switch between perspective and orthographic |
| ++esc++ | Clear the selection |

Moving the mouse over an element highlights its edges, so you can see what a click will select.

## The view cube

The cube at the top right shows which way you are looking.

- **Click a face** (TOP, FRONT, RIGHT…) to look straight at the model from that side.
- **Click an edge** to look from 45° between two faces.
- **Click a corner** for an isometric view.
- **Drag the cube** to orbit.

The ring around the cube is a compass. North is +Y of the model: the IFC "true north" isn't read
yet.

The buttons under the cube:

- **Home** returns to the default 3D view.
- **Fit all** frames everything visible.
- **Fit sel.** (when something is selected) frames the selection.
- **+** and **−** zoom in and out.

## The left panel

The left panel has two parts, one above the other (drag the line between them to share the
height):

- the **model navigator** at the top: the model's views, quantities, layouts, objects and links,
  then measurements and warnings;
- the **properties** below: those of the selected element, or of the view when nothing is
  selected.

[Views and reference plans](views.md) explains the navigator and the views.

## Show and hide

Under **Visibility**, in the view's properties, are the model's **material families**, **IFC
classes** and **storeys**, with the number of elements in each. Untick one to hide those elements,
tick it again to show them. What you hide is kept with the view: the plan of a storey can hide the
footings while the 3D view shows everything.

The **View** tab switches **Edges** (++e++) and **Hatching** (++h++) on and off. Hatching is the pattern
drawn on each material: concrete stipple, timber grain, and so on.

## What next

- [Looking at a model](viewing.md): section box, measuring, properties.
- [Views and reference plans](views.md): plans, ceiling plans, sections, another office's drawing.
- [Storey plans](plans.md): draw a plan at scale.
- [Editing a model](editing.md): change a `.bimble` model.
