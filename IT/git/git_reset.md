# git reset -
- ステージングの取り消し。
## 補足:
```
Working Tree --- Wrote --------->
INDEX ---------- git add ------->
HEAD  ---------- git commit ---->
```
`HEAD`のエイリアス: `@`
直前のHEAD: `HEAD^` `@^`
- 詳細は[IT/git/全体図.md]()

##　オプション
- 直前のCOMMIT取消
  - git reset --soft ^@
- 直前のCOMMITだけでなく直前の書込含めて（Working Treeも）取消
　- git reset --hard ^@
