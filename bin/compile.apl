#!/usr/bin/dyalogscript SESSION_FILE=/opt/mdyalog/18.2/64/unicode/default.dse
⎕SE.Link.Import # 'home/e/maple'

Tag  ← {'<',⍺,'>',⍵,'</',⍺,'>'}
files ← (⊃0⎕NINFO⍠1⍠'Recurse' 1,∘'/*.md')'.'

header ← '<link rel="stylesheet" href="/public/assets/style.css" type="text/css">'
header,← '<link rel="stylesheet" href=               "style.css" type="text/css">'

{
  content ← ⊃⎕NGET ⍵
  incl ← '^#include(.*)' ⎕R { ⊃⎕NGET ¯1↓∊1↓'('(≠⊆⊢)⍵.Match } content ⍝ including external files
  html ← '((<span.*>)?)#((<\/span>)?)((<span.*>)?)\.((<\/span>)?)[a-zA-Z]*' ⎕R {
    ⍝ match APL namespace hierarchies allowing optional wtokc elements
    {
      v ← ⍵/⍨(≠\⍱⊢)⍵∊'<>' ⍝ without HTML tags
      names ← ∊1↓,'/',⍪1↓'.'(≠⊆⊢)v
      '<a style="color:rgb(190,225,240)" href="/home/e/maple/',names,'.html">',v,'</a>'
    }⍵.Match
  } mdx incl ⍝ markdown as HTML
  ('.html',⍨⍵/⍨0=∨\'.md'⍷⍵) 1 ⎕NPUT⍨ 'html' Tag ('head' Tag header),'body' Tag html
}¨files
