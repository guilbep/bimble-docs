# Command line

`bimble` without arguments opens the viewer. Every command prints its own help with `--help`;
this page is that help, gathered. Models are `.ifc` or `.bimble` files unless a command says otherwise.

```text
Open-source structural BIM. Run without arguments to open the viewer.

Usage: bimble [COMMAND]

Commands:
  view           Open the 3D viewer (optionally with a .ifc or .bimble file)
  plan           Storey plan at scale, as PDF, SVG or PNG (by the output's extension)
  plan-template  Print the default plan template, or check a template file and print it in full
  style          Print the complete default graphic style, or check a style file and print it in full
  demo           Generate the demo concrete frame (2 storeys, 3×2 bays by default)
  info           Summary of a .bimble or .ifc file: counts, materials, triangles, load time
  ls             List elements (GlobalId, IFC class, name, generator)
  set            Change one generator parameter, e.g. `bimble set f.bimble <GlobalId> height=600 -o g.bimble`
  diff           Element-level diff between two .bimble files
  export-ifc     Export to IFC4
  history        Model history: commits, branches, log, diff and merge (kept in <model>-history/)
  bench          Measure rendering speed on this machine (generated models of 1k–50k elements, plus files)
  render         Render a .ifc or .bimble file to a PNG, without a window
  help           Print this message or the help of the given subcommand(s)

Options:
  -h, --help     Print help
  -V, --version  Print version
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
      --json               Machine-readable output
  -h, --help               Print help
```

## Drawings

### plan

```text
Storey plan at scale, as PDF, SVG or PNG (by the output's extension)

Usage: bimble plan [OPTIONS] --storey <STOREY> <FILE> <OUT>

Arguments:
  <FILE>  
  <OUT>   Output: .pdf, .svg or .png

Options:
      --dpi <DPI>            Resolution of a .png output, dots per inch [default: 150]
      --storey <STOREY>      Storey name (see `bimble info`)
      --scale <SCALE>        Scale 1:N, N from 1 to 5000 [default: 100]
      --paper <PAPER>        A4, A3, A2, A1 or A0; by default the smallest that fits
      --cut <CUT>            Height of the cut plane above the storey level, mm [default: 1200]
      --style <STYLE>        Graphic style file (colours, hatches, pens on paper; see `bimble style`)
      --project <PROJECT>    Project name in the title block (default: the file name)
      --template <TEMPLATE>  Plan template: title block, legend, texts, what is shown (see `bimble plan-template`)
      --field <KEY=VALUE>    A title block value, KEY=VALUE, used as {KEY} in the template (repeatable)
  -h, --help                 Print help
```

### plan-template

```text
Print the default plan template, or check a template file and print it in full

Usage: bimble plan-template [FILE]

Arguments:
  [FILE]  Template to check; without it, the default template is printed

Options:
  -h, --help  Print help
```

### style

```text
Print the complete default graphic style, or check a style file and print it in full

Usage: bimble style [FILE]

Arguments:
  [FILE]  Style file to check; without it, the default style is printed

Options:
  -h, --help  Print help
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
  -h, --help       Print help
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
  -h, --help  Print help
```

### export-ifc

```text
Export to IFC4

Usage: bimble export-ifc <FILE> <OUT>

Arguments:
  <FILE>  
  <OUT>   

Options:
  -h, --help  Print help
```

## History

See [History: versions and variants](../manual/history.md) for how it works.

### history init

```text
Start a history for a .bimble model

Usage: bimble history init <MODEL>

Arguments:
  <MODEL>  

Options:
  -h, --help  Print help
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
  -h, --help               Print help
```

### history status

```text
What changed since the last commit

Usage: bimble history status <MODEL>

Arguments:
  <MODEL>  

Options:
  -h, --help  Print help
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
  -h, --help  Print help
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
  -h, --help     Print help
```

### history switch

```text
Switch to a branch or commit: the model file is replaced by its state there

Usage: bimble history switch [OPTIONS] <MODEL> <REV>

Arguments:
  <MODEL>  
  <REV>    

Options:
      --force  Even when the model has changes not committed (they are lost)
  -h, --help   Print help
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
  -h, --help             Print help
```
