/***********************/
/* TEMPLATE DEFINITION */
/***********************/

#let apply(doc) = {
    // Numbering parameters
  set heading(numbering: "1.1 - ")

  // H1 styling - Modern with shadow effect
  show heading.where(level:1): he => {
    set align(center)
    box(width: 90%)[#{
      set par(justify: false)
      
      // Number styling
      if type(he.numbering) == str {
        set text(
          size: 16pt,
          weight: "bold",
          fill: rgb(0, 102, 204),
          font: "New Computer Modern Sans"
        )
        counter(heading).display(he.numbering.slice(0, -3))
        v(0.3em)
      } else if he.numbering != none {
        set text(
          size: 16pt,
          weight: "bold",
          fill: rgb(0, 102, 204),
          font: "New Computer Modern Sans"
        )
        upper((he.numbering)(he.level).slice(0, -2))
        v(0.3em)
      }
      
      // Title with modern styling
      set text(
        size: 24pt,
        weight: "bold",
        fill: rgb(0, 93, 166),
        font: "New Computer Modern Sans",
        hyphenate: false
      )
      upper(he.body)
      
      // Modern decorative element
      v(0.8em)
      box(width: 40%, height: 1.5pt, fill: rgb(0, 102, 204, 60%))
      v(0.5em)
  }]
  }

  // H2 styling - Professional academic format
  show heading.where(level:2): he => {
    box(width: 100%)[#{
      set par(justify: false)
      set align(left)
      set text(
        size: 18pt,
        weight: "bold",
        fill: rgb(0, 93, 166),
        font: "New Computer Modern Sans"
      )
      if type(he.numbering) == str {
        counter(heading).display(he.numbering.slice(0, -3))
        [ ]
      }
      he.body
    }]
  }

  // H3 styling - Modern with bullet
  show heading.where(level: 3): he => {
    box(width: 100%)[#{
      grid(columns: (auto, 1fr), column-gutter: 8pt, align: left)[
        #set text(size: 12pt, fill: rgb(0, 93, 166))
        #text(weight: "bold")[▸]
      ][
        #set text(
          size: 16pt,
          weight: "medium",
          fill: rgb(0, 83, 156)
        )
        #if type(he.numbering) == str {
          counter(heading).display(he.numbering.slice(0, -3))
          [ • ]
        }
        #smallcaps(he.body)
      ]
    }]
  }

  // H4 styling
  show heading.where(level: 4): he => {
    counter(heading).display(he.numbering)
    he.body
  }

  // Quick fix for paragraph indentation...
  // Any superior entity who might be reading, please forgive me
  show heading: he => {
      set par(first-line-indent: 0pt)
      he
  }

  // Don't forget to return doc cause
  // we're in a template
  doc
}

#let appendix(body, title: "Appendix") = {
  counter(heading).update(0)
  // From https://github.com/typst/typst/discussions/3630
  set heading(
    numbering: (..nums) => {
      let vals = nums.pos()
      let s = ""
      if vals.len() == 1 {
        s += title + " "
      }
      s += numbering("A.1 -", ..vals)
      s
    },
  )

  body
}


/********************/
/* TESTING TEMPLATE */
/********************/

#show: apply

#outline()

= My first section

== A sub-section 

#heading(level: 2, numbering: none)[Sub-section without numbering]
#lorem(60)

=== No more ideas

==== Sometimes dummy text is

===== Really important
really ?

==== Back again

#heading(level: 3, numbering: none)[Sub-sub-section without numbering]

=== Guess who's back ?

#lorem(40)

= My second section

#lorem(30)

== Another one

#lorem(20)

#show: appendix.with(title: "Appendix")

= Some proofs
#lorem(50)

== Some theorem
#lorem(20)
