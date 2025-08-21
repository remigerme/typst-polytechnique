#let PALETTE = (
  "blue": rgb("#003E5D"),
  "gold": rgb("#A58B4D"),
  "lighter-blue": rgb("#006881"),
  "gray": rgb("#E7E6E6"),
)
#let PALETTE-AUX = () // TODO

#let MARGIN-FRAME = 6mm
#let BASE-HEIGHT = 19.05cm

#let FONT-SIZES = (24pt, 18pt, 12pt, 10pt, 10pt)

#let FILET-LONG-SIZE = 6.58cm
#let FILET-LONG-SIZE-OUTLINE = 6.4cm

#let DIAG-LINE-SIZE = 0.1mm

#let show-bg-lines(width, height) = {
  // We could simplify the expressions below because tan(45deg) = 1
  // But in case anyone wonders how did I come up with that...
  let width-small = height / calc.tan(45deg)
  let overall-width = width + width-small
  let overall-height = calc.tan(45deg) * overall-width
  let overall-hyp = overall-height / calc.sin(45deg)
  let max-height = calc.ceil(overall-height.mm())

  for i in range(0, max-height, step: 2) {
    let sx = if i * 1mm < height { 0mm } else { (i - height.mm()) * calc.tan(45deg) * 1mm }
    let sy = calc.min(i * 1mm, height)
    place(line(
      angle: -45deg,
      start: (sx, sy),
      length: overall-hyp,
      stroke: PALETTE.gold + DIAG-LINE-SIZE,
    ))
  }
}

#let page-background(width, height, is-light: true, dark-frame: false) = {
  if dark-frame {
    place(rect(width: 100%, height: 100%, fill: PALETTE.blue))
  }
  show-bg-lines(width, height)
  rect(
    stroke: 0.2mm + PALETTE.gold,
    width: width - 2 * MARGIN-FRAME,
    height: height - 2 * MARGIN-FRAME,
    fill: if is-light { white } else { PALETTE.blue },
  )
}

#let apply(doc, ratio: 16 / 9, h1-theme: "light") = {
  /***********/
  /* PARSING */
  /***********/
  let h1-use-light-theme = if h1-theme == "light" { true } else if (
    h1-theme == "dark" or h1-theme == "dark-full"
  ) {
    false
  } else {
    panic("Unexpected value for param 'h1-theme', expected 'light', 'dark', or 'dark-full'")
  }
  let h1-dark-frame = h1-theme == "dark-full"

  if type(ratio) != float {
    panic("Unexpected value for param 'ratio', expected a float")
  }

  let height = BASE-HEIGHT
  let width = ratio * height

  /********/
  /* PAGE */
  /********/
  set page(
    width: width,
    height: height,
    margin: (top: MARGIN-FRAME, rest: 2.30cm),
    background: page-background(width, height),
  )

  /*****************/
  /* GENERAL STYLE */
  /*****************/
  set text(font: "Georgia", fill: PALETTE.blue, size: FONT-SIZES.at(1))
  set heading(numbering: "I")

  /***********/
  /* HEADING */
  /***********/
  let h1-text-color = if h1-use-light-theme { PALETTE.blue } else { white }
  let h1-number-color = if h1-use-light-theme { rgb("#E3DDC9") } else { rgb("#4C788C") }
  show heading.where(level: 1): he => {
    set page(
      header: none,
      footer: none,
      margin: 0cm,
      background: page-background(
        width,
        height,
        is-light: h1-use-light-theme,
        dark-frame: h1-dark-frame,
      ),
    )
    place(center + horizon, text(
      size: 400pt,
      fill: h1-number-color,
      counter(heading).display(he.numbering),
    ))
    align(center + horizon, text(size: 66pt, fill: h1-text-color, weight: "bold", he.body))
  }

  let h2-text-color = PALETTE.gold
  show heading.where(level: 2): he => {
    pagebreak(weak: true)

    place(center, dy: 3.22cm, image("assets/filet-long.svg", width: FILET-LONG-SIZE))

    block(height: 3.22cm, width: 100%, align(center + horizon, text(
      size: FONT-SIZES.at(0),
      fill: h2-text-color,
      weight: "regular",
      he.body,
    )))

    v(1cm)
  }

  doc
}

#let armes(doc) = {
  place(center + horizon, dy: 14%, image("assets/armes.svg"))

  doc
}

#show: apply.with(ratio: 16 / 9, h1-theme: "dark")

= Introduction

== Complètement dingo

- Woah on va vraiment se régaler.
- En trois points
- semcom j'ai validé

#lorem(100)

== Nan vraiment

Attention, le texte avant est en-dessous des armes.

#show: armes

Le texte après pas de souci. #lorem(50)

== Alors, ça donne quoi

Petit test pour voir
