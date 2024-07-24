#import "../polytechnique.typ"

#show: polytechnique.apply

// Defining variables for the cover page and PDF metadata
#let title = [
  Rapport de stage en entreprise #linebreak()
  Sur plusieurs lignes
]
#let short-title = "Rapport de stage"
#let authors = ("Rémi Germe")
#let edition-date = datetime(year: 2024, month: 07, day: 31)

// Cover page
#polytechnique.cover.cover(title, authors, edition-date, short-title: short-title)
#pagebreak()

// Acknowledgements
#heading(level: 1, numbering: none, outlined: false)[Remerciements]
#lorem(250)
#pagebreak()

// Executive summary
#heading(level: 1, numbering: none, outlined: false)[Executive summary]
#lorem(300)
#pagebreak()

// Table of contents
#outline(title: [Template contents], indent: 1em, depth: 2)

// Defining header and page numbering (will pagebreak)
#set page(header: smallcaps(short-title), numbering: "1 / 1")
#counter(page).update(1)

// Introduction
#heading(level: 1, numbering: none)[Introduction]
#lorem(400)
#pagebreak()

// Here goes the main content
= Premier titre

== Un sous-titre

=== Un détail pas si inutile

==== Halte au sketch

#lorem(200)

#pagebreak()


= Deuxième partie

#lorem(300)

#pagebreak()

= Troisième axe
Parce qu'on a beaucoup de choses à dire et qu'on en a gros.

#pagebreak()


// Conclusion
#heading(level: 1, numbering: none)[Conclusion]
#lorem(200)

// Bibliography (if necessary)
// #pagebreak()
// #bibliography("path-to-file.bib")