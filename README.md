# Markdown Wiki
自身が公開できる範囲での覚書

## 準拠 - Conform -
- Marked
  - GCM(GitHub Standard) v0.8
  - Common Mark v0.8
- MathJax
- Unique Roles
  - InterWikiName
  - Color Define
  - Default Link target _blank
  - and so on.
 
## レンダリング - Rendering

### Markdownが欲しい場合 - Get Markdown File
```
curl -G https://md.eric-lightning.info/dowwload.php?file=README.md > $FILE
```
*注意! - ATTENSION!*
*独自の記法があったり、MathJaX（TeX）記法があるので、通常のMarkdownパーサーでは正常にパースされない可能性があります。*

### HTMLが欲しい場合 - Get HTML File
```
curl -G https://md.eric-lightning.info/htmldl.php?file=README.md > $FILE
```
*注意! - ATTENSION!*
*ブラウザ上で、https://md.eric-lightning.info からJSライブラリを取得し、整形します。 w3mなどでは表示できません。また、CORSが効いているので、FirefoxなどでCORSをブロックしてたら、正常に反映されない可能性あり。素のMarkdownのみならば、 `npm install marked` をあらかじめしておき、 *
```
curl -G https://md.eric-lightning.info/dowwload.php?file=README.md | marked > $FILE
```
*というやり方もあります。(もちろん独自記法は反映なし）*


### PDFが欲しい場合 - Get PDF File
```
curl -G https://md.eric-lightning.info/htmldl.php?file=README.md | wkhtmltopdf - $FILE
```
dependency - wkhtmltopdf
*注意! - ATTENSION!*
*MathJaxのレンダリングは反映されません。 *

## いくつかの方法
```
$ git clone https://github.com/Eric-lightning/Wiki
# 一箇所にまとめたり
$ mv `find ./Wiki -type f | xargs` MDFiles
# Webでみたり
$ ./caddy browse markdown
# pandoc で HTMLやPDFに吐いたり。n
