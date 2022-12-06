# `files-matatika-lab`

Meltano file bundle to run the Matatika Lab using Docker.

## Add to your Meltano project
`files-matatika-lab` does not yet exist on the [Meltano Hub](https://hub.meltano.com/files/), so it must be added to your project manually.

Add the plugin to your `meltano.yml`:

```yml
plugins:
    files:
    - name: files-matatika-lab
      namespace: matatika
      variant: matatika
      pip_url: git+https://github.com/Matatika/files-matatika-lab.git
      update:
        '*': true
```

Pull bundled files in:

```
meltano upgrade files
```

Meltano does not currently offer a way to upgrade files for a specific plugin, so be aware that running this command will also attempt to upgrade [managed files](https://docs.meltano.com/concepts/plugins#update-extra) across **all** file bundle plugins specified in your `meltano.yml`.

## Running the Lab
If you are running a Docker version less than [20.10.13](https://docs.docker.com/engine/release-notes/#201013), you will need to substitute all `docker compose` references below to `docker-compose`. See [Docker Compose V2](https://docs.docker.com/compose/compose-v2/) for more information.

### Run
```sh
docker compose up

# run as a background process
docker compose up --detach
```

### Stop
```sh
# only applicable if running as a background process
docker compose stop
```

### Reset
```sh
docker compose down

# also remove named volumes
docker compose down --volumes
```

## Developer resources

### Init your development environment
```bash
pipx install poetry
make init
```

### Lint bundle files
Identify lint issues by running:

```bash
make lint
```

> If `make init` has been run, this command will execute automatically before a commit

Supported file types:
  - YAML
