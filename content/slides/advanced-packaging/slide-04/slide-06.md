---
site:
  hide_toc: true
  hide_outline: true
---

# Including Generated Files

Some tools can generate files which should be ignored by Git, but included in the {term}`binary distribution`.

You can include these with `artifacts`:

:::{embed} #code:pyproject-file-wheel-inc
:::

`artifacts` are _not_ affected by `exclude`.
