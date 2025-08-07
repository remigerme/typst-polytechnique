# Typst Report Template - Monash University Edition

A professional Typst package for Monash University student reports, featuring Monash's official brand colors and modern design elements.

For a short introduction to Typst features and detailed information about the package, check the [guide](guide.pdf) (available in the repository).

## Monash Color Scheme

This template uses Monash University's official brand colors:
- **Monash Blue** (#005DA6) - Primary brand color for main headings and cover text
- **Bright Blue** (#0066CC) - Secondary color for H2 headings
- **Monash Navy** (#00539C) - Medium contrast for H3 headings
- **Monash Yellow** (#FFD100) - Available as accent color

See `monash-colors.typ` for complete color definitions and modern styling functions.

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

Contributions are welcome! See [contribution guidelines](CONTRIBUTING.md).

## Features

- Professional Monash University branding with official colors
- Modern cover page with customizable elements
- Automatic header and footer generation
- Responsive typography and layout
- Support for student information, course details, and assignment metadata
- Optional "Made with Typst" attribution toggle
- Modern styling functions for quotes, code blocks, tables, and figures
- Centralized color management with Monash brand colors

## Usage

This template is designed for Monash University students creating:
- Assignment reports
- Thesis documents
- Research papers
- Project documentation

Install and use via Typst package manager or clone the repository for local development.
