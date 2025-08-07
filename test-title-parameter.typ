#import "template/main.typ": *

#monash-report(
  [Test Report],
  "Test Author",
  course-code: "TEST123",
  assignment-type: "Test Assignment",
)[

= Introduction
This is a test document to verify that the theorem environments work correctly with title parameters.

== Default Title Usage
#theorem[
  This is a theorem with the default title "Theorem".
]

#proposition[
  This is a proposition with the default title "Proposition".
]

== Custom Title Usage
#theorem[Pythagorean Theorem][
  For a right triangle with legs $a$ and $b$ and hypotenuse $c$, 
  we have $a^2 + b^2 = c^2$.
]

#proposition[Important Proposition][
  This is a proposition with a custom title "Important Proposition".
]

#lemma[Key Lemma][
  This is a lemma with a custom title "Key Lemma".
]

#definition[Vector Space][
  A *vector space* over a field $F$ is a set $V$ equipped with 
  two operations: vector addition and scalar multiplication.
]

#example[Matrix Multiplication][
  Consider two matrices $A$ and $B$. The product $A B$ is defined 
  as the matrix whose $(i,j)$-th entry is the dot product of 
  the $i$-th row of $A$ and the $j$-th column of $B$.
]

== Mixed Usage
#remark[
  This remark uses the default title.
]

#note[Important Note][
  This note has a custom title.
]

#hypothesis[Riemann Hypothesis][
  The Riemann zeta function $zeta(s)$ has all its non-trivial 
  zeros on the critical line $Re(s) = 1/2$.
]

#custom-proof[Proof of Theorem][
  This is a custom proof with a specific title.
]

== Unnumbered Environments
#example[
  This example should not be numbered.
]

#remark[
  This remark should not be numbered.
]

#claim[Strong Claim][
  This claim has a custom title but should not be numbered.
]

]