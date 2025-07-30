/***********************/
/* TEMPLATE DEFINITION */
/***********************/

/* HANDLING DATE DISPLAY */

#let translate_month(month) = {
  // Construction mapping for months
  let t = (:)
  let fr-month-s = ("Janv.", "Févr.", "Mars", "Avr.", "Mai", "Juin",
    "Juill.", "Août", "Sept.", "Oct.", "Nov.", "Déc.")
  let fr-months-l = ("Janvier", "Février", "Mars", "Avril", "Mai", "Juin",
    "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre")
  for i in range(12) {
    let idate = datetime(year: 0, month: i + 1, day: 1)
    let ml = idate.display("[month repr:long]")
    let ms = idate.display("[month repr:short]")
    t.insert(ml, fr-months-l.at(i))
    t.insert(ms, fr-month-s.at(i))
  }

  // Translating month
  let fr_month = t.at(month)
  fr_month
}

#let display-date(date, short-month) = {
  context {
    // Getting adapted month string
    let repr = if short-month { "short" } else { "long" }
    let month = date.display("[month repr:" + repr + "]")

    // Translate if necessary
    if text.lang == "fr" {
      month = translate_month(month)
    }

  // Returns month and year
  [#month #str(date.year())]
  }
}


/* MAIN COVER DEFINITION */

#let cover(title, author, date-start, date-end, subtitle: none, logo: none, short-month: false, logo-horizontal: true) = {
  // Modern gradient background
  set page(background: {
    // Subtle gradient background
    let gradient = gradient.linear(
      rgb(245, 250, 255),
      rgb(230, 242, 255),
      angle: 135deg
    )
    rect(width: 100%, height: 100%, fill: gradient)
    
    // Monash logo as subtle watermark
    place(
      center + horizon,
      dx: 0pt, dy: -35%,
      image("assets/Monash University-04.svg", width: 35%)
    )
  })
  
  set text(font: "New Computer Modern Sans", hyphenate: false)
  set align(center)

  v(2fr)

  // Title with modern styling
  set text(size: 28pt, weight: "bold", fill: rgb(0, 93, 166))
  box(width: 85%)[
    #upper(title)
  ]
  
  // Decorative underline
  v(0.5em)
  box(width: 60%, height: 2pt, fill: rgb(0, 102, 204))

  v(1.2fr)

  if subtitle != none {
    set text(size: 18pt, fill: rgb(0, 83, 156), style: "italic")
    box(width: 75%)[
      #subtitle
    ]
    v(1fr)
  }

  // Date with modern formatting
  set text(size: 16pt, fill: rgb(0, 93, 166), weight: "medium")
  box(width: 50%)[
    #display-date(date-start, short-month)
    #if date-end != date-start [
      \u{2013} #display-date(date-end, short-month)
    ]
  ]

  v(1fr)

  // Author with elegant styling
  set text(size: 14pt, fill: rgb(0, 83, 156))
  box(width: 40%)[
    #smallcaps(author)
  ]

  v(1.5fr)

  // Modern logo placement
  let logo-height = if (logo-horizontal) { 15mm } else { 25mm }
  let path-logo-x = if (logo-horizontal) { "assets/Monash_University_logo_page.svg" } else { "assets/monash-university-logo-cover.svg" }

  set image(height: logo-height)
  
  box(width: 30%)[
    #image(path-logo-x)
  ]

  v(1fr)
}


/********************/
/* TESTING TEMPLATE */
/********************/

#set text(lang: "fr")

#cover(
  [A very long title over multiple lines automatically],
  "Jane Doe",
  datetime.today(),
  datetime.today(),
  subtitle: "Je n'ai pas de stage mais je suis détendu",
  logo-horizontal: true,
)
