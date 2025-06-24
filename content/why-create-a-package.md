---
title: Why Create a Package?
subtitle: This sounds like more work...
---

:::{tip} Objective
:label: tip:objective-why-create
We're going to discuss a few reasons behind doing all of this work and creating a package.
:::

The obvious question in the back of our minds should be "what is the point in creating a package"? Learning about all of these terms feels like extra work.

## Sharing is caring

:::{pull-quote}
:label: pull:sharing
By packaging your code, other people can use it!
:::
When you write code to solve a problem, it may often solve a problem that _other_ people have too. By packaging your code, other people can benefit from your work and re-use the solution.
:::{note} Leveraging network effects
:label: note:network-effects
The more people packaging and sharing their solutions in this way, the easier it is to get things done! This is the idea of a <wiki:Network_effect>.

There are 649,838 Python packages on the main Python package index — that's a big network![^writing]
:::

:::{tip} Think about your users
:label: tip:think-users
It helps to imagine what kind of users your package might have. They might have different needs, so try to find ways to avoid assumptions in your own code.
:::

## Re-use and recycle

There are other reasons, besides philanthropy or network-effects, to share your code by packaging it. Just as functions and classes break your code into re-usable pieces, packaging your code makes it possible to re-use it in different projects (such as different analyses or tools). This both _saves time_ **and** reduces certain kinds of errors (like copy-paste errors)!

## Strive for reproducibility

Although we won't discuss this in great detail, the hardest part of programming is trying to revive an old project. Through the best-practices involved in creating a Python package, it will be easier to come-back to an old project and figure out why it doesn't work! Packaging makes it easier to write good tests, and encourages you to author helpful documentation and employ continuous integration.

::::{important} Conclusion
:label: important:conclusion-why-create
We've learned that:

- Building a network of packages can have network-effects.
- Sharing work with others encourages best-practices when writing code.
- Bundling your code into a package makes it easier to keep it from breaking!
  ::::

[^writing]: As of 2025-06-23.
