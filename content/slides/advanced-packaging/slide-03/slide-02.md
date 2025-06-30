---
site:
  hide_toc: true
  hide_outline: true
---

# Defining a Static Version

`pyproject.toml` has certain fields that are _required_:

:::{embed} #code:pyproject-required-static
:::

Hatch provides a nice CLI to get the version:
:::{embed} #code:hatch-version-get
:::

You can also use this subcommand to set the version:

:::{embed} #code:hatch-version-set
:::
