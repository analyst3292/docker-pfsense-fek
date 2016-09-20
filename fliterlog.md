## udp
```
2016-09-20 16:54:15 +0000 pfsense.local0.info: {"host":"filterlog:","ident":"105","message":",16777216,,1470124826,em2,match,pass,in,4,0x10,,64,19328,0,DF,17,udp,76,172.18.15.15,192.33.214.47,60507,123,56"}

2016-09-20 16:54:15 +0000 pfsense.local0.info: 
{
	"host":"filterlog:",
	"ident":"105",
	"message":",16777216,,1470124826,em2,match,pass,in,4,0x10,,64,19328,0,DF,17,udp,76,172.18.15.15,192.33.214.47,60507,123,56"
}

```
+ message
	+ `Rule Number` : 16777216,
	+ `Sub rule number` : ,
	+ `Ancher` : 1470124826,
	+ `Real interface` : em2,
	+ `Reason for the log entry` : match,
	+ `Action taken that resulted in the log entry` : pass,
	+ `Direction of the traffic` : in,
	+ `IP version` : 4,
		+ `TCS` : 0x10,
		+ `ECN` : ,
		+ `TTL` : 64,
		+ `ID` : ,
		+ `Offset` : 19328,
		+ `Flages` : 0,
		+ `Protocol ID` : DF,
		+ `Protocol ID ` :17,
		+ `Protocol text : udp,
		+ `Length` : 76,
		+ `Source IP` : 172.18.15.15,
		+ `Destination IP` : 192.33.214.47,
		+ `Source Port` : 60507,
		+ `Destination Port` : 123,
		+ `Data Length` : 56



## ipv6 
```
2016-09-20 16:54:15 +0000 pfsense.local0.info: {"host":"filterlog:","ident":"48","message":":20c:29ff:fe49:4ae7,ff02::12,"}
```

## carp
```
2016-09-20 16:54:15 +0000 pfsense.local0.info: {"host":"filterlog:","ident":"48","message":",16777216,,1000000201,em0,match,block,in,4,0x10,,255,58788,0,DF,112,carp,56,192.168.0.251,224.0.0.18,advertise,255,1,2,0,1"}
```