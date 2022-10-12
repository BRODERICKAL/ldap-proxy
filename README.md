# LDAP Bridge to connect to Google LDAP
### Create a google auth secret out of google provided key
```
oc create secret generic google-auth-cert --from-file=tls.crt=<GOOGLE cert> --from-file=tls.key=<GOOGLE key> --from-file=ca.crt=<GOOGLE cert>
```

### app install
```
helm install ldap-proxy .
```

### Test install
```
oc port-forward svc/ldap-proxy 1636:636
```

and in another window:
```
LDAPTLS_REQCERT=never ldapsearch -H ldaps://localhost:1636 -b <base, e.g. dc=example,dc=com> -D <bind DN username> -w <bind DN key>  '(mail=<mail to search>)'
```
