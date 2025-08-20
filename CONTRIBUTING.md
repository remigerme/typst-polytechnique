# Contributing to the package or template

You can simply fork this repo and work on it on your own. Feel free to PR if this repo is still active!

If you plan to distribute your version of the package, please make sure you pay respect to both [Typst packages guidelines](https://github.com/typst/packages/blob/main/docs/README.md) and [École polytechnique corporate identity](https://www.polytechnique.edu/presse/kit-media).

## Pushing to Typst packages

Check out [Typst packages repo](https://github.com/typst/packages) to learn more about packages release pipeline.

I personally suggest the following steps :

1. fork the Typst packages repo
2. in the root directory, for every `x.y.z` version (if the current branch currently contains the `x.y.z` release):

   ```bash
   cp -r report path/to/fork/packages/preview/typographix-polytechnique-reports/x.y.z
   ```

   or

   ```bash
   cp -r slide path/to/fork/packages/preview/typographix-polytechnique-slides/x.y.z
   ```

   > [!caution]
   > Make sure not to include files that are gitignored like `.pdf`s or `.DS_Store` for macOS users.

3. PR your fork to publish the package.
