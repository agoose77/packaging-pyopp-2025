---
site:
  hide_toc: true
  hide_outline: true
---

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

Now add `__version__` to `__init__.py`

```{code} toml
:filename: src/arrow_to_knee/__init__.py
:label: code:init-ver
# This package version
__version__ = "1.0.0"
```
