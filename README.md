Create a new repository on the command line

```bash
touch README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:bstaub/shellscripts.git
git push -u origin master
```

Push an existing repository from the command line

```bash
git remote add origin git@github.com:bstaub/shellscripts.git
git push -u origin mastera
```
