<section>

# xmln

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

```apl
#include(home/e/maple/xmln.aplf)
```

</section>
