/***********************/
/* TEMPLATE DEFINITION */
/***********************/

#let apply(doc) = {

  show outline: o => {
    set par(first-line-indent: 0pt)
    o
  }
  
  // Level 1 headings
  show outline.entry.where(level : 1): i => {
    strong(i)
  }
  
  // Don't forget to return doc cause
  // we're in a template
  doc
}
