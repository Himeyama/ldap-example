#!/usr/bin/env bash

# パスワードのデフォルト: password
if [[ -z $LDAP_PASSWD ]]; then
    LDAP_PASSWD="password"
fi

BASEDN="dc=hikari-dev,dc=com"
BINDDN="cn=admin,$BASEDN"

docker stop openldap
docker rm openldap

LDAP_PASSWD=$LDAP_PASSWD docker-compose up -d

sleep 3
ldapmodify -D cn=admin,cn=config -w $LDAP_PASSWD -f examples/access.ldif
ldapmodify -a -c -D $BINDDN -w $LDAP_PASSWD -f examples/base.ldif
ldapmodify -a -c -D $BINDDN -w $LDAP_PASSWD -f examples/passwd.ldif
