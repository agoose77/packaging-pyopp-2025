---
title: How Dynamic Metadata are Defined
subtitle: The secret to setting your version in a Python file
kernelspec:
  name: python3
  display_name: Python 3
---

:::{tip} Objective
:label: important:objective-dynamic-metadata

- To learn how package metadata can be dynamic.
- To look at dynamic package versions and descriptions.
- To understand build-system dependencies.
  :::

# Defining a Static Version

`pyproject.toml` has certain fields that are _required_, which are described in the Python Packaging Guide:

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-required-static
[project]
name = "arrow-to-knee" # required!
version = "1.0.0"      # required!
```

As a {term}`build front end`, Hatch provides a nice CLI to find out the current package version:

```{code} shell
:label: code:hatch-version-get
$ hatch version
1.0.0
```

You can also use this sub-command to set the version:

```{code} shell
:label: code:hatch-version-set
$ hatch version 2.0.0
Old: 1.0.0
New: 2.0.0
```

By default, this will update the `pyproject.toml`:

```{code} shell
:label: code:pyproject-hatch-version-set
:filename: pyproject.toml
[project]
name = "arrow-to-knee" # required!
version = "2.0.0"      # required!
```

# What About the `__version__` Name?

Some people prefer to define their version in a `__version__` global variable in their {term}`import package`. The `__version__` variable is a _convention_ (not a _standard_) that some packages use for exposing this infmormation to other users of their package.

```{code} python
:label: code:version-py
__version__ = "1.0.0"
```

Setting `__verion__` lets you use the version number in your code, e.g. to print it out:

```{code} python
:label: code:use-version-py
def show_package_info():
    print(f"This package has version {__version__}")
```

It's possible to get the _installed_ version another way, via the `importlib.metadata` package that we saw earlier:

```{code} python
:label: code:use-version-py-imp
import importlib.metadata
importlib.metadata.version("arrow-to-knee")
```

This is the _standard_ way to get at installed {term}`distribution package` metadata, but it can be "slow" as it has to perform file-system operations.

:::{warning} Distribution name versus important name

It's important to note that the argument to `importlib.metadata.version` is the _distribution_ name, not the _import_ name. This distinction isn't always noticeable, e.g. for packages with the same names like NumPy, but for our `arrow-to-knee` the import name `arrow_to_knee` and distribution name `arrow-to-knee` are different.
:::

# How Do I Use `__version__` with `hatchling`?

First, set the `version` to be dynamic and _remove_ the `version` field:

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-ver-dync
[project]
dynamic = ["version"]
# version = "1.0.0"
```

Then tell `hatchling` about the version source:

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-ver-source
[tool.hatch.version]
source = "regex"
path = "src/arrow_to_knee/__init__.py"
```

Now, we can use te `hatch version` command once again to set the version, and Hatch will update the `__init__.py` file instead of `pyproject.toml`.

# How Do I Build a Dynamic README?

Many projects also use dynamic README files. The intention behind this is often one of reducing duplication whilst also distributing _different_ README files for different platforms. For example, the kinds of information that package authors want to show to users on PyPI _may_ differ from those that they want contributors to the GitHub repository to say (such as the inclusion/removal of Markdown badges). For example the [awkward-array] project uses this to hide the code-contributing guidelines from the PyPI users, and change out the logo.

To build a dynamic readme, first, add `hatch-fancy-pypi-readme` to your `[build-system]` table:

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-fancy
[build-system]
requires = ["hatchling", "hatch-fancy-pypi-readme"]
build-backend = "hatchling.build"
```

This is a particular `hatchling` plugin that knows how to build a README, and we need to define it here so that the package manager installs the plugin _before_ trying to build your package. Then tell `hatchling` about the dynamic readme and _remove_ the `readme` field:

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-dynamic
[project]
dynamic = ["version", "readme"]
```

This will signal to {term}`build frontends<build frontend>` that they will need to ask `hatchling` to compute the readme (and version), if they want to read it. Next, configure the `fancy-pypi-readme` tool with the knowledge that our README is Markdown:

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-fancy-tool
[tool.hatch.metadata.hooks.fancy-pypi-readme]
content-type = "text/markdown"
```

Finally, define your readme `fragments`. These individual parts are concatenated together to form a contiguous block of text. Here, we're interleaving a fragment taken from the `README.md` file (between some `BEGIN` and `END` markers that we're pre-inserted into that file), a block of raw text, and another fragment from `README.md`. You can see how this might be quite powerful!

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-fancy-tool-frag
[[tool.hatch.metadata.hooks.fancy-pypi-readme.fragments]]
path = "README.md"
start-after = "<!-- BEGIN README 1 -->"
end-before = "<!-- END README 1 -->"

[[tool.hatch.metadata.hooks.fancy-pypi-readme.fragments]]
text = "This is a readme\n"

[[tool.hatch.metadata.hooks.fancy-pypi-readme.fragments]]
path = "README.md"
start-after = "<!-- BEGIN README 2 -->"
end-before = "<!-- END README 2 -->"
```

:::{important} Conclusion
:label: important:conclusion-dynamic-metadata

We have learned that:

- Build backends can _themselves_ declare dependencies.
- Fields in `pyproject.toml` can be dynamic.
- Some people use `__version__` for versioning
- Hatch has a plugin mechanism for wiring these in.
  :::

  [awkward-array]: https://github.com/scikit-hep/awkward-array/

  [^contrib]: I used to be a core maintainer of this package (disclaimer).
