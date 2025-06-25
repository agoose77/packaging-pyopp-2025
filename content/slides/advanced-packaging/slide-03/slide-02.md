---
site:
  hide_toc: true
  hide_outline: true
---

# Defining a Static Version

`pyproject.toml` has certain fields that are _required_:

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-required-static
[project]
name = "arrow-to-knee" # required!
version = "1.0.0"      # required!
```

Hatch provides a nice CLI to get the version:

```{code} shell
:label: code:hatch-version-get
$ hatch version
1.0.0
```

You can also use this subcommand to set the version:

```{code} shell
:label: code:hatch-version-set
$ hatch version 2.0.0
Old: 1.0.0
New: 2.0.0
```
