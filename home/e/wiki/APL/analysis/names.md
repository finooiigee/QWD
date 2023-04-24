<section>

# names

<code>Index:[Analysis](../analysis.html)|[Debugging](../debugging.html)</code>

</section>

<section class="function">

Returns assigned variables in a dfn.

```apl
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

```apl
#include(home/e/maple/names.aplf)
```

</section>
