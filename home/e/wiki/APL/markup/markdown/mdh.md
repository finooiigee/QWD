<section>

# mdh

</section>

<section class="function">

Translates markdown into HTML

```
      markdown
# Section
## Subsection

* a
 * b
  * c
* d

Hello,
[World](https://en.wikipedia.org/wiki/World)

```

```
      mdh markdown
<h1>Section</h1>
<h2>Subsection</h2>

<ul>
  <li>
    a
    <ul>
      <li>
        b
        <ul>
          <li>c</li>
        </ul>
      </li>
    </ul>
  </li>
  <li>d</li>
</ul>

<p>Hello,
<a href="https://en.wikipedia.org/wiki/World">World</a>
</p>
```

</section>

<section class="function">

```
mdh ← {
  nl       ← ⎕JSON '"\n"'
  Tag      ← {'<',⍺,'>',⍵,'</',⍺,'>'}
  Trim     ← {(∨\' '≠⍵)/⍵}
  _R_      ← {⍺⍺⎕R(⍵⍵{⍵.Match})⍠'Mode' 'M'⊢⍵}
  _Ignore  ← {
    ∊(⍺⍺{⍺⍺¨@(⍸∧/¨⍺)⊢⍵})/mask ⍵⊂⍨¨⊂1,2≠/mask←(≠\⍱0 ¯1 ¯2(⊃∨.⌽)⊂)¯1⌽(nl,'```')⍷⍵
  }
  _Literal ←  (,¨'<' '>')⎕R'&lt;' '&gt;'⍠('Regex' 0)

  html ← '^(#{1,6}\s*).*' _R_ {
    (prfx title)←⍵⊂⍨≠∧\'#'=⍵
    ('h',⍕≢prfx) Tag Trim title
  } _Ignore ⍵

  html ← '\[(.*?)\]\(.*?\)' _R_ {
    (alias href)←']('(((0=⊢∨¯1⌽⊢)⍷)⊆⊢)¯1↓1↓⍵
    '<a href="',href,'">',alias,'</a>'
  } _Ignore html

  html ← '^\*.*(\n[ ]*?\*.*)*' _R_ {
    k ←   '\*.*'⎕S{Trim 1↓⍵.Match} ⍵
    d ← +/∧\'*'≠↑nl(≠⊆⊢)⍵
    (p c) ← ↓⍉↑⊃,/2{↑{⊂⍺ ⍵}⌸⍨/↓⍉1↓⍵,∘(⌊/)⌸⍺}/↓⌈\(⍋d)@⊢(∪d)∘.=d
    'ul' Tag∊ {
        ⍵∊p: 'li' Tag (k[⍵],'ul' Tag∊ ∇¨(p⍳⍵)⊃c)
             'li' Tag (k[⍵])
    }¨(⍸⌊/=⊢)d
  } _Ignore html

  html ← '^([^\<\s]|<code|<a).*(\n([^\<\s]|<code|<a).*)*' _R_ {
    'p' Tag ⍵
  } _Ignore html
  html ← '`[\s\S]+?`' _R_ ({'code' Tag ¯1↓1↓⍵ } _Literal) _Ignore html
  html ← '^```([\s\S]+?)^```' _R_ ({'pre' Tag∊ ¯1↓1↓⍵⊂⍨1,2≠/nl≠⍵} _Literal) html

  html
}
```

</section>
