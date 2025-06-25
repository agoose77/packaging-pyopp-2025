---
site:
  hide_toc: true
  hide_outline: true
---

# How Do I Use `__version__` with `hatchling`?

First, set the `version` to be dynamic:

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-ver-source
[project]
dynamic = ["version"]
```

Then tell `hatchling` about the version source:

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-ver-source
[tool.hatch.version]
source = "regex"
path = "src/arrow-to-knee/__init__.py"
```
