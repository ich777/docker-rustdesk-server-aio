# RustDesk Server AiO (self-hosted version) in Docker optimized for Unraid
Self-host your own RustDesk Server, it is free and open source.

This container includes both the RustDesk Server and the RustDesk Relay in one and starts it (self-hosted version).

## Env params
| Name | Value | Example |
| --- | --- | --- |
| HBBS_ENABLED | The server needs by default the following ports to work properly: TCP: 21115, 21116, 21118 UDP: 21116 | true |
| HBBS_PARAMS | Enter your extra start up parameters for the server here if necessary. | --key _ |
| HBBR_ENABLED | The relay needs by default the following ports to work properly: TCP: 21117, 21119 | true |
| HBBR_PARAMS | Enter your extra start up parameters for the relay here if necessary. | --key _ |
| UID | User Identifier | 99 |
| GID | Group Identifier | 100 |
| DATA_PERM | Data permissions | 770 |
| UMASK | Set permissions for newly created files | 000 |

## Run example
```
docker run --name RustDeskServer-AiO -d \
    -p 21115-21119:21115-21119 21116:21116/udp -p  \
    --env 'HBBS_ENABLED=true' \
    --env 'HBBS_PARAMS=--key _' \
    --env 'HBBR_ENABLED=true' \
    --env 'HBBR_PARAMS=--key _' \
    --env 'UID=99' \
    --env 'GID=100' \
    --env 'DATA_PERM=770' \
    --env 'UMASK=000' \
    --volume /path/to/rustdesk-server:/rustdesk-server \
    --restart=unless-stopped\
    ich777/rustdesk-server-aio
```

This Docker was mainly edited for better use with Unraid, if you don't use Unraid you should definitely try it!
 
#### Support Thread: https://forums.unraid.net/topic/83786-support-ich777-application-dockers/
