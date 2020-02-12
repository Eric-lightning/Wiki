# git add -
- git add で　ステージング！
- 取り消しは`git reset`
```
git add foo.txt
git add bar/foo.txt

# addされるファイルのチェック
git add *.md

# SOURCE_TREEを使って行単位でステージング
git add -p

# 変更されたファイルのみステージング
git add -u
git add -u *.md

# 再帰的 - Recursive
git add bar/

# All: New/Remove/Change 
git add -A
## *.md file only
git add -A *.md

# All: Current Dir 
git  add *
# md file only: Current Dir
gir add *.md
