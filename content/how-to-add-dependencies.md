---
title: How to Add Dependencies
subtitle: Sometimes you need to use other peoples code!
_kernelspec:
  name: python3
  display_name: Python
---

```{code-cell} python3
:tags: [remove-cell]

import os, tempfile
# Disable Hatch colour
os.environ['NO_COLOR']='1'
os.chdir(tempfile.mkdtemp())
```

::::{tip} Objective
:label: tip:objective-how-to-depend
We're going to learn how to define dependencies and optional-dependencies in `pyproject.toml`.
::::

## Required dependencies

If you've used Python for a while, you have probably seen `requirements.txt` files. These are commonly used with tools like `pip`, which treats the file as a list of necessary dependencies. Since [PEP 621](https://peps.python.org/pep-0621/#abstract), it is possible to define your dependencies directly in `pyproject.toml`. For example, to require NumPy:

```{code} toml
:filename: pyproject.toml
:emphasize-lines: 3
:linenos: true
:label: code:pyproject

[project]
dependencies = [
  "numpy"
]
```

You can add [additional constraints](xref:ppug#specifications/dependency-specifiers) here, such as a minimum version:

```{code} toml
:filename: pyproject.toml
:emphasize-lines: 3
:linenos: true
:label: code:pyproject-env

[project]
dependencies = [
  "numpy>=2"
]
```

Or specify packages that are only required for certain versions of Python:

```{code} toml
:filename: pyproject.toml
:emphasize-lines: 3
:linenos: true
:label: code:pyproject-env

[project]
dependencies = [
  "numpy<2;python_version<\"3.12\""
]
```

## Optional dependencies

Sometimes, you don't _need_ a dependency for all of your package's features. For example, you might have some plotting routines that need `matplotlib`. The `pyproject.toml` specification defines an `optional-dependencies` table:

```{code} toml
:filename: pyproject.toml
:emphasize-lines: 2
:linenos: true
:label: code:pyproject-opt-dep

[project.optional-dependencies]
plot = ["matplotlib"]
```

Users can then request these extra dependencies when installing your package:

```{code} shell
pip install arrow-to-knee[plot]
```

:::{tip} Why use `optional-dependencies`?
:label: tip:why-optional

You might wonder why this is useful? Why don't users just install these dependencies manually? There are several reasons:

1. Users have less to type and remember — a single extra token required (e.g. `plot`) when installing your package.
2. Authors can impose necessary constraints!
   :::

::::{important} Conclusion
:label: important:conclusion-how-to-depend
We've learned that:

- You can define the packages that your package depends upon in `pyproject.toml`
- You can add _specifiers_ to your dependencies for more control
  ::::
