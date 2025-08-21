#let PALETTE = (
  "blue": rgb("#003E5D"),
  "gold": rgb("#A58B4D"),
  "lighter-blue": rgb("#006881"),
  "gray": rgb("#E7E6E6"),
)
#let PALETTE-AUX = ()

#let MARGIN = 5.9mm
#let HEIGHT = 19.05cm
#let WIDTH = 16 / 9 * HEIGHT

#let FONT-SIZES = (24pt, 18pt, 12pt, 10pt, 10pt)

#let FILET-LONG-SIZE = 6.58cm
#let FILET-LONG-SIZE-OUTLINE = 6.4cm

#let DIAG-LINE-SIZE = 0.1mm

#let show-bg-lines() = {
  // We could simplify the expressions below because tan(45deg) = 1
  // But in case anyone wonders how did I come up with that...
  let width-small = HEIGHT / calc.tan(45deg)
  let overall-width = WIDTH + width-small
  let overall-height = calc.tan(45deg) * overall-width
  let overall-hyp = overall-height / calc.sin(45deg)
  let max-height = calc.ceil(overall-height.mm())

  for i in range(0, max-height, step: 2) {
    let sx = if i * 1mm < HEIGHT { 0mm } else { (i - HEIGHT.mm()) * calc.tan(45deg) * 1mm }
    let sy = calc.min(i * 1mm, HEIGHT)
    place(line(
      angle: -45deg,
      start: (sx, sy),
      length: overall-hyp,
      stroke: PALETTE.at("gold") + DIAG-LINE-SIZE,
    ))
  }
}

#let apply(doc, h1-theme: "light") = {
  /***********/
  /* PARSING */
  /***********/
  let h1-use-light-theme = if h1-theme == "light" { true } else if h1-theme == "dark" {
    false
  } else { panic("Unexpected value for param 'h1-theme', expected 'light' or 'dark'") }

  /********/
  /* PAGE */
  /********/
  set page(width: WIDTH, height: HEIGHT, background: [
    #show-bg-lines()
    #rect(
      stroke: 0.2mm + PALETTE.at("gold"),
      width: WIDTH - 2 * MARGIN,
      height: HEIGHT - 2 * MARGIN,
      fill: white,
    )])

  /*****************/
  /* GENERAL STYLE */
  /*****************/
  set text(font: "Georgia", fill: PALETTE.at("blue"), size: FONT-SIZES.at(1))

  /***********/
  /* HEADING */
  /***********/
  let h1-bg-color = if h1-use-light-theme { white } else { PALETTE.at("blue") }
  let h1-text-color = if h1-use-light-theme { PALETTE.at("blue") } else { white }
  let h1-number-color = if h1-use-light-theme { rgb("#E3DDC9") } else { rgb("#4C788C") }
  show heading.where(level: 1): he => {
    set page(header: none, footer: none, margin: 0cm, fill: h1-bg-color)
    place(center + horizon, text(size: 400pt, fill: h1-number-color, he.numbering)) // TODO numbering?
    align(center + horizon, text(size: 66pt, fill: h1-text-color, he.body))
  }

  let h2-text-color = PALETTE.at("gold")
  show heading.where(level: 2): he => {
    pagebreak(weak: true)
    // TODO spacing between fancy edge and heading == spacing heading and filet-long
    align(center, text(size: FONT-SIZES.at(0), fill: h2-text-color, he.body)) // TODO numbering?
    align(center, image("assets/filet-long.svg", width: FILET-LONG-SIZE))
  }

  doc
}

#set heading(numbering: "1")

#show: apply

= Branchez-vous

== Complètement dingo

- Woah on va vraiment se régaler.
- En trois points
- semcom j'ai validé

#lorem(200)

== Nan vraiment
