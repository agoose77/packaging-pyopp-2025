---
site:
  hide_toc: true
  hide_outline: true
kernelspec:
  name: python3
  display_name: Python
---

# Inspecting an Editable Wheel

```{code-cell} python3
:tags: [remove-cell]

import os
import pathlib
import tempfile
path = os.getcwd()
tmp_path = pathlib.Path(tempfile.mkdtemp())
link_src = pathlib.Path(path).parents[3] / "arrow-to-knee"
package_path = (tmp_path / link_src.name)
package_path.symlink_to(link_src)
os.chdir(package_path)

os.environ['HATCH_INTERACTIVE'] = '0'
```

We can build this wheel by hand:

```{code-cell} python3
!hatch build -t wheel:editable .
```

It contains very little!

```{code-cell} python3
!zipinfo ./arrow_to_knee*.whl
```
