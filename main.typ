#let PALETTE = (
  "blue": rgb("#003E5D"),
  "gold": rgb("#A58B4D"),
  "lighter-blue": rgb("#006881"),
  "gray": rgb("#E7E6E6"),
)
#let PALETTE-AUX = ()

#let FONT-SIZES = (24pt, 18pt, 12pt, 10pt, 10pt)

#let FILET-LONG-SIZE = 6.58cm
#let FILET-LONG-SIZE-OUTLINE = 6.4cm

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
  set page(width: 16 / 9 * 19.05cm, height: 19.05cm)

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
