# docker-fluentd

## Usage

run fluentd container

```bash
$ docker run -d --rm -p 24224:24224 -e WEBHOOK_URL=https://hooks.slack.com/services/xxxx/xxxx/xxxx pyar6329/fluentd-slack:latest
```

stderr to slack channel

```bash
$ docker run --rm --log-driver=fluentd --log-opt tag="docker.{.ID}}" ubuntu:18.04 bash -c 'echo -e "foo\nbar\ntest test" >&2'
```

stdout to stdout

```bash
$ docker run --rm --log-driver=fluentd --log-opt tag="docker.{.ID}}" ubuntu:18.04 bash -c 'echo -e "foo\nbar\ntest test" >&1'
```
