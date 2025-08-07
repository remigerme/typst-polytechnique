#import "../cover.typ": cover
#import "../heading.typ": apply as apply-heading
#import "../page.typ": apply as apply-page, apply-header-footer

// Defining variables for the cover page and PDF metadata
// Main title on cover page
#let title = [Assignment Title
#linebreak()
Next Line of the Title] // Use a list to allow line breaks
// Subtitle on cover page
#let subtitle = "Assignment subtitle or description"
// Logo on cover page
#let logo = image("../assets/typst.png") // instead of none set to image("path/to/my-logo.png")
#let logo-horizontal = true // set to true if the logo is squared or horizontal, set to false if not
// Header will display course code and assignment type automatically
#let author = "Student Name"
#let student-id = "12345678" // Student ID number
#let course-code = "FIT3080" // Course code
#let course-name = "Introduction to Artificial Intelligence" // Course name
#let assignment-type = "Assignment Report" // Type: Assignment, Essay, Report, Project, etc.
#let tutor-name = "Dr. T" // Tutor or lecturer name
#let date = datetime(year: 2025, month: 07, day: 30) // Optional date
#let word-count = none // Optional word count
// Set to true for bigger margins and so on (good luck with your report)
#let despair-mode = false
// Set to false to hide "Made with Typst" attribution on cover page
#let show-typst-attribution = true

#set text(lang: "en")

// Set document metadata
#set document(title: title, author: author, date: datetime.today())
#show: apply-page.with(despair-mode: despair-mode)
#show: apply-heading

// Cover page
#cover(
  title, 
  author, 
  none, // date-start (deprecated)
  none, // date-end (deprecated) 
  subtitle: subtitle, 
  logo: logo, 
  logo-horizontal: logo-horizontal,
  student-id: student-id,
  course-code: course-code,
  course-name: course-name,
  assignment-type: assignment-type,
  tutor-name: tutor-name,
  word-count: word-count,
  date: date,
  show-typst-attribution: show-typst-attribution
)
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
#show: apply-header-footer.with(course-code: course-code, assignment-type: assignment-type)

// Abstract
#heading(level: 1, numbering: none)[Abstract]
#lorem(200)
#pagebreak()


// Introduction
#heading(level: 1, numbering: none)[Introduction]
#lorem(400)
#pagebreak()

// Here goes the main content
= First Part
This is the 
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
#heading(level: 1, numbering: none)[Appendix]