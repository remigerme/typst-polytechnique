# Typst Report Template - Monash University Edition

A professional Typst package for Monash University student reports, featuring Monash's official brand colors and modern design elements.

## Features

- **Professional Monash Branding**: Official Monash University colors and logo integration
- **Modern Cover Page**: Customizable cover with gradient background and watermark logo
- **Academic Metadata**: Support for student ID, course codes, tutor names, and word counts
- **Responsive Typography**: Professional formatting with Monash brand colors
- **Header & Footer**: Automatic page headers with course info and Monash logo
- **Modern Styling**: Enhanced functions for quotes, code blocks, tables, and figures
- **Multiple Document Types**: Support for assignments, theses, and research papers
- **Typst Attribution**: Optional "Made with Typst" badge

## Monash Color Scheme

This template uses Monash University's official brand colors:

- **Monash Blue** (#005DA6) - Primary brand color for main headings and cover text
- **Bright Blue** (#0066CC) - Secondary color for H2 headings
- **Monash Navy** (#00539C) - Medium contrast for H3 headings
- **Monash Yellow** (#FFD100) - Available as accent color
- **Deep Blue** (#003366) - Dark variant for backgrounds
- **Light Blue** (#E6F2FF) - Light variant for highlights

## Quick Start

### Basic Usage

```typ
#import "template/main.typ": monash-report

#monash-report(
  "Machine Learning Applications in Healthcare",
  "Alex Johnson",
  subtitle: "A Comprehensive Analysis",
  student-id: "12345678",
  course-code: "FIT3080",
  course-name: "Introduction to AI",
  assignment-type: "Research Report",
  tutor-name: "Dr. Sarah Chen",
  date: datetime(year: 2025, month: 07, day: 30),
  word-count: 2500,
  show-typst-attribution: true
)[
  // Your content here
  = Introduction
  
  This is where your report content begins...
]
```

### Parameters

#### Required
- `title` - Report title
- `author` - Author name

#### Optional
- `subtitle` - Report subtitle
- `student-id` - Student ID number
- `course-code` - Course code (e.g., "FIT3080")
- `course-name` - Full course name
- `assignment-type` - Type of document (default: "Assignment")
- `tutor-name` - Tutor or supervisor name
- `date` - Submission date
- `word-count` - Word count for the report
- `despair-mode` - Enable larger margins (default: false)
- `show-typst-attribution` - Show "Made with Typst" badge (default: true)

## Advanced Features

### Modern Styling Functions

The template includes enhanced styling functions available in `monash-colors.typ`:

```typ
// Modern quote block
#modern-quote[
  This is a professionally styled quote with Monash brand colors.
]

// Code block with syntax highlighting
#modern-code(```typ
#let x = 42
````)

// Styled table
#modern-table(
  columns: 2,
  [Header 1], [Header 2],
  [Cell 1], [Cell 2]
)

// Figure with styled caption
#modern-figure(
  image("chart.png"),
  caption: [Figure 1: Sample chart]
)

// Highlight box for important content
#highlight-box(
  "Important Note",
  [This content will be highlighted with Monash colors.]
)
```

### Document Structure

The template automatically handles:
- **Cover Page**: Professional cover with Monash logo watermark
- **Page Headers**: Course code and assignment type with Monash logo
- **Page Footers**: Styled page numbers with decorative elements
- **Table of Contents**: Automatic generation with `#outline()`
- **Bibliography**: IEEE style support

## Installation

### Local Development

1. Clone the repository:
```bash
git clone https://github.com/eric/typst-report-monash.git
cd typst-report-monash
```

2. Ensure you have the "New Computer Modern Sans" font installed

3. Use the template by importing from your local copy

### Via Typst Package Manager

The package is available on the Typst package manager as `monash-university-report`.

## Project Structure

```
typst-report-monash/
├── template/
│   ├── main.typ          # Main template entry point
│   └── main.pdf          # Compiled example
├── monash-template/
│   └── report/
│       ├── cover.typ     # Cover page design
│       ├── heading.typ   # Heading styles
│       ├── page.typ      # Page setup and headers/footers
│       └── monash-colors.typ # Color definitions and styling
├── assets/
│   ├── Monash_University_logo_page.svg
│   ├── Monash_University-04.svg
│   └── typst.png
└── example/
    ├── example.typ       # Example usage
    └── example.pdf       # Compiled example
```

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

This project is licensed under the MIT License - see [LICENSE](LICENSE) for details.

## Examples

Check the `example/` directory for a complete sample report demonstrating all features. The example includes:
- Professional cover page
- Multiple heading levels
- Bibliography integration
- Table of contents
- Various styling elements

## Support

For issues and questions:
- Check the [existing issues](https://github.com/eric/typst-report-monash/issues)
- Create a new issue if needed
- Review the example files for usage patterns

---

*Maintained by Eric (@eric) - Made with ❤️ using Typst*