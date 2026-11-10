# Project information

The project's information is entered **once**, and every title block uses it: the client, the
architect, the project number, the phase…

## The page

**Project → Project information** (also in the **File** menu) (or "project" in the [command palette](window.md#the-command-palette))
opens it in the main view, with its own tab. It has sections:

| Section | Fields (their key) |
|---|---|
| Project | number (`project_number`), name (`project_title`), address, building, phase, status, end date |
| Client | client, address, e-mail, phone |
| Architect | architect, address, e-mail, phone |
| Engineer | engineering office (`engineer`), author, address |
| Contractor | contractor, address, e-mail, phone |
| Other | fields of your own: type a name ("Project manager") and **Add field**; its key is made from it (`project_manager`) |

A value is saved when you leave its field. Next to each field, its key in braces is what a title
block writes to show the value: `{client}`, `{project_number}`.

In a `.bimble` model this is a change of the model (undo, history). For an IFC, it goes in the views
file next to it; the IFC itself is not changed.

## In title blocks

A [plan template](../reference/plan-template.md)'s title block writes the value of any key in
braces. The default title block shows the project name and number, the client, and the sheet's
revision, drawn and checked fields.

Where a key has several values, the most specific wins:

1. a sheet's own fields (revision, drawn by…) and `--field` on the command line;
2. the project information;
3. the template's `fields`.

A known key with no value yet writes nothing; an unknown key stays as `{key}`, so a typo shows.

## In IFC exports

`bimble export-ifc` writes the project name (`project_title`) and phase in IfcProject's LongName and
Phase, the building in IfcBuilding's name, and every entry in a `Bimble_ProjectInformation`
property set on IfcProject.

## From the command line

```sh
bimble project model.bimble                                   # print it
bimble project model.bimble client="City of X" "Project number=P-001"
bimble project model.bimble client=                           # remove an entry
```
