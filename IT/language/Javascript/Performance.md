# Performanceを利用してブラウザ上の速度を計測する。

## 最もかんたんな実装
- performance.now()
-- 参照時点から経過したミリ秒数を表す DOMHighResTimeStamp を返します。

```
console.log(performance.now());
```

## markでマーキングして、measureで計測
- performance.mark()
-- 指定された名前でブラウザのパフォーマンスエントリバッファにタイムスタンプを作成します。
- performance.measure()
-- 指定された2つのマーク (それぞれ開始マークと終了マークと呼ばれる) の間に、ブラウザのパフォーマンスエントリバッファ内に名前付きタイムスタンプを作成します。

```
performance.mark('A');
...
performance.mark('B');
# Performという名前のAからB地点の計測
performance.measure('Perform','A','B');
console.log(performance.getEntriesByName('Permform'));
```

## その他
- performance.clearMarks()
-- ブラウザのパフォーマンスエントリバッファから指定されたマークを削除します。
- performance.clearMeasures()
-- ブラウザのパフォーマンスエントリバッファから指定された数値を削除します。
- performance.clearResourceTimings()
-- ブラウザのパフォーマンスデータバッファから "resource" の entryType を持つすべての performance entries を削除します。
- performance.getEntries()
-- 与えられたフィルタに基づく PerformanceEntry オブジェクトのリストを返します。
- performance.getEntriesByName()
-- 指定された名前とエントリタイプに基づいて PerformanceEntry オブジェクトのリストを返します。
- performance.getEntriesByType()
-- 与えられたエントリタイプの PerformanceEntry オブジェクトのリストを返します。

-performance.setResourceTimingBufferSize()
-- ブラウザのリソースタイミングバッファサイズを、指定された数の "resource" タイプ パフォーマンスエントリ オブジェクトに設定します。
- performance.toJSON()
-- Performance オブジェクトを表す json オブジェクトを返す jsonizer です。

## 引用:
https://developer.mozilla.org/ja/docs/Web/API/Performance (20200128)
