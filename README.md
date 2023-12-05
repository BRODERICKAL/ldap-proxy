# LDAP Proxy to allow Connectivity to Google Cloud Identity using Client Authentication
### Create a Google auth secret out of Google provided key
```
oc create secret generic google-auth-cert --from-file=tls.crt=<GOOGLE cert> --from-file=tls.key=<GOOGLE key> --from-file=ca.crt=<GOOGLE cert>
```
### Update a Google auth secret out of Google provided key
```
oc delete secret google-auth-cert
oc create secret generic google-auth-cert --from-file=tls.crt=<GOOGLE cert> --from-file=tls.key=<GOOGLE key> --from-file=ca.crt=<GOOGLE cert>
oc delete pod -lapp=ldap-proxy
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
