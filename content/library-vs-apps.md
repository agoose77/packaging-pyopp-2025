---
title: Applications vs Libraries
short_title: Apps vs Libraries
subtitle: Users have different expectations of applications and libraries.
---

## Background on dependency hell

"Recently", a tool called Poetry became popular with Python users. It made developing Python packages much easier, and made some strong decisions about user intent. One of these decisions was about package _constraints_ — Poetry introduced _upper bounds_ by default, e.g.

```{code} toml
:filename: pyproject.toml
[project]
dependencies = [
   "numpy>=2.0,<3.0"
]
```
