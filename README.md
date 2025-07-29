# Typst Report Template - Monash University Edition

A Typst package for Monash University student reports, adapted from the Polytechnique template with Monash's official brand colors.

For a short introduction to Typst features and detailed information about the package, check the [guide](https://github.com/remigerme/typst-polytechnique/blob/main/guide.pdf) (available from the repo only).

## Monash Color Scheme

This template uses Monash University's official brand colors:
- **Monash Blue** (#005DA6) - Primary brand color for main headings and cover text
- **Bright Blue** (#0066CC) - Secondary color for H2 headings
- **Monash Navy** (#00539C) - Medium contrast for H3 headings
- **Monash Yellow** (#FFD100) - Available as accent color

See `monash-colors.typ` for complete color definitions and usage guidelines.

## Usage

If you want to use it on local, make sure you have the font "New Computer Modern Sans" installed.

Define variables at the top of the template :

```typc
#let title = "Rapport de stage en entreprise sur plusieurs lignes automatiquement"
#let subtitle = "Un sous-titre pour expliquer ce titre"
#let logo = image("path/to/my-logo.png")
#let logo-horizontal = true
#let short-title = "Rapport de stage"
#let authors = ("Rémi Germe")
#let date-start = datetime(year: 2024, month: 06, day: 05)
#let date-end = datetime(year: 2024, month: 09, day: 05)
#let despair-mode = false

#set text(lang: "fr")
```

These variables will be used for PDF metadata, default cover page and default header.

## Contributing

Contributions are welcomed ! See [contribution guidelines](CONTRIBUTING.md).

## Todo

- [ ] heading not at the end of a page : might be tricky
