# docker compose with named volume playground

Prerequisite:

- docker
- direnv

## Getting started

### Start all instances

Start `instance_1` of `project_a`:

```
$ cd project_a_instance_1
$ direnv allow
$ docker compose up -d --wait
$ cd ..
```

Start `instance_2` of `project_a`:

```
$ cd project_a_instance_2
$ direnv allow
$ docker compose up -d --wait
$ cd ..
```

Start `instance_1` of `project_b`:

```
$ cd project_b_instance_1
$ direnv allow
$ docker compose up -d --wait
$ cd ..
```

Start `instance_2` of `project_b`:

```
$ cd project_b_instance_2
$ direnv allow
$ docker compose up -d --wait
$ cd ..
```

### Take a look at the containers and volumes created

```sh
$ docker ps
CONTAINER ID   IMAGE         COMMAND                  CREATED              STATUS                            PORTS                                           NAMES
449f23aac115   postgres:17   "docker-entrypoint.s…"   3 seconds ago        Up 2 seconds (health: starting)   0.0.0.0:32780->5432/tcp, [::]:32780->5432/tcp   project_b_3fe92c83432f-postgres-1
60f183f75f14   postgres:17   "docker-entrypoint.s…"   27 seconds ago       Up 26 seconds (healthy)           0.0.0.0:32779->5432/tcp, [::]:32779->5432/tcp   project_b_d925a8ba9e04-postgres-1
b1d1cbdd42da   postgres:17   "docker-entrypoint.s…"   40 seconds ago       Up 40 seconds (healthy)           0.0.0.0:32778->5432/tcp, [::]:32778->5432/tcp   project_a_d4cfab7403e2-postgres-1
4e9f93918c36   postgres:17   "docker-entrypoint.s…"   About a minute ago   Up About a minute (healthy)       0.0.0.0:32777->5432/tcp, [::]:32777->5432/tcp   project_a_a04e7305aa09-postgres-1
```

```sh
$ docker volume ls
DRIVER    VOLUME NAME
local     project_a_a04e7305aa09_postgres
local     project_a_d4cfab7403e2_postgres
local     project_b_3fe92c83432f_postgres
local     project_b_d925a8ba9e04_postgres
```

### Destroy all instances completely

```sh
$ cd project_a_instance_1
$ docker compose down -v
$ cd ..
```

```sh
$ cd project_a_instance_2
$ docker compose down -v
$ cd ..
```

```sh
$ cd project_b_instance_1
$ docker compose down -v
$ cd ..
```

```sh
$ cd project_b_instance_2
$ docker compose down -v
$ cd ..
```

```sh
$ docker volume ls
DRIVER    VOLUME NAME
```
