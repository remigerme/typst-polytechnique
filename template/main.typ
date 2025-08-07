#import "../monash-template/report/cover.typ": cover
#import "../monash-template/report/heading.typ": apply as apply-heading
#import "../monash-template/report/page.typ": apply as apply-page, apply-header-footer

#let monash-report(
  // Required parameters
  title,
  author,
  
  // Optional parameters with defaults
  subtitle: none,
  student-id: none,
  course-code: none,
  course-name: none,
  assignment-type: "Assignment",
  tutor-name: none,
  date: none,
  word-count: none,
  despair-mode: false,
  show-typst-attribution: true,
  body
) = {
  // Set document metadata
  set text(lang: "en")
  set document(title: title, author: author, date: if date != none { date } else { datetime.today() })
  
  // Apply page and heading styles
  show: apply-page.with(despair-mode: despair-mode)
  show: apply-heading
  
  // Cover page
  cover(
    title, 
    author, 
    none, // date-start (deprecated)
    none, // date-end (deprecated) 
    subtitle: subtitle, 
    logo: none, 
    logo-horizontal: true,
    student-id: student-id,
    course-code: course-code,
    course-name: course-name,
    assignment-type: assignment-type,
    tutor-name: tutor-name,
    word-count: word-count,
    date: date,
    show-typst-attribution: show-typst-attribution
  )
  pagebreak()
  
  // Apply header and footer
  show: apply-header-footer.with(course-code: course-code, assignment-type: assignment-type)
  
  // User content
  body
}