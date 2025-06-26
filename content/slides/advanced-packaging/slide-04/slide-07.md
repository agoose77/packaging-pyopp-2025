---
site:
  hide_toc: true
  hide_outline: true
---

# Rewriting Paths

`hatchling` can move files around in your {term}`distribution package`:

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-file-rewrite
:linenos:
[tool.hatch.build.targets.wheel]
include = ["src/arrow_to_knee", "a-folder"]

[tool.hatch.build.targets.wheel.sources]
"src/arrow_to_knee" = "arrow_to_knee"
"a-folder" = "arrow_to_knee/renamed-folder"
```

:::{warning} Don't rely on default file inclusion
Once you start changing the inclusion rules, you should make sure to specify the `include` and `exclude` fields.
:::
