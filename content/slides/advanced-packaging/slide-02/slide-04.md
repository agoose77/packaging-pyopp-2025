---
site:
  hide_toc: true
  hide_outline: true
kernelspec:
  name: python3
  display_name: Python
---

# Install your package _editably_

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

`pip` can build and install _an {term}`editable wheel`_ for your package.

```{code} shell
pip install -e .
```

:::{glossary}
:label: glossary:editable-wheel
Editable wheel
: A regular wheel file containing special file that enable editing of the package contents (using [PEP 660](https://peps.python.org/pep-0660/)).
:::
