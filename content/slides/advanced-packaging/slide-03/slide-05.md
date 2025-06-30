---
site:
  hide_toc: true
  hide_outline: true
---

# How Do I Use `__version__` with `hatchling`?

First, set the `version` to be dynamic and _remove_ the `version` field:

:::{embed} #code:pyproject-ver-dync
:::

Then tell `hatchling` about the version source:

:::{embed} #code:pyproject-ver-source
:::

Now add `__version__` to `__init__.py`

:::{embed} #code:init-ver
:::
