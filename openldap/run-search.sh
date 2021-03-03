#!/bin/bash 
ldapsearch -x \
  -H ldap://localhost \
  -b dc=confluentdemo,dc=io \
  -D "cn=admin,dc=confluentdemo,dc=io" \
  -w admin
