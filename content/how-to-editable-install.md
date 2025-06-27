---
title: How to Define Plugins
subtitle: Make your application extensible!
kernelspec:
  name: python3
  display_name: Python 3
---

:::{tip} Objective
:label: important:objective-editable-installs

- To learn about editable installs.
- To understand how editable installs work.
  :::

# Install your Package!

:::{important} Install your package!
:label: important:install-package

Installing your package means that you can interact with it!

Some packages _won't work_ if you do not install them, **even if you add their source code to `PYTHONPATH`**. E.g. `[project.scripts]`
:::

# But I am still developing...

Installing a package takes time and manual effort.

It's not convenient to keep re-installing it when you make changes

How can you see your changes in real-time?

# Install your package _editably_

`pip` can build and install _an {term}`editable wheel`_ for your package.

```{code} shell
:label: code:pip-install-edit
pip install -e .
```

:::{glossary}
:label: glossary:editable-wheel
Editable wheel
: A regular wheel file containing special file that enable editing of the package contents (using [PEP 660](https://peps.python.org/pep-0660/)).
:::

# Inspecting an Editable Wheel

```{code-cell} python3
:tags: [remove-cell]

import os
import pathlib
import tempfile
path = os.getcwd()
tmp_path = pathlib.Path(tempfile.mkdtemp())
link_src = pathlib.Path(path).parents[3] / "arrow-to-knee"
package_path = (tmp_path / link_src.name)
package_path.symlink_to(link_src)
os.chdir(package_path)

os.environ['HATCH_INTERACTIVE'] = '0'
```

We can build this wheel by hand:

```{code-cell} python3
:label: code:build-editable
!hatch build -t wheel:editable .
```

It contains very little!:whl

```{code-cell} python3
:label: code:zipinfo-editable
!zipinfo ./arrow_to_knee*.whl
```

# Python is a detective

:::{tip} Python's import system is {span}`INSANE`
:label: tip:import-insane
:class: span-col-rainbow

1. It runs a list of "finders" in `sys.meta_path`
2. It uses `sys.path_hooks` whilst searching `sys.path`

You can abuse this to e.g. import Jupyter Notebooks or import CSV files.
:::

Python runs some startup code that prepares `sys.path`.

This includes finding `.pth` files in known directories:

- These files can contain paths that are added to `sys.path`.
- They can _also_ contain `import` statements, and be (ab)used to run code at startup!

:::{important} Conclusion
:label: important:conclusion-editable-installs

We have learned that:

- Build backends like `hatchling` can build regular and {term}`editable wheel` distributions.
- Editable wheels make it possible to edit code after installation.
- Python's import system is astronomically _cool_.
- But we should probably never use it like that 😭.
  :::
