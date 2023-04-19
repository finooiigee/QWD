<section>

# xmln
---
<code>Index:[XML](../xml.html)</code>
</section>

<section class="function">

Returns a JSON object from XML.

```
      html ⍝ XHTML-compatible HTML
<html>
  <body>
    <span style="font-weight:bold;">Hello, World!</span>
    <h1>Lorem,<br /></h1>
    <h1>Ipsum! </h1>
  </body>
</html>
      
```

```
      ⎕JSON xmln html
{
  "html": {
    "body": [
      {
        "span": [
          "Hello, World!",
          {
            "style": "font-weight:bold;"
          }
        ]
      },
      {
        "h1": {
          "br": {},
          "": "Lorem,"
        }
      },
      {
        "h1": "Ipsum!"
      }
    ]
  }
}
```

</section>

<section class="function">

```
xmln←{ ⍝ XML -> JSON object
    obj arr char←1 2 4 ⍝ JSON types
    (d k v a t)←↓⍉¯1 ''⍬(0⍴'' '')1⍪⎕XML ⍵

    ⍝ pre-processing ; see: ]help ⎕XML ⎕JSON
    d+←1 ⋄ ((t∊1 3 7)/t)←obj ⋄ ((t∊5)/t)←char ⋄ (((⊂'')⍷v)/v)←⊂⍬ 
    I←{(⍺,⍵)[⍺⍺]}

    ⍝ Insert attributes as children
    idx←≢¨a
    i←⍋(⍳≢k),⍸idx
    (k v)←{⍵[i]}¨k v,¨↓⍉↑⊃,/↓¨(0<idx)/a
    d←d(i I)d[⍸idx]+1
    t←obj char[1+0≠∊⍴¨v]

    ⍝ node pairs from depth vector
    N←{⊃,/2{↑{⊂⍺ ⍵}⌸⍨/↓⍉1↓⍵,∘(⌊/)⌸⍺}/↓⌈\(⍋⍵)@⊢(∪⍵)∘.=⍵}
    (p c)←↓⍉↑N d ⍝ parents | children

    ⍝ Insert object's character data as child
    idx←p∩⍸t=char
    i←⍋(⍳≢k),idx
    v←(((⊂⍬)@idx)v)(i I)v[idx]
    d←d(i I)d[idx+1]
    k←k(i I)(≢i)⍴⊂''
    t[idx]←arr ⍝ Objects with character data to type arr
    t←t(i I)(≢i)⍴⊂char

    (p c)←↓⍉↑N d

    ⍝ de-duplicate tree by changing parent type to arr
    msk←{0∊≠k[⍵]}¨c
    (t[msk/p])←arr
    idx←((∊(t[p]=arr)/c)∩⍸0≠∊⍴¨k)∪∊msk/c
    d[idx]+←1
    d[∊(p∊idx)/c]+←1
    i←⍋(⍳≢k),idx-1
    v←v(i I)(≢i)⍴⊂⍬
    d←d(i I)d[idx]-1
    k←k(i I)(≢i)⍴⊂''
    t←t(i I)(≢i)⍴1
    ⎕JSON 1 ⎕JSON⍠'M'⍉↑d k v t
}
```
</section>