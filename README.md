# Typst Packages for Polytechnique

This repo contains two separate Typst packages:

- a [report](report/README.md) template (equivalent to the $\LaTeX$ template provided by [TypographiX](https://typographix.binets.fr/))
- a [slide](slide/README.md) template (using assets from the PowerPoint template)

## Use

You can use the templates on the [Typst web app](https://typst.app/). No need to install anything, simply choose "Start from template" when creating a new project.

## Use locally

If you prefer to use the templates locally, it is completely possible and super easy too:

1. Install [Typst](https://github.com/typst/typst?tab=readme-ov-file#installation).
2. Initialize a new project with the template (the latest versions might be newer than the ones below):

   ```bash
   typst init @preview/typographix-polytechnique-reports:0.1.6
   ```

   or

   ```bash
   typst init @preview/typographix-polytechnique-slides:0.1.0
   ```

If you are using VS Code, I strongly recommend using the [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) extension (providing linting, autocompletion, preview, formatting, ...).

## Contributing

Contributions are welcomed! See the [contribution guidelines](CONTRIBUTING.md).
