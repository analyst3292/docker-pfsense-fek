docker-pfsense-elk

## logstash-pfsense
| Name | Variable | Default |
|:-----|:---------|:--------|
| TIMEZONE | `TIMEZONE` | UTC |
| DAST_NETS | `DAST_NETS` | "192.168.0.0/24", "fe80::/64" |

# PFSense syslog format
```
/^(?<time>[^ ]*\s*[^ ]* [^ ]*) (?<host>[^ ]*) (?<ident>[a-zA-Z0-9_\/\.\-]*)(?:\[(?<pid>[0-9]+)\])?(?:[^\:]*\:)? (?<message>.*)$/
```
```
2016-09-26 00:00:00 +0000 pfsense.local0.info: {"host":"19:46:25","ident":"filterlog","message":"48,16777216,,1000000201,em0,match,block,in,4,0x10,,255,53650,0,DF,112,carp,56,192.168.11.1,224.0.0.18,advertise,255,1,2,0,1"}
2016-09-26 00:00:00 +0000 pfsense.local0.info: {"host":"19:46:25","ident":"filterlog","message":"48,16777216,,1000000201,em0,match,block,in,6,0x00,0x00000,255,VRRP,112,36,fe80::100:1000:1001:1011,ff02::12,"}
```