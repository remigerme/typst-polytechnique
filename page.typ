/***********************/
/* TEMPLATE DEFINITION */
/***********************/

// Defining all margins
// For now : same as LaTeX template from TypographiX
// (already validated by DIRCOM)
#let margin-default = (
  top: 40mm,
  bottom: 35mm,
  left: 20mm,
  right: 20mm
)

//     Bigger margins      yeay
#let margin-despair-mode = (
  top: 1.2 * margin-default.at("top"),
  bottom: 1.2 * margin-default.at("bottom"),
  left: 1.5 * margin-default.at("left"),
  right: 1.5 * margin-default.at("right")
)

// Applying margins and other page-related setup
#let apply(doc, despair-mode: false) = {
  set page(
    paper: "a4",
    margin: if (despair-mode) { margin-despair-mode } else { margin-default }
  )

  set par(justify: true, first-line-indent: 20pt)

  doc
}

// Applying header and footer setup
#let apply-header-footer(doc, course-code: none, assignment-type: "Assignment") = {
  let header-text = if course-code != none and assignment-type != none {
    course-code + " | " + assignment-type
  } else if course-code != none {
    course-code
  } else if assignment-type != none {
    assignment-type
  } else {
    "Document"
  }
  
  set page(
    header: { 
      grid(columns: (1fr, 1fr), align: center + horizon,
        align(left, smallcaps(text(
          fill: rgb(0, 93, 166), 
          size: 14pt, 
          weight: "medium"
        )[#header-text])),
        align(right, image("assets/Monash_University_logo_page.svg", height: 15mm))
      )
    },
    footer: {
      place(center, {
        // Subtle decorative line above page number
        box(width: 60pt, height: 0.5pt, fill: rgb(0, 93, 166, 30%))
        v(3pt)
        
        // Enhanced page number styling
        set text(
          size: 10pt, 
          weight: "medium", 
          fill: rgb(0, 93, 166)
        )
        context {
          // Add "Page" prefix for better readability
          text("Page ") + counter(page).display("1")
        }
      })
    },
    numbering: none // Custom footer handles numbering
  )
  counter(page).update(1)

  doc
}


/********************/
/* TESTING TEMPLATE */
/********************/

#show: rest => apply(rest, despair-mode: false)

#set page(header: "I'm a happy header")
#set page(numbering: none)

= Testing basic feature

== You know

#lorem(200)

#lorem(100)

== Sometimes

=== You get real bored

#lorem(10) #footnote[I'm a happy footnote.] #lorem(250)

=== Pov le stage

#lorem(100)

#set page(numbering: "1.1")
#counter(page).update(1)

#lorem(400)
== La vie c'est cool

#lorem(150)
