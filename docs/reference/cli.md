# Command line

`bimble` without arguments opens the viewer. Every command prints its own help with `--help`;
this page is that help, gathered. Models are `.ifc` or `.bimble` files unless a command says otherwise.

```text
Open-source structural BIM. Run without arguments to open the viewer.

Usage: bimble [OPTIONS] [COMMAND]

Commands:
  view           Open the 3D viewer (optionally with a .ifc or .bimble file)
  plan           A storey plan or any view (ceiling plan, section) at scale, as PDF, SVG or PNG (by extension)
  plan-template  Print the default plan template, or check a template file and print it in full
  style          Print the complete default graphic style, or check a style file and print it in full
  demo           Generate the demo concrete frame (2 storeys, 3×2 bays by default)
  info           Summary of a .bimble or .ifc file: counts, materials, triangles, load time
  views          List the views of a model (plans, ceiling plans, sections), for `plan --view`
  sheets         List the sheets of a model (number, name, paper, the views placed on them)
  project        Project information (ADR 0030): print it, or set entries with KEY=VALUE (an empty VALUE removes the entry). Title blocks show each value where they say {KEY}
  schedules      List the schedules (columns, beams, slabs, walls, footings by material) and their counts
  schedule       A schedule as a table: each element measured (section, length, area, volume), grouped by level with subtotals; printed, or written as CSV for a spreadsheet
  sheet          Draw a sheet (its views at their scales, title block, legend) as PDF, SVG or PNG
  sheet-new      Add a sheet with views laid out side by side, e.g. `bimble sheet-new m.bimble --name Plans --place "Plan Level 1:100" --place "Section 1:50"`. Saved in the .bimble file, or in the side file of an IFC
  ls             List elements (GlobalId, IFC class, name, generator)
  set            Change one generator parameter, e.g. `bimble set f.bimble <GlobalId> height=600 -o g.bimble`
  diff           Element-level diff between two .bimble files
  export-ifc     Export to IFC4
  import-ifc     Convert an IFC file into an editable .bimble model (ADR 0032)
  history        Model history: commits, branches, log, diff and merge (kept in <model>-history/)
  pack           A file to share for viewing (.bimbleview) from a .ifc or .bimble: opens without parsing the IFC, read-only, also in a browser (ADR 0040)
  bench          Measure rendering speed on this machine (generated models of 1k–50k elements, plus files)
  render         Render a .ifc or .bimble file to a PNG, without a window
  help           Print this message or the help of the given subcommand(s)

Options:
  -v, --verbose...  More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help        Print help
  -V, --version     Print version
```

## Viewing

### view

```text
Open the 3D viewer (optionally with a .ifc or .bimble file)

Usage: bimble view [OPTIONS] [FILE]

Arguments:
  [FILE]  

Options:
      --style <STYLE>  Graphic style file (JSON; see `bimble style`)
      --link <LINK>    Another model to show as a reference (e.g. the architect's IFC), to compare
  -v, --verbose...     More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help           Print help
```

### render

```text
Render a .ifc or .bimble file to a PNG, without a window

Usage: bimble render [OPTIONS] <FILE> <OUT>

Arguments:
  <FILE>  
  <OUT>   

Options:
      --width <WIDTH>          [default: 1600]
      --height <HEIGHT>        [default: 1000]
      --azimuth <AZIMUTH>      Camera direction in degrees around the vertical axis [default: -55]
      --elevation <ELEVATION>  Camera elevation in degrees above the horizon [default: 28]
      --ortho                  Orthographic projection instead of perspective
      --hide <HIDE>            Material families to hide, comma-separated (e.g. earth,glass)
      --samples <SAMPLES>      MSAA samples (1 or 4) [default: 4]
      --style <STYLE>          Graphic style file (JSON; see `bimble style`)
      --clip <CLIP>            Section box in model coordinates (mm): x0,y0,z0,x1,y1,z1. Only what is inside is drawn; cut solids show their cut surface
  -v, --verbose...             More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help                   Print help
```

### info

```text
Summary of a .bimble or .ifc file: counts, materials, triangles, load time

Usage: bimble info [OPTIONS] <FILE>

Arguments:
  <FILE>  

Options:
      --elements-json  Print one JSON object per element (GlobalId, class, volume, world bounding box in mm)
  -v, --verbose...     More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help           Print help
```

### bench

```text
Measure rendering speed on this machine (generated models of 1k–50k elements, plus files)

Usage: bimble bench [OPTIONS] [FILES]...

Arguments:
  [FILES]...  Extra .ifc / .bimble files to benchmark

Options:
      --frames <FRAMES>    [default: 120]
      --width <WIDTH>      [default: 1920]
      --height <HEIGHT>    [default: 1080]
      --samples <SAMPLES>  MSAA samples (1 or 4; the viewer uses 4) [default: 4]
      --quick              Only the smallest generated model
      --occlusion          With occlusion culling (the viewer turns it on when the GPU is slow)
      --proxies <PROXIES>  Draw far cells' simplified stand-ins when their error spans at most this many pixels (0: never) [default: 0]
      --gpu-occlusion      With occlusion culling by GPU queries (last frame's answers; native backends)
      --gpu-cull           Cull shape copies on the GPU (compute shaders, indirect draws)
      --json               Machine-readable output
  -v, --verbose...         More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help               Print help
```

### pack

Writes a [file to share for viewing](../manual/viewing.md#share-for-viewing): the scene, compressed, each repeated shape once; read-only, no property sets.

```text
A file to share for viewing (.bimbleview) from a .ifc or .bimble: opens without parsing the IFC, read-only, also in a browser (ADR 0040)

Usage: bimble pack [OPTIONS] <INPUT> <OUT>

Arguments:
  <INPUT>  
  <OUT>    

Options:
      --no-gzip     Leave it uncompressed (gzip is about half the size)
  -v, --verbose...  More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help        Print help
```

## Drawings

### plan

```text
A storey plan or any view (ceiling plan, section) at scale, as PDF, SVG or PNG (by extension)

Usage: bimble plan [OPTIONS] <FILE> <OUT>

Arguments:
  <FILE>  
  <OUT>   Output: .pdf, .svg or .png

Options:
      --dpi <DPI>            Resolution of a .png output, dots per inch [default: 150]
      --storey <STOREY>      Storey name (see `bimble info`)
      --view <VIEW>          Draw a view instead (a plan with its view range, a ceiling plan, a section) by name, e.g. "Ceiling Level 1"; `bimble views` lists them
      --scale <SCALE>        Scale 1:N, N from 1 to 5000 [default: 100]
      --paper <PAPER>        A4, A3, A2, A1 or A0; by default the smallest that fits
      --cut <CUT>            Height of the cut plane above the storey level, mm [default: 1200]
      --style <STYLE>        Graphic style file (colours, hatches, pens on paper; see `bimble style`)
      --project <PROJECT>    Project name in the title block (default: the file name)
      --template <TEMPLATE>  Plan template: title block, legend, texts, what is shown (see `bimble plan-template`)
      --field <KEY=VALUE>    A title block value, KEY=VALUE, used as {KEY} in the template (repeatable)
  -v, --verbose...           More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help                 Print help
```

### views

```text
List the views of a model (plans, ceiling plans, sections), for `plan --view`

Usage: bimble views [OPTIONS] <FILE>

Arguments:
  <FILE>  

Options:
  -v, --verbose...  More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help        Print help
```

### sheets

```text
List the sheets of a model (number, name, paper, the views placed on them)

Usage: bimble sheets [OPTIONS] <FILE>

Arguments:
  <FILE>  

Options:
  -v, --verbose...  More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help        Print help
```

### sheet

```text
Draw a sheet (its views at their scales, title block, legend) as PDF, SVG or PNG

Usage: bimble sheet [OPTIONS] <FILE> <NUMBER> <OUT>

Arguments:
  <FILE>    
  <NUMBER>  Sheet number, e.g. S-101 (see `bimble sheets`)
  <OUT>     Output: .pdf, .svg or .png

Options:
      --dpi <DPI>            Resolution of a .png output, dots per inch [default: 150]
      --style <STYLE>        Graphic style file (see `bimble style`)
      --template <TEMPLATE>  Plan template: title block, legend, texts (see `bimble plan-template`)
      --project <PROJECT>    Project name in the title block (default: the file name)
  -v, --verbose...           More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help                 Print help
```

### sheet-new

```text
Add a sheet with views laid out side by side, e.g. `bimble sheet-new m.bimble --name Plans --place "Plan Level 1:100" --place "Section 1:50"`. Saved in the .bimble file, or in the side file of an IFC

Usage: bimble sheet-new [OPTIONS] --name <NAME> <FILE>

Arguments:
  <FILE>  

Options:
      --name <NAME>      
      --number <NUMBER>  Sheet number; by default the next free one (S-101, S-102…)
      --paper <PAPER>    A4, A3, A2, A1 or A0 [default: A1]
      --portrait         
      --place <VIEW:N>   A view and its scale, VIEW:N (repeatable, placed left to right)
  -v, --verbose...       More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help             Print help
```

### schedules

```text
List the schedules (columns, beams, slabs, walls, footings by material) and their counts

Usage: bimble schedules [OPTIONS] <FILE>

Arguments:
  <FILE>  

Options:
  -v, --verbose...  More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help        Print help
```

### schedule

```text
A schedule as a table: each element measured (section, length, area, volume), grouped by level with subtotals; printed, or written as CSV for a spreadsheet

Usage: bimble schedule [OPTIONS] <FILE> <NAME>

Arguments:
  <FILE>  
  <NAME>  Schedule name, e.g. "Concrete columns" (see `bimble schedules`)

Options:
      --csv <CSV>   Write CSV here instead of printing a table
  -v, --verbose...  More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help        Print help
```

### project

```text
Project information (ADR 0030): print it, or set entries with KEY=VALUE (an empty VALUE removes the entry). Title blocks show each value where they say {KEY}

Usage: bimble project [OPTIONS] <FILE> [SET]...

Arguments:
  <FILE>    
  [SET]...  KEY=VALUE, e.g. client="City of X" project_number=P-001 (repeatable)

Options:
  -v, --verbose...  More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help        Print help
```

### plan-template

```text
Print the default plan template, or check a template file and print it in full

Usage: bimble plan-template [OPTIONS] [FILE]

Arguments:
  [FILE]  Template to check; without it, the default template is printed

Options:
  -v, --verbose...  More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help        Print help
```

### style

```text
Print the complete default graphic style, or check a style file and print it in full

Usage: bimble style [OPTIONS] [FILE]

Arguments:
  [FILE]  Style file to check; without it, the default style is printed

Options:
  -v, --verbose...  More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help        Print help
```

## Models

### demo

```text
Generate the demo concrete frame (2 storeys, 3×2 bays by default)

Usage: bimble demo [OPTIONS] <OUT>

Arguments:
  <OUT>  

Options:
      --bays-x <BAYS_X>    [default: 3]
      --bays-y <BAYS_Y>    [default: 2]
      --storeys <STOREYS>  [default: 2]
  -v, --verbose...         More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help               Print help
```

### ls

```text
List elements (GlobalId, IFC class, name, generator)

Usage: bimble ls [OPTIONS] <FILE>

Arguments:
  <FILE>  

Options:
      --class <CLASS>  Filter by IFC class, e.g. IfcBeam
  -v, --verbose...     More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help           Print help
```

### set

```text
Change one generator parameter, e.g. `bimble set f.bimble <GlobalId> height=600 -o g.bimble`

Usage: bimble set [OPTIONS] <FILE> <ID> <ASSIGNMENT>

Arguments:
  <FILE>        
  <ID>          
  <ASSIGNMENT>  key=value (numeric)

Options:
  -o, --out <OUT>   
  -v, --verbose...  More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help        Print help
```

### diff

```text
Element-level diff between two .bimble files

Usage: bimble diff [OPTIONS] <A> <B>

Arguments:
  <A>  
  <B>  

Options:
      --json        
  -v, --verbose...  More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help        Print help
```

### export-ifc

```text
Export to IFC4

Usage: bimble export-ifc [OPTIONS] <FILE> <OUT>

Arguments:
  <FILE>  
  <OUT>   

Options:
  -v, --verbose...  More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help        Print help
```

### import-ifc

Converts an IFC file (IFC2x3 / IFC4 / IFC4x3) into an editable `.bimble` model. Every element
with a shape comes along with its GlobalId, storey and material. Columns, beams, slabs, walls and
footings with rectangular sections come back as parametric elements, other extrusions as polygon
generators, and explicit meshes as mesh elements; elements of other classes become
`IfcBuildingElementProxy` keeping their class name. The file is binary; an `<OUT>` ending in
`.json` writes JSON text. Openings (`IfcOpeningElement`) are kept on the element and cut out of the mesh; property
sets are imported as text values (`Pset/Property`); everything else is reported, never dropped
silently.

```text
Convert an IFC file into an editable .bimble model (ADR 0032)

Usage: bimble import-ifc [OPTIONS] <FILE> <OUT>

Arguments:
  <FILE>  
  <OUT>   

Options:
  -v, --verbose...  More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help        Print help
```

Example report:

```text
→ frame.bimble
73 elements (73 parametric, 0 extruded polygons, 0 meshes)
  IfcBeam: 34
  IfcColumn: 25
  IfcFooting: 12
  IfcSlab: 2
  openings: 33 cut on import (as meshes, subtracted at draw time)
  property values: 410
```

## History

See [History: versions and variants](../manual/history.md) for how it works.

### history init

```text
Start a history for a .bimble model

Usage: bimble history init [OPTIONS] <MODEL>

Arguments:
  <MODEL>  

Options:
  -v, --verbose...  More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help        Print help
```

### history commit

```text
Record the model as it is now

Usage: bimble history commit [OPTIONS] --message <MESSAGE> <MODEL>

Arguments:
  <MODEL>  

Options:
  -m, --message <MESSAGE>  
      --author <AUTHOR>    Default: $BIMBLE_AUTHOR, else $USER
  -v, --verbose...         More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help               Print help
```

### history status

```text
What changed since the last commit

Usage: bimble history status [OPTIONS] <MODEL>

Arguments:
  <MODEL>  

Options:
  -v, --verbose...  More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help        Print help
```

### history log

```text
Commits, newest first

Usage: bimble history log [OPTIONS] <MODEL> [REV]

Arguments:
  <MODEL>  
  [REV]    Branch, commit (or prefix) or HEAD~n [default: HEAD]

Options:
  -n, --limit <LIMIT>  [default: 20]
  -v, --verbose...     More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help           Print help
```

### history diff

```text
Changes between two revisions; with one, between it and the model as it is now

Usage: bimble history diff [OPTIONS] <MODEL> <A> [B]

Arguments:
  <MODEL>  
  <A>      
  [B]      

Options:
      --json        
  -v, --verbose...  More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help        Print help
```

### history branch

```text
List branches, or create one at HEAD (or at --at)

Usage: bimble history branch [OPTIONS] <MODEL> [NAME]

Arguments:
  <MODEL>  
  [NAME]   

Options:
      --at <AT>     
  -v, --verbose...  More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help        Print help
```

### history switch

```text
Switch to a branch or commit: the model file is replaced by its state there

Usage: bimble history switch [OPTIONS] <MODEL> <REV>

Arguments:
  <MODEL>  
  <REV>    

Options:
      --force       Even when the model has changes not committed (they are lost)
  -v, --verbose...  More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help        Print help
```

### history merge

```text
Merge a branch or commit into the current branch (object by object, by GlobalId)

Usage: bimble history merge [OPTIONS] <MODEL> <REV>

Arguments:
  <MODEL>  
  <REV>    

Options:
      --prefer <PREFER>  When both sides changed the same object: keep ours or theirs instead of stopping [possible values: ours, theirs]
      --author <AUTHOR>  
  -v, --verbose...       More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help             Print help
```

### Working together

Through a shared folder: see [Working together](../manual/history.md#working-together).

### history remote

```text
Show the shared folder this history synchronizes with, or set it

Usage: bimble history remote [OPTIONS] <MODEL> [DIR]

Arguments:
  <MODEL>  
  [DIR]    

Options:
  -v, --verbose...  More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help        Print help
```

### history clone

```text
A new local copy of a shared history (its folder) as a model file

Usage: bimble history clone [OPTIONS] <REMOTE> <MODEL>

Arguments:
  <REMOTE>  
  <MODEL>   

Options:
      --branch <BRANCH>  [default: main]
  -v, --verbose...       More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help             Print help
```

### history push

```text
Send the current branch to the remote (refused unless it only adds to it)

Usage: bimble history push [OPTIONS] <MODEL>

Arguments:
  <MODEL>  

Options:
      --author <AUTHOR>  Your e-mail. Default: $BIMBLE_AUTHOR, else $USER
  -v, --verbose...       More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help             Print help
```

### history sync

```text
Fetch, merge and push; give back your borrowed elements

Usage: bimble history sync [OPTIONS] <MODEL>

Arguments:
  <MODEL>  

Options:
      --prefer <PREFER>  When both changed the same field: keep ours or theirs instead of stopping [possible values: ours, theirs]
      --author <AUTHOR>  
  -v, --verbose...       More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help             Print help
```

### history borrow

```text
Borrow elements (GlobalIds) before changing them, so others are warned

Usage: bimble history borrow [OPTIONS] <MODEL> [IDS]...

Arguments:
  <MODEL>   
  [IDS]...  

Options:
      --author <AUTHOR>  
  -v, --verbose...       More messages on stderr: -v what is loaded and how long it took, -vv each step, -vvv the libraries' too. Errors and warnings are always shown
  -h, --help             Print help
```
