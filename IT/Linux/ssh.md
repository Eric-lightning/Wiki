# SSH関連
なにこれ？https://www.ssh.com
## 背景

- 平文ソフトウェア: TELNET RSH RLOGIN RCP
  - Sniffer Attack (パケット・ネットワーク解析) による平文セキュリティの突破。
    - 暗号プロトコルを実装したリモートアクセスツールの開発の必要性。
- 1995年 Tatu Ylönen によるSSHアプリケーションの開発 -> SSHの誕生

## 主要ソフトウェア

- BSD:[OpenSSH.md]()
- GNU:[LSH](http://www.lysator.liu.se/~nisse/lsh/)

本稿では、Linuxクライアントで主流のOpenSSHを扱う。

## プロトコル・規格
- RFC 4250〜4256

 |Version   |About |
 |:--------:|:----:|
 |Version 1 |通信ストリームに侵入者のデータ挿入を認めるセキュリティ不正アクセスとして知られる脆弱性がある |
 |Version 2 |不正アクセスに対して攻撃を受けないように鍵交換アルゴリズムを改良 |

## 設定

### クライアント
- トンネリング解説記事：https://www.kmc.gr.jp/advent-calendar/ssh/2013/12/09/tunnel2.html
- 合わせて読む：[IT/Linux/Terminal_Emulator.md]()

### ssh-keygen
- [IT/Linux/ssh-keygen.md]()

### 公開鍵を配布
```bash
ssh-copy-id -i ${identity_file} ${USER}@${target_host} または　ssh-copy-id  ${USER}@${target_host}
 cat ~/.ssh/id_rsa.pub | ssh ${USER}@${target_host} "mkdir -p ~/.ssh; cat >> ~/.ssh/authorized_keys"　と同じ意味
```

### /etc/ssh/sshd_config
/etc/ssh/sshd_config:
```bash
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
```
- SSHのiオプションで鍵を明示的に指定可能

### $HOME/.ssh/config
includeを用いて、複数ファイル・階層で管理を行うとよい。但し、Includeは旧いOpenSSHには実装されていないため、BASH等で予め config に書き込んでおく必要がある。

- config

```
include */subconf
```

- ~/.ssh/*/subconf

```
Host www.example.com
    HostName xxx.xxx.xxx.xxx
    User eric
    IdentityFile ~/.ssh/*/secretfile
```

### 権限の設定

所有者のみ読込アクセス出来るようにしておく。

```
# 相手先の.sshディレクトリが読込可能になっているか？
chmod 600 REMOTE:~/.ssh
# 秘密鍵ファイルは明示的に読込専用
chmod 600 LOCAL:~/.ssh/xxx/key
```

----

## 参考文献
- [sshd の設定（sshd_config）[サーバの実験室 Slackware] ](http://www.nina.jp/server/slackware/openssh/sshd_config.html)
- [ssh のログレベルを変更する](https://qiita.com/pekepek/items/f38004b14e986691f30d)
        
