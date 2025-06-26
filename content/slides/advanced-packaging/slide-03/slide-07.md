---
site:
  hide_toc: true
  hide_outline: true
---

# How Do I Build a Dynamic README?

First, add `hatch-fancy-pypi-readme` to your `[build-system]` table:

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-fancy
[build-system]
requires = ["hatchling", "hatch-fancy-pypi-readme"]
build-backend = "hatchling.build"
```

Then tell `hatchling` about the dynamic readme and _remove_ the `readme` field:

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-dynamic
[project]
dynamic = ["version", "readme"]
```
