---
site:
  hide_toc: true
  hide_outline: true
---

# How Do I Build a Dynamic README?

First, add `hatch-fancy-pypi-readme` to your `[build-system]` table:

:::{embed} #code:pyproject-fancy
:::
Then tell `hatchling` about the dynamic readme and _remove_ the `readme` field:

:::{embed} #code:pyproject-dynamic
:::
