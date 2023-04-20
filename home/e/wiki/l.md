<section>

# L
</section>

<section>

# Design

L is a functional notation, featuring partial application, first-class functions, lexical scope, etc.

Some other features include:

* Automatic mapping over n-dimensional floating arrays, dictionaries, functions, and namespaces.

*  A straight-forward grammar - detailing lambdas/closures `{(x u y)v}`, whitespace and parenthesis as a denotation of precedence, and infix/postfix application evaluated in a strictly Left-to-Right manner.

* Immutable variables which cannot be shadowed or removed once assigned.

L does not include conditionals, recursion, or any form of explicit loops.

## Primitives

```
symbol | monadic        | dyadic       | triadic | tetradic
-------------------------------------------------|---------
+      | transpose      | plus         |         |
-      |                | minus        |         |
*      | disclose|first | times        |         |
%      |                | divide       |         |
-------------------------------------------------|---------
&      |                | min|and      |         |
|      | reverse        | max|or       |         |
<      | asc            | lesser       |         |
>      | desc           | greater      |         |
=      |                | equals       |         |

"      | "_1            |              | rank    | rank

!      |                | co-ordinates |         |
$      | shape          | reshape      |         |
.      |                | call         |         |
,      |                | concatenate  |         |
;      |                | pair         |         |

monad  ←→ X  f
dyad   ←→ X  f  Y ←→   Y Xf 
triad  ←→ X Uf  Y ←→   Y UfX  ←→   Y(X Uf)
tetrad ←→ X UfV Y ←→ Y(X UfV) ←→ Y(X(U Vf))

```

# Data Types

As of `20/04/23`, this draft does not explore the L's data types. For now, the specific integer types are implementation defined.
</section>