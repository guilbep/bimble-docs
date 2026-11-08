# Questions

## Can I edit an IFC file?

Not in place. IFC files open for viewing, plans and comparison. Bimble edits its own `.bimble`
models, which it can export to IFC4 (`bimble export-ifc`). An IFC now converts into an editable
`.bimble` model on the command line (`bimble import-ifc model.ifc model.bimble`); the viewer gets
an "Import IFC as editable copy…" entry in a coming release.

## Where are my files sent?

Nowhere. The desktop program works offline, and the browser version reads files inside the page
without uploading them.

## A wall shows no opening, or the Warnings list "opening(s) not cut"

The wall's geometry in the file isn't a closed solid, so the opening can't be cut out of it. The
wall is drawn uncut rather than guessed at. The warning names the element's class.

## My plan doesn't fit the paper

Bimble suggests the scale that fits. You can also choose a bigger paper, or leave **Paper** on
**Smallest that fits**. Grid axes, dimensions and the legend take room around the drawing:
switching them off makes room.

## The plan shows things I don't want

Add their IFC classes to `hidden_classes` in a [plan template](../reference/plan-template.md).
Terrain, reinforcement, spaces and openings are hidden by default.

## North is wrong in the view cube

The cube's north is +Y of the model. The IFC "true north" isn't read yet.

## Something doesn't work

Open an [issue](https://github.com/guilbep/bimble/issues). Say which file type, how big it is,
your system and browser, and what you saw. Please don't attach client files to public issues.
