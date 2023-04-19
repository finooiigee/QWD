# Building

```bash
find . -type d -print | xargs -I {} bash -c "cd '{}' && ./markdown.sh"
```