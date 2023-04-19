<section>

# names
---
<code>Index:[Analysis](../analysis.html)|[Debugging](../debugging.html)</code>
</section>

<section class="function">

Returns assigned variables in a dfn.

```
      primes
primes ← {
    range    ← 1↓⍳⍵
    divisors ← (∪⊢∨⍳)¨range
    mask     ← 2=≢¨divisors
    mask/range
}

      names 'primes'
┌─────┬────────┬────┐
│range│divisors│mask│
└─────┴────────┴────┘
```
</section>

<section class="function">

```
names ← {
    t v d i ← ↓⍉201⌶⍬ ⍝ type value description index
    k ← d⍳⊂'SCOL_DFN_NAME'
    (∪∊⊆⍨v[k]⍷∘∊200⌶)⎕NR ⍵
}
```
</section>