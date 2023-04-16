#!/bin/sh

for i in *.md
do echo "
<html>
<head>
<link rel=\"stylesheet\" href=               \"style.css\" type=\"text/css\">
<link rel=\"stylesheet\" href=\"/public/assets/style.css\" type=\"text/css\">
</head>
<body>$(markdown $i)</body>
</html>
" > "${i%md}html"
done
