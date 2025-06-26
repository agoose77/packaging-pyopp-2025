---
site:
  hide_toc: true
  hide_outline: true
---

# Controlling Included Files

You can specify _exactly_ which files to `include` and `exclude` in your distribution, e.g. for the {term}`source distribution`:

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-file-sdist-inc
:linenos:
[tool.hatch.build.targets.sdist]
include = [
  "src/arrow_to_knee/*.py",
  "/tests",
]
exclude = [
  "*.json",
  "src/arrow_to_knee/some-random-file.py",
]
```

The `exclude` takes precedence, and `/` refers to the project root.

You can use exactly the same configuration for your {term}`binary distribution`.

Better to specify as little as possible.
