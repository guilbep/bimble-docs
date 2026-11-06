# Materials

**Manage → Materials** opens the material browser in the main view, like Revit's.

## The browser

- **Left**: the model's materials, with a search box, their family's colour and how many elements
  are made of each. Below, the **library**.
- **Right**, for the material chosen:
    - **Identity**: name, family (concrete, steel, timber…), IFC category;
    - **Properties**: density (kg/m³), modulus E (MPa), characteristic strength (MPa) and where the
      values come from;
    - **Graphics**: how its family is drawn, from the [standards](styles.md): the colour on screen,
      the hatch where cut and where seen. **Edit in the standards** opens them on that family.

In a `.bimble` model, every change is a change of the model (undo, history). Dragging a value is one
step. **Use the values of C30/37** copies the library's values for the grade the name refers to;
**Clear the values** removes them.

An IFC's materials are listed read only: their values are those of the library grade their name
refers to.

## The library

Standard grades, with the values of the tables they come from:

| Grades | Values |
|---|---|
| Concrete C20/25 … C50/60 | fck and Ecm from EN 1992-1-1 Table 3.1; 2500 kg/m³ (25 kN/m³, EN 1991-1-1) |
| Structural steel S235, S275, S355, S460 | fy (t ≤ 40 mm) from EN 1993-1-1; E = 210 GPa; 7850 kg/m³ |
| Reinforcement B500B | fyk = 500 MPa; Es = 205 GPa (SIA 262) |
| Timber C24 | fm,k, E0,mean, ρmean from EN 338 |
| Glulam GL24h, GL28h, GL32h | fm,g,k, E0,g,mean, ρg,mean from EN 14080 |

They are a starting point: check them against the standard your project uses. **Add** puts a grade
in the model's materials.

A material's name finds its grade: "C30/37", "S235(R)", "Steel S355 J2", "GL24h 24x46".

## Where the values are used

- **Schedules**: the Mass column is volume × density ([schedules](schedules.md)).
- **IFC exports**: `Pset_MaterialCommon.MassDensity`, `Pset_MaterialMechanical.YoungModulus`, and
  `Pset_MaterialConcrete.CompressiveStrength` or `Pset_MaterialSteel.YieldStress`, in SI units.
