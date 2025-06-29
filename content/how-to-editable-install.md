---
title: How Editable Installs Work
subtitle: The magic behind pip's -e
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

Installing a package takes time and manual effort, but it's an important part of using someone elses software; Python packages are _not_ just Python code that we can add to the `PYTHONPATH`, they're meant to be installed to be used. But, it's not convenient to keep re-installing it when you make changes; seeing the result of the edits to your code goes from a simple file-save to running a shell command. How can you see your changes in real-time?

:::{important} Install your package!
:label: important:install-package

Installing your package means that you can interact with it!

Some packages _won't work_ if you do not install them, **even if you add their source code to `PYTHONPATH`**. E.g. `[project.scripts]`
:::

# Install your package _editably_

:::{glossary}
:label: glossary:editable-wheel
Editable wheel
: A regular wheel file containing special file that enable editing of the package contents (using [PEP 660](https://peps.python.org/pep-0660/)).
:::
The solution, as ever, can be found in `pip`. `pip` can build and install _an {term}`editable wheel`_ for your package, using `-e`:

```{code} shell
:label: code:pip-install-edit
pip install -e .
```

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

```{code-cell} python3
:label: code:build-editable
!hatch build -t wheel:editable .
```

It contains very little!

```{code-cell} python3
:label: code:zipinfo-editable
!zipinfo ./arrow_to_knee*.whl
```

What do we see here that's not familiar to us thus far? It's the `/_arrow_to_knee.pth` file. More on that in a moment.

# Python is a detective

To go any further, we are going to need to understand a little bit about how Python `import` statements actually work. We're _not_ going to dig into the line-by-line account of what Python is doing under the hood, but we _are_ going to appreciate how extensible and powerful this part of the interpreter is.

:::{tip} Python's import system is {span}`INSANE`
:label: tip:import-insane
:class: span-col-rainbow

1. It runs a list of "finders" in `sys.meta_path`
2. It uses `sys.path_hooks` whilst searching `sys.path`

You can abuse this to e.g. import Jupyter Notebooks or import CSV files.
:::

At startup, Python runs some code that prepares `sys.path`. This includes finding `.pth` files in known directories, and processing them according to some rules:

- `.pth` files can contain paths that are added to `sys.path`.
- They can _also_ contain `import` statements, which are `exec` by the interpreter.

The latter feature is somewhat incredible — one can use `.pth` files (slightly in poor form) to write code that runs at Python startup!

{term}`Editable wheel` packages are designed around this `.pth` mechanism — they are designed to ship a `.pth` file that either exposes the source directory, or runs some code that handles this slightly more explicitly.

:::{important} Conclusion
:label: important:conclusion-editable-installs

We have learned that:

- Build backends like `hatchling` can build regular and {term}`editable wheel` distributions.
- Editable wheels make it possible to edit code after installation.
- Python's import system is astronomically _cool_.
- But we should probably never use it like that 😭.
  :::
