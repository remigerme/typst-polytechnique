#import "../cover.typ": cover
#import "../heading.typ": apply as apply-heading, appendix
#import "../page.typ": apply as apply-page, apply-header-footer

// Defining variables for the cover page and PDF metadata
// Main title on cover page
#let title = [Report Title
#linebreak()
next line]
// Subtitle on cover page
#let subtitle = "An optional subtitle"
// Logo on cover page
#let logo = image("../assets/typst.png") // instead of none set to image("path/to/my-logo.png")
#let logo-horizontal = true // set to true if the logo is squared or horizontal, set to false if not
// Short title on headers
#let short-title = "Report Title"
#let author = "Author Name"
#let date-start = datetime(year: 2025, month: 07, day: 30)
// Set to true for bigger margins and so on (good luck with your report)
#let despair-mode = false

#set text(lang: "en")

// Set document metadata
#set document(title: title, author: author, date: datetime.today())
#show: apply-page.with(despair-mode: despair-mode)
#show: apply-heading

// Cover page
#cover(title, author, date-start, subtitle: subtitle, logo: logo, logo-horizontal: logo-horizontal)
#pagebreak()

// Acknowledgements
#heading(level: 1, numbering: none, outlined: false)[Acknowledgements]
#lorem(250)
#pagebreak()

// Executive summary
#heading(level: 1, numbering: none, outlined: false)[Executive summary]
#lorem(300)
#pagebreak()

// Table of contents
#outline(title: [Template contents], indent: 1em, depth: 2)

// Defining header and page numbering (will pagebreak)
#show: apply-header-footer.with(short-title: short-title)

// Introduction
#heading(level: 1, numbering: none)[Introduction]
#lorem(400)
#pagebreak()

// Here goes the main content
= First Part

== A Subtitle

#lorem(30)

=== A Detail That Is Not So Useless

==== Stop the Sketch

#lorem(20)


=== Another One Indeed

#lorem(120)

==== It Always Takes More

#lorem(80)



= Second Part

#lorem(300)

#pagebreak()
// Conclusion
#heading(level: 1, numbering: none)[Conclusion]
#lorem(200)

// Bibliography (if necessary)
// #pagebreak()
// #bibliography("path-to-file.bib")

// Appendix
#pagebreak()
#show: appendix.with(title: "Appendix")
= Internship Evaluation Sheet
Yeah, I got all A's everywhere, so great, I'm a super intern.
