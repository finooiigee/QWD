<section>

# inspect

<code>Index:Presentations</code>

</section>

<section class="function">

Returns the value of a variable that was used amidst a function's evaluation.

```apl
primes ← {
    range    ← 1↓⍳⍵
    divisors ← (∪⊢∨⍳)¨range
    mask     ← 2=≢¨divisors
    mask/range
}

      primes 5
2 3 5

      (primes inspect 'divisors') 5
┌───┬───┬─────┬───┐
│1 2│1 3│1 2 4│1 5│
└───┴───┴─────┴───┘
```

This is not intended to be a versatile tool called during execution, instead it aims to be useful in presentations - as a means to visualize an idea in focus. Additionally, it can be applied to view an operation's steps in their entirety:

```apl
    (##.analysis.names 'primes') {⍺(↑,⍥⊂¨)(primes inspect ⍺)⍵} 5
┌────────┬───────────────────┐
│range   │2 3 4 5            │
├────────┼───────────────────┤
│divisors│┌───┬───┬─────┬───┐│
│        ││1 2│1 3│1 2 4│1 5││
│        │└───┴───┴─────┴───┘│
├────────┼───────────────────┤
│mask    │1 1 0 1            │
└────────┴───────────────────┘
```

As it stands<sub>[19/04/2023]</sub> this function is limited in its simplicity but I may improve upon it in time.

</section>

<section class="function">

```apl
#include(home/e/maple/inspect.aplf)
```


</section>
