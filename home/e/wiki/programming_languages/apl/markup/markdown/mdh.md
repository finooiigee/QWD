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

```apl
#include(home/e/maple/mdh.aplf)
```

</section>
