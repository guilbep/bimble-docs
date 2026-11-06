# History: versions and variants

Bimble keeps the history of a `.bimble` model next to it: `house.bimble` keeps its history in
`house.bimble-history/`. Copy both and you copy the project with its whole history. There's no
server, and you don't need Git.

The ideas are Git's:

- a **commit** records the model as it is, with a message;
- a **branch** is a line of work, such as a variant with deeper beams;
- a **merge** brings two lines of work together.

The difference is that Bimble compares **building elements**, matched by GlobalId, not lines of
text.

## In the viewer

With a `.bimble` model open, click **Manage → History**.

- **No history yet:** type a message and click **Start history and commit**.
- **On a branch:** the window shows the branch and how many changes aren't committed. Type a
  message, then **Commit**. The model is saved before it is committed.
- **Branches:** **New branch** creates one from where you are and switches to it. **Switch** moves
  to another branch, and the model is replaced by its state there. **Merge** brings another branch
  into the current one.
- The log lists the commits, newest first, with date, author and message.

Switching and merging are refused while there are changes not committed: commit them, or undo them.

## From the command line

```sh
bimble history init frame.bimble
bimble history commit frame.bimble -m "First frame"
bimble set frame.bimble <GlobalId> height=650
bimble history status frame.bimble                 # what changed since the last commit
bimble history commit frame.bimble -m "Deeper beam"
bimble history log frame.bimble
bimble history diff frame.bimble HEAD~1 HEAD       # between two commits
bimble history diff frame.bimble HEAD~1            # between a commit and the file as it is
```

Variants:

```sh
bimble history branch frame.bimble deeper          # create a branch here
bimble history switch frame.bimble deeper          # the file becomes the branch's state
# … edit, commit …
bimble history switch frame.bimble main
bimble history merge frame.bimble deeper
bimble history branch frame.bimble                 # list the branches (* marks the current one)
```

A revision can be:

- a branch name;
- `HEAD`, the current commit;
- a commit hash, or its first 4 or more characters;
- any of these followed by `~n`, n commits back (`main~2`).

The author is `--author`, else `$BIMBLE_AUTHOR`, else your user name.

## How merging works

Elements, storeys and materials are matched by GlobalId. For each one:

- if only one side changed it since the two branches split, that change is kept: changed, added
  or removed;
- if both changed it, its **fields** are merged the same way. One side's new height and the
  other's new width are both kept;
- only a field that **both** sides changed differently is a **conflict**.

With conflicts nothing is merged. Bimble lists them, for example `element IfcBeam B1: generator.width`.
Decide which side wins with `--prefer ours` or `--prefer theirs`, or change the model on one
branch and merge again.

A merge whose result isn't a valid model is refused. For example, an element might sit on a storey
that the other branch removed.

When the current branch is simply behind, merging moves it forward with no merge commit
("fast-forward").

## Good to know

- `bimble history switch` refuses to drop changes that aren't committed. `--force` drops them.
- The history checks itself: every stored object is checked against its hash when read, and damage
  is reported instead of used.
- An element that didn't change between commits is stored once. A commit that renames one beam
  adds three small files.
- In a browser, the history isn't available yet.
