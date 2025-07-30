// Modern aesthetic enhancements for Monash template
// Import this for additional styling options

#import "monash-colors.typ"

// Modern text styling
#let modern-text(
  body,
  size: 11pt,
  weight: "regular",
  fill: rgb(0, 0, 0),
  style: "normal"
) = {
  set text(size: size, weight: weight, fill: fill, style: style)
  body
}

// Modern quote styling
#let modern-quote(body) = {
  block(
    width: 85%,
    inset: (left: 20pt, top: 10pt, bottom: 10pt),
    fill: rgb(0, 93, 166, 5%),
    radius: 4pt,
    stroke: (left: 2pt + rgb(0, 93, 166))
  )[
    #set text(style: "italic")
    #body
  ]
}

// Modern code block styling
#let modern-code(code) = {
  block(
    width: 100%,
    inset: (x: 15pt, y: 10pt),
    fill: rgb(245, 250, 255),
    radius: 6pt,
    stroke: (top: 1pt + rgb(0, 93, 166, 30%), bottom: 1pt + rgb(0, 93, 166, 30%))
  )[
    #set text(font: "Courier New", size: 10pt)
    #code
  ]
}

// Modern table styling
#let modern-table(..args) = {
  table(
    ..args,
    stroke: (x: none, y: 1pt + rgb(0, 93, 166, 20%)),
    fill: (x, y) => if y == 0 { rgb(0, 93, 166, 10%) } else { none }
  )
}

// Modern figure caption
#let modern-figure(body, caption) = {
  figure(
    body,
    caption: [
      #set text(size: 10pt, fill: rgb(0, 83, 156))
      #caption
    ]
  )
}

// Modern section break
#let section-break() = {
  v(1em)
  align(center)[
    #box(width: 30%, height: 1pt, fill: rgb(0, 93, 166, 30%))
  ]
  v(1em)
}

// Modern highlight box
#let highlight-box(title, body) = {
  block(
    width: 100%,
    inset: (x: 20pt, y: 15pt),
    fill: rgb(0, 93, 166, 8%),
    radius: 8pt,
    stroke: 1pt + rgb(0, 93, 166, 40%)
  )[
    #set text(weight: "bold", fill: rgb(0, 93, 166))
    #title
    #v(0.5em)
    #set text(weight: "regular", fill: rgb(0, 0, 0))
    #body
  ]
}
