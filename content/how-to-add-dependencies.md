---
title: How to Add Dependencies
subtitle: Sometimes you need to use other peoples code!
---

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
:label: code:pyproject-min

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

(sec:optional-dependencies)=

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

## Dependency groups

When you start using Python packages to help _develop_ your package, such as the `ruff` code formatter, you will want to deifne that these packages are a required development tool. Historically, people have used `project.optional-dependencies` for this, so you'll often see something like the following:

```{code} shell
:label: code:install-dev-extra
pip install arrow-to-knee[dev]
```

Recently, Python gained the ability to define _dependency groups_. They are defined very similarly to @sec:optional-dependencies:

```{code} toml
:filename: pyproject.toml
[dependency-groups]
dev = ["pytest", "requests"]
```

These are _not_ installed when a _user_ installs your package, but they _are_ understood by tools like `pip`. For example, if you execute the following in the same directory as `pyproject.toml`:

```{code} shell
:label: code:install-dep-group
pip install --group dev
```

It will install the packages from the `dev` dependency group!
`
::::{important} Conclusion
:label: important:conclusion-how-to-depend
We've learned that:

- You can define the packages that your package depends upon in `pyproject.toml`.
- You can add _specifiers_ to your dependencies for more control.
- You can define development dependencies in `dependency-groups`.
  ::::
