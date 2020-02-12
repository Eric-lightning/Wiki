# CSVを配列に格納する
## ポイント
- 改行とコンマで区切られた二次元配列
- split()を使う

- src(TEXT)からcsv_tbl(ARRAY)へ
```
//made: 20200127
// 改行別に配列化。
const csv_lines = src.split('\n');
const csv_tbl    = [];
for(let y = 0;  y < csv.length; y++){
    // 最終行（最終行判定: Undefined？Null？空文字？）にBreak
		if(csv_line[y] == '') break;
		//現在行のコンマ別に配列化
		csv_tbl[y] = csv_ lines[y],split(',');
}
```
		
		
		

