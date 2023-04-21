<section>

# Collect all \[parent, \[child\]\] pairs in a hierarchy

Given an array of integers which corresponds to the depth of a traversal path return an array of parent and children pairs. A node in the return format should be represented by an index into the nodes sorted by order of authority\*

E.g in the hierarchy:

```
     a
   / | \
  b  c  d
 /
e

```

The order of authority\* is `a > b > c > d > e`, and so the format of the nodes `[a,b,e,c,d]` is `[1,2,5,3,4]`

</section>

<section>

# Examples

The hierarchy below has a depth array of: `[1,2,3,2,2]` by traversing the path: `(a) (a -> b) (a -> b -> e) (a -> c) (a -> d)`

```
     a
   / | \
  b  c  d
 /
e

```

The correct result given the argument `[1,2,3,2,2]` would be: `[[1,[2,3,4]],[2,[5]]`

</section>

<section>

# Test-cases

`[1,2,3,3,3,3,3,2,3,4,4,4,3,3,3,4,4,3,4,4]` -> `[[1,[2,3]],[2,[4,5,6,7,8]],[3,[9,10,11,12,13]],[9,[14,15,16]],[12,[17,18]],[13,[19,20]]]`

</section>

<section>

<input type="checkbox" checked="" />
<label for="solutions">hide solutions</label>
<div id="solutions">

# Solutions

[Essie](/home/e) <sub>[essie@lovett.gay]</sub>

```
{⊃,/(1∘↓(({⊂⍺ ⍵}⌸/∘↓∘⍉1↓{(⌊/⍵),⍺}⌸)⍤1)¯1∘↓)⌈\(⍋⍋⍵)@⊢(∪⍵)∘.=⍵}
```

</div>

</section>
