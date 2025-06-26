---
kernelspec:
  name: python3
  display_name: Python 3
site:
  hide_toc: true
  hide_outline: true
---

# How are Data Files Represented in a Wheel?

```{code-cell} python3
:tags: [remove-cell]

import os, tempfile
os.chdir(tempfile.mkdtemp())
```

Let's download and inspect a package that has data files:

```{code-cell} python3
:label: cell:download-proxy
!pip wheel --quiet --no-deps jupyter-server-proxy
!zipinfo jupyter_server_proxy*.whl
```
