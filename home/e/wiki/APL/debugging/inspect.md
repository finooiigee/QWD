<section>

# inspect
---
<code>Index:[Debugging](../debugging.html)|Presentation</code>
</section>

<section class="function">

Returns the value of a variable that was used amidst a function's evaluation.

```
      primes
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

This is not intended to be a helpful tool, instead it attempts to be useful in presentations - as a means to visualize an idea in focus. Additionally, it can be applied to view an operation in full:

```
    names ← {(0≠∊⍴¨⍵)/⍵}{¯1↓((' '≠⍵)∧⌽∨\⌽'←'=⍵)/⍵}¨1↓⎕NR 'primes'
    names (↑,⍥⊂¨) (primes inspect names) 5
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

As it stands<sub>[19/04/2023]</sub> this function is limited in its simplicity, but I may improve upon it.
</section>

<section class="function">

```
inspect←{
    ⍺←⊢ ⋄ operand←⍺⍺ ⋄ names←⊆⍵⍵
    _←names(⍎,)¨⊂'←⎕NULL'
    _←⎕FX (,names,¨'←')⎕R(,names,¨⊂'∘←')¨⎕NR'operand'
    _←⍺ operand ⍵
    ⍎∊names,¨' '
}
```
</section>