<section>

# Notation

```
Ⓧ ← {{⊂⍺↓⍵}⌺⍺⊢⍵}            ⍝ Compositional stencil
⍙ ← {⍺←⊢ ⋄ ⍺(⍵⍵⍣¯1 ⍺⍺⍥⍵⍵)⍵} ⍝ Under: apply pre-processing with ⍵⍵ before main function ⍺⍺, then reverse pre-processing
```

# Transformations

```
⍝ Idioms and transformations on hierarchies
```
<code class="prompt">tree</code>
```
     A
┌─┬──┼──┬─┐
B C  D  E F
│  ┌─┼─┐
G  H I J
```
<code class="prompt">pairs</code>
```
pairs ← {
   parents  ← ((1⊖⍵∊'┼│')/⍥,⍵)@(∊∘'┼│')⍵
   siblings ← {
       windows ← ,¨1 3 Ⓧ ⍵
       mask    ← (∊∘⎕A ∧⍥(∨/) ∊∘'┌─┬─┐')¨windows
       ⊃¨(mask/⍥,(⎕A∘∩)¨windows)@{mask}⍵
   }⍣≡parents
   slices ← (⍪2 2) Ⓧ 1↓siblings
   pairs  ← ⊃,/{⊂⍺,⊂⍵~' '}⌸/⍙↓¨slices
   (' '≠⊃¨pairs)/pairs
}
```
<code class="prompt">siblings</code>
```
     A     
AAAAAAAAAAA
B C  D  E F
B  DDDDD   
G  H I J 
```
<code class="prompt">pairs tree</code>
```
┌───────────────┬───────┬───────────┐
│┌─┬───────────┐│┌─┬───┐│┌─┬───────┐│
││A│┌─┬─┬─┬─┬─┐│││B│┌─┐│││D│┌─┬─┬─┐││
││ ││B│C│D│E│F││││ ││G││││ ││H│I│J│││
││ │└─┴─┴─┴─┴─┘│││ │└─┘│││ │└─┴─┴─┘││
│└─┴───────────┘│└─┴───┘│└─┴───────┘│
└───────────────┴───────┴───────────┘
```

</section>