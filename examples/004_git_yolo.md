Git Yolo
========

Today I added the following to my `~/.bashrc`

```bash
alias gityolo='git add -A && git commit -m "$(curl -s http://whatthecommit.com/index.txt)" && git push origin "$(git rev-parse --abbrev-ref HEAD)"'
```
