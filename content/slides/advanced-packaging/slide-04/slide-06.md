---
site:
  hide_toc: true
  hide_outline: true
---

# Including Generated Files

Some tools can generate files which should be ignored by Git, but included in the {term}`binary distribution`.

You can include these with `artifacts`:

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-file-wheel-inc
:linenos:
[tool.hatch.build.targets.wheel]
artifacts = [
  # Include generated JSON
  "*.json"
  # Ignore this specific JSON file, though
  "!particular-data.json"
]
```

`artifacts` are _not_ affected by `exclude`.
