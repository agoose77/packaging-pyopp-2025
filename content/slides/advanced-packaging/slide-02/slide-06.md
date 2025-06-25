---
site:
  hide_toc: true
  hide_outline: true
---

# Python is a detective

:::{tip} Python's import system is {span}`INSANE`
:class: span-col-rainbow

1. It runs a list of "finders" in `sys.meta_path`
2. It uses `sys.path_hooks` whilst searching `sys.path`

You can abuse this to e.g. import Jupyter Notebooks or import CSV files.
:::

Python runs some startup code that prepares `sys.path`.

This includes finding `.pth` files in known directories:

- These files can contain paths that are added to `sys.path`.
- They can _also_ contain `import` statements, and be (ab)used to run code at startup!
