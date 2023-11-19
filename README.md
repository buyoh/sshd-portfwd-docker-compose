# sshd-portfwd-docker-compose

Use sshd only for remote port forwarding

## Testing

Generate keys.

```bash
cd keys
ssh-keygen -f id_rsa
sudo chown root:root id_*
sudo chmod 600 id_*
```

Add your authorized_keys

```bash
cp ~/.ssh/id_rsa.pub keys/authorized_keys
```

(Re)start docker compose

```bash
docker compose -f docker-compose.yml down --rmi local --volumes
docker compose -f docker-compose.yml up
```

Start local http server 8001

```bash
python3 -m http.server
```

Confirm that local http server works

```bash
curl http://localhost:8001 -s | head
```

Connect ssh with remote port forwarding

```bash
ssh localhost -p 12222 -l remote -N -R 0.0.0.0:8888:127.0.0.1:8001
```

Access the http server via docker

```bash
curl http://localhost:8888 -s | head
```

## Is it a better solution!?

なんだこれ
