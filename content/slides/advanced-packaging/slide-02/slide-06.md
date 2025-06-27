---
site:
  hide_toc: true
  hide_outline: true
---

# Python is a detective

![](#tip:import-insane)

Python runs some startup code that prepares `sys.path`.

This includes finding `.pth` files in known directories:

- These files can contain paths that are added to `sys.path`.
- They can _also_ contain `import` statements, and be (ab)used to run code at startup!
