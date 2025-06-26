---
site:
  hide_toc: true
  hide_outline: true
---

# Default File Selection

`hatchling` has [sensible defaults for file inclusion](https://hatch.pypa.io/1.13/config/build/#file-selection) for each kind of distribution:

SDists
: All files _not_ ignored by Git.

Wheels
: `src/<PROJECT NAME>/`, respecting your `.gitignore`.
