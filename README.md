# LDAP のサンプル
LDAP のコンテナを使用して、
Linux でログイン可能な環境をつくる。

## 依存
- docker

## 設定すべきファイル
- docker-compose.yml
    - LDAP_ORGANISATION (組織名)
    - LDAP_DOMAIN (ドメイン名)
    - LDAP_BASE_DN (ベース DN)
    - LDAP_ADMIN_PASSWORD (cn=admin,dc=... のパスワード)
    - LDAP_CONFIG_PASSWORD (cn=admin,cn=config のパスワード)
- create-container.sh
    - BASEDN (ベース DN)
    - BINDDN (バインド DN)
    - LDAP_PASSWD (パスワード: ADMIN と CONFIG)
- examples/base.ldif
    - ベース DN を書き換える
- examples/passwd.ldif
    - ユーザー名、パスワードを書き換える
    
## 問題点 (?)
example/access.ldif で指定している olcAccess の設定がセキュリティー的に望ましいかが
よくわからないので検証する必要あり。


## コンテナの生成
```sh
# chmod +x create-container.sh
./create-container.sh
```

