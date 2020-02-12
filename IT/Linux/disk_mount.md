このページは、マウント関連の話題ページです。マウントコマンド単体については[mount.md]()で。
------
### Exfatのマウント
- 必要パッケージ: exfat-fuse exfat-utils
```
mount -t exfat [block_dev] [mount_point]
```
### WebDavのマウント
```
: "install davfs2 (注: 途中,TUI上でRoot権限のみが利用するかの問がでる）"
sudo apt install davfs2
: "davfs2グループに自陣を追加(※whoamiは自身のユーザー名を返すコマンド）"
sudo usermod -aG davfs2 $(whoami)
: "設定ディレクトリの作成とマウントポイントの追加"
mkdir -p $HOME/.davfs2
mkdir -p $_MOUNT_POINT
: "設定の追加と権限の設定"
echo "$_webdav_URL $_webdav_USER $_webdav_PASSCODE" >> $HOME/.davfs2/secrets
chmod 600 $HOME/.davfs2/secrets
: "------------------------------------------------------------------------------"
: "/etc/fstab に設定（起動時にマウント）"
: "バックアップ"
sudo cp -p /etc/fstab /etc/fstab.$(date +%Y%m%d%H%M%S).bkup
: "書き込み"
echo "$_webdav_URL $_MOUNT_POINT davfs user,noauto 0 0" |>> /etc/fstab
: "マウント"
sudo mount $_MOUNT_POINT
```
### SSH経由
```bash
: "install sshfs"
sudo apt install sshfs
: "backup fstab"
sudo cp -p /etc/fstab /etc/fstab.$(date +%Y%m%d%H%M%S).bkup
: "write fstab"
sudo echo "sshfs#${_SSH_USER}@${_SSH_HOST}:${_REMOTE_DIR} $_MOUNT_POINT fuse allow_other,IdentityFile=${_PUB_SECRET_KEY_LOCATION},ServerAliveInterval=60 0 0" |>> /etc/fstab
: "mount all"
sudo mount $_MOUNT_POINT
```
