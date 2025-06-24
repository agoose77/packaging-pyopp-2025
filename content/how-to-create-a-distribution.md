---
title: How to Create a Package
short_title: Define a Package
kernelspec:
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

:::{tip} Objective
:label: tip:objective-how-to-create
We're going to learn how to create a distribution by using modern packaging standards and tools.
:::

We have already discussed that the main feature of a {term}`distribution package` is the _additional metadata_ like the author's contact details, and description. We will need to define this metadata so that it can be used to build the distribution. At this point, it is necessary to start talking about _packaging tools and standards_.

## Create your first package with Hatch

:::{note}
:label: note:one-way
If you're looking for _the way_ to build a package in Python, it doesn't exist. The landscape is always changing, and new tools come and go. In this workshop, I'm going to recommend "a way", and emphasise that ultimately it doesn't matter — a tool is a tool.
:::

All of this history is quite confusing. Understandably, people have built tools that hide all of this complexity, and provide additional features like environment management, tool support, etc. You need to make a choice about _which tool to use_. It's quite hard to make a choice without knowing how to compare the different options, so I'm going to suggest we use [Hatch](https://hatch.pypa.io/latest/). Ultimately, it's quite easy to switch between these tools, so don't worry about making the "perfect" choice. See the <xref:ppug#tutorials/packaging-projects> for more detail.

:::{exercise} Install Hatch
:label: ex:install-hatch

Install the `hatch` CLI using your preferred package manager. I recommend `pipx` or `uvx`, e.g.

```shell
pipx install hatch
```

:::

### Defining your project scaffolding

The most important file in modern Python packaging is the `pyproject.toml` file. It has three important sections:

:::{div}
:label: div:pyproject-toml-file

`[build-system]`
: A table to describe _which_ build backend to use.

`[project]`
: A table containing the basic metadata describing your project, e.g. its name.

`[tool]`
: A space for tool-specific configuration, such as code-formatters and type checkers.
:::

Any _modern_ Python {term}`build backend` _should_ understand the contents of the `[project]` table. The `hatch new` command makes it easy to get started with this:

```{code-cell} python3
:name: code:hatch-new
!hatch new arrow-to-knee
```

### Customising your `pyproject.toml`

Hatch has created several files and directories under a new directory `./arrow-to-knee/`. Let's first take a glance at the pyproject.toml:

```{code-cell} python3
:name: code:hatch-new-pyproject
!head arrow-to-knee/pyproject.toml
```

You can see that there's already some metadata here like the `[build-system]` table, and the required Python version. A helpful overview of these fields and their supported values is given in <xref:ppug#guides/writing-pyproject-toml>.

:::{exercise} Add your own project metadata
:label: ex:add-project-metadata

1. Use the `hatch new` command to create scaffolding for your project.
2. Use the <xref:ppug#guides/writing-pyproject-toml> guide to customise the new `pyproject.toml` file, e.g. by adding a short description.
   :::

## Upgrade an existing project to use Hatch

If you already have a Python package that was designed to use `setuptools`, hatch comes with an easy-to-use upgrade tool, `hatch new --init`:

```{code} shell
:label: code:hatch-init
hatch new --init
```

This command will ask you a few questions, and upgrade your project to use Hatch!

:::{tip} Ask for help!
:label: tip:ask-help
This is a fragile operation, and might not succeed. Feel free to ask for help
:::

:::{important} Important metadata to define
:label: important:metadata-to-define

1. Supported Python versions (lower bound)
2. Project license.
3. Necessary dependencies.
4. Build system
   :::

## Build your first distributions

With our basic project scaffolding, we have all the pieces required to build our first distributions! The `hatch build` command does everything we need:

```{code-cell}
:label: code:hatch-build
%%bash
cd ./arrow-to-knee
hatch build
```

We can look at these distributions just like we did in [](#cell:numpy-dirs)!

::::{important} Conclusion
:label: important:conclusion-how-to-create
We've learned that:

- Using tools like Hatch makes it easy to create project scaffolding
- How to build a {term}`source distribution` and {term}`binary distribution` with Hatch.
  ::::
