# CLIから自動アップグレードを無効にする
sudo vi /etc/apt/apt.conf.d/20auto-upgrades

## 中身を見る
```
# Packageリストの自動更新 
APT::Periodic::Update-Package-Lists "1";
# セキュリティ上の自動更新
APT::Periodic::Unattended-Upgrade "1";
# パッケージの自動アップグレード
APT::Periodic::Download-Upgradeable-Packages "1";
```

## 変更

```
--- 20auto-upgrades	2020-02-07 08:18:38.944499661 +0900
+++ 20auto-upgrades	2020-02-07 08:19:16.455440381 +0900
@@ -1,3 +1,3 @@
-APT::Periodic::Update-Package-Lists "1";
+APT::Periodic::Update-Package-Lists "0";
 APT::Periodic::Unattended-Upgrade "1";
-APT::Periodic::Download-Upgradeable-Packages "1";
+APT::Periodic::Download-Upgradeable-Packages "0";

```