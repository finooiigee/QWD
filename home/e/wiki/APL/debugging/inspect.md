<section class="function">

Returns the value of a variable that was used amidst a function's evaluation.

```
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

</section>

<section class="function">

```
inspect ← {
    ⍺←⊢ ⋄ operand←⍺⍺ ⋄ var←⍵⍵
    _← ⍎var,'←⎕NULL'
    _← ⎕FX (var,'←')⎕R('⎕THIS.',var,'←')¨⎕NR 'operand'
    _← ⍺ operand ⍵
    ⍎var
}
```
</section>