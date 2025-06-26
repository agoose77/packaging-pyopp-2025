---
site:
  hide_toc: true
  hide_outline: true
---

# Declaring Data Files with Hatchling

{term}`Data files` are only specified for the _wheel_ builder:

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-data-files
:linenos:
[tool.hatch.build.targets.wheel.shared-data]
# Under /share
"a-file.json" = "share/arrow_to_knee/a-file.json"
# Under /etc
"a-directory" = "etc/arrow_to_knee/a-directory"
```

@code:pyproject-data-files places two data files/folders under the `sys.prefix`: one under `/share` and one under `/etc`.
