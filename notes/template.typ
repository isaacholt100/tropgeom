#let template(doc) = [
    #set text(
        font: "New Computer Modern",
        size: 13pt,
    )
    #set math.mat(delim: "[")
    #set heading(numbering: "1.")
    #set page(
        numbering: "1"
    )
    #set par(leading: 0.55em, first-line-indent: 1.8em, justify: true)
    #show raw: set text(font: "New Computer Modern Mono")
    #show par: set block(spacing: 0.55em)
    #show heading: set block(above: 1.4em, below: 1em)
    #doc
]

#let trop = $op("trop")$
#let val = $op("val")$