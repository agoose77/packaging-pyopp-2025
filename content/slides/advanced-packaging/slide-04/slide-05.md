---
site:
  hide_toc: true
  hide_outline: true
---

# Controlling Included Files

You can specify _exactly_ which files to `include` and `exclude` in your distribution, e.g. for the {term}`source distribution`:

:::{embed} #code:pyproject-file-sdist-inc
:::

The `exclude` takes precedence, and `/` refers to the project root.

You can use exactly the same configuration for your {term}`binary distribution`.

Better to specify as little as possible.
