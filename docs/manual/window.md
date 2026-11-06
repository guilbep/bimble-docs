# The window

![The window: title row, ribbon, project browser, view tabs, the drawing, the Standards panel](../images/window.png)

From top to bottom:

- **Title row**: the file (a • after its name when something isn't saved), **Open…**, **Save**,
  **Undo**, **Redo**, and **Type a command… Ctrl K**.
- **Ribbon**: tabs of tools, in named groups. A tool that is on looks pressed; one that can't be
  used now is grey. Its tooltip gives its name and key.
- **Left**: the project browser (views, layouts, objects, links), and under it the properties of
  what is selected, else of the view. While you place an element, they show its storey and sizes.
- **Tabs** of the views and sheets you opened, over the drawing. Click one to go back to it; **×**
  or a middle click closes it.
- **Right**: the [Standards](styles.md) panel, when open.
- **Status bar**: what a click does now (place a column, measure, add a text…), the state chips
  (below), then the counts.

## The ribbon

| Tab | Groups and tools |
|---|---|
| **Model** | *Place*: Column, Beam, Wall, Slab ([editing](editing.md)). *Inspect*: Measure |
| **Annotate** | *On the sheet*: Select, Text, Dimension, and the text and dimension types they use ([sheets](sheets.md)). *On plans*: Section labels, Openings, Section marks, Levels ([plans](plans.md#what-a-plan-shows)) |
| **View** | *Show*: Edges, Hatching, Orthographic. *Cut*: Section box, Box to selection. *Camera*: Fit all, Top |
| **Sheets** | New sheet, Close sheet; *Export*: On paper… ([plans](plans.md)) |
| **Links** | Model… ([linked models](linked-models.md)), Reference plan… ([views](views.md)) |
| **Manage** | Graphic standards ([styles](styles.md)), Project information ([project](project.md)), Materials ([materials](materials.md)), History ([history](history.md)) |

## Nothing implicit

What Bimble is doing that isn't its default is always written on screen, with a way back:

- **State chips**, in the status bar: *Placing: column*, *Measuring*, *Sheet tool: dimension*,
  *Section box*, *Edges off*, *Hatching off*, *Orthographic*, *Hidden: 2 classes, 1 storey*,
  *3 measurements*, *Plan options changed*. Click a chip's **×** to go back to the default; its
  tooltip says what that does (for *Hidden*, everything is shown again and saved with the view).
- **Not saved**: the title row says what isn't saved, in words: *Not saved: model, standards*.
- **Undo** and **Redo** say what they would do ("Undo: move P1"), and are greyed when there is
  nothing to undo. **Save** says what it saves.
- **Closing** with something not saved asks: **Save and close**, **Close without saving**, or
  **Cancel**. In a browser, leaving the page asks too.
- **Reset to default…** in the standards asks first; **Revert** goes back to the style file as
  loaded or saved.

## The command palette

++ctrl+k++, or the button at the top right, opens the **command palette**. Type part of a command
("sec box", "dim", "col") and press ++enter++, or click it. Each command shows its ribbon tab and
its key. ++up++ and ++down++ move, ++esc++ or a click outside closes it. Every tool of the
ribbon is there, and so is every view ("Go to Plan Level 1"), sheet and schedule.
