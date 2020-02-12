# ssh-keygenコマンド
## MyBestKeygen!!
```
# [-p ""]でパスフレーズなし（対話なし）, [ -f xxx ] で xxxとxxx.pubができる
## RSA
ssh-keygen -b 4096 -t rsa -f [file]
## ECDSA
ssh-keygen -b 521 -t ecdsa -f [file]
##EdDSA
ssh-keygen -b 256 -t ed25519 -f [file]
```

## オプション
- [-q ] Quiet
- [-b ビット数 ]
- [-t dsa | ecdsa | ed25519 | rsa ]

|暗号|推奨について|
|:--:|:----------:|
|DSA  | 非推奨。|
|RSA  |2048bit以上，但し2031年まで（NISTより）非推奨. 4096bit推奨 |
|ECDSA| 楕円曲線暗号[256bit | 384bit |521bit (Not512bit)] |
|EdDSA| Edwards-curve Digital Signature Algorithm [256bit only] |

2019年現在状況

- [-N 新しいパスフレーズ ]
- [-C コメント (SSH1のみ/SSH2はこめんとなし)]
- [-f 出力先identityファイル ]

## パスワードの変更
```
ssh-keygen -p [-P 古いパスフレーズ ] [-N 新しいパスフレーズ ] [-f パスフレーズを変更するidentityファイル ]
```

### 変換
```
ssh-keygen -i [-m 鍵の形式 ] [-f 変換するidentityファイル ]
ssh-keygen -e [-m 鍵の形式 ] [-f 変換するidentityファイル ]
```

### 秘密鍵ファイル(OpenSSH形式) -> 公開鍵を標準出力
```
ssh-keygen -y [-f identityファイル ]
```

### コメントを変更（SSH1)
```
ssh-keygen -c [-P パスフレーズ ] [-C コメント ] [-f コメントを変更するidentityファイル ]
```

```
### 表示系・現在使用している鍵の強度を確認
-ssh-keygen -l [-v ] [-E 鍵の指紋ハッシュ ] [-f 指紋を表示するidentityファイル
-ssh-keygen -B [-f ダイジェストを表示するidentityファイル ]
----
-ssh-keygen -D pkcs11
-ssh-keygen -F ホスト名 [-f known_hostsファイル ] [-l ]
-ssh-keygen -H [-f known_hostsファイル ]
-ssh-keygen -R ホスト名 [-f known_hostsファイル ]
-ssh-keygen -r ホスト名 [-f 入力するidentityファイル ] [-g ]
-ssh-keygen -G 出力ファイル [-v ] [-b ビット数 ] [-M 使用メモリ量 ] [-S 開始位置 ]
-ssh-keygen -T 出力ファイル -f 入力ファイル [-v ] [-a ラウンド数 ] [-J 行数 ] [-j 開始行 ] [-K チェックポイント ] [-W ジェネレータ ]
-ssh-keygen -s CA鍵 -I 証明書の秘密鍵 [-h ] [-n principal ] [-O オプション ] [-V 有効期間 ] [-z シリアル番号 ] file
 証明書に署名するときの有効期間を指定します。有効期間には単一の日時が指定されていることがあり、
 この場合、その証明書が現在からある特定の日時まで有効であることを示しています。
 また、有効期間としてコロンで区切った2つの時刻が指定されている場合、
 これらは証明書が有効な開始時刻と終了時刻を示しています。
 開始日時は YYYYMMDD の形式で日付だけを示すか、YYYYMMDDHHMMSS の形式で日付と時刻を示すことができます。
 あるいは、マイナス記号をつけた (現在からの)相対的な日時を指定することもできます。
 この場合はsshd_config (5) の「時間の表現」で解説されている形式にしたがいます。
 終了日時は YYYYMMDD の日付、 YYYYMMDDHHMMSS の時刻、あるいはプラス記号をつけた相対日時を指定することができます。
 
 例:
 "+52w1d"(現在から 52週間と 1日間のあいだ有効)
 "-4w:+4w"(4週間前から4週間後まで有効)
 "20100101123000:20110101123000"(2010年1月1日 午後12時30分から、2011年1月1日 午後12時30分まで有効)
 "-1d:20110101"(昨日から2011年1月1日の午前0時まで有効)
 
-ssh-keygen -L [-f 入力する鍵ファイル ] ssh-keygen -A ssh-keygen -k -f KRLファイル [-u ] [-s ca_public ] [-z version_number ] file ssh-keygen -Q -f KRLファイル file
```
