---
title: How to Define Scripts
subtitle: Make your package do something!
_kernelspec:
  name: python3
  display_name: Python
---

```{code-cell} python3
:tags: [remove-cell]

import os, tempfile
# Disable Hatch colour
os.environ['NO_COLOR']='1'
os.chdir(tempfile.mkdtemp())
```

::::{tip} Objective
:label: tip:objective-how-to-scripts
We're going to learn how to define scripts in `pyproject.toml` that expose your CLI routines.
::::
`
::::{important} Conclusion
:label: important:conclusion-how-to-scripts
We've learned that:

- You can define the packages that your package depends upon in `pyproject.toml`.
- You can add _specifiers_ to your dependencies for more control.
- You can define development dependencies in `dependency-groups`.
  ::::
