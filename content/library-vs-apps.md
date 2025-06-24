---
title: Applications vs Libraries
short_title: Apps vs Libraries
subtitle: Users have different expectations of applications and libraries.
---

## Background on dependency hell

"Recently", a tool called Poetry became popular with Python users. It made developing Python packages much easier, and made some strong decisions about user intent. One of these decisions was about package _constraints_ — Poetry introduced _upper bounds_ by default, e.g.

```{code} toml
:filename: pyproject.toml
[project]
dependencies = [
   "numpy>=2.0,<3.0"
]
```

If the user is installing _only_ your package, this isn't a problem. But what about when users are installing _lots_ of packages. As the number of packages {math}`N\rightarrow \infty`, there will be many constraints. What happens when constraints overlap?

:::{note} Overlapping constraints
:label: note:overlap-constraints

If we have `numpy>=1` and `numpy<2` constraints, they form a new constraint `numpy>=1,<2`. What about incompatible constraints, e.g. `numpy>=2` and `numpy<1`? This is _unsolveable_.
:::

Certain tools like `poetry` and `pdm` may encounter incompatible contraints. When this happens, they will often try to use {term}`backsolving` in order to find a version of the packages that doesn't impose this constraint.

:::{glossary}
Backsolving
: The process of looking at increasingly older package versions to find looser constraints.
:::

:::{note} Backsolving
:label: note:Backsolving
:
When people write packages, they often start with "permissive" uncapped dependencies, e.g.

```{code}
numpy >= 1
```

Then, they discover that a new version of their dependency is incompatible with their package. So, they release a new version that introduces an upper cap:

```
numpy < 2
```

:::
