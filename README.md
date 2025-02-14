# rfscopedb-container
A containerized database for use by [rfscopedb](https://github.com/JeffersonLab/rfscopedb) and related applications

## Overview
This is a simple containerized MariaDB database used to support storage and retrieval of RF waveforms collected from scope mode buffers.  

## Quick Start with Compose
Download the project and run compose from within.  This will pull and run the latest pre-built image from DockerHub.

```
git clone https://https://github.com/JeffersonLab/rfscopedb-container
cd rfscopedb-container
docker compose up
```

Then use mariadb tools to interact with the database.
```
docker -exec -it rfscopedb bash
mysql -u scope_rw -p
select * from scope_waveforms.scans;
```

Note: default password is password.

A python package, called [rfscopedb](https://github.com/JeffersonLab/rfscopedb), was created for interacting with this database.

## Install
docker pull jeffersonlab/rfscopedb

## Configure
No customization is available at this time.  Two mariadb users are created.  scope_owner has all grants on scope_waveforms database.  scope_rw has read/write permissions.  See [01-create-db.sql](https://github.com/JeffersonLab/rfscopedb-container/blob/main/docker-entrypoint-initdb.d/01-create-db.sql) for more details.

## Build
```
git clone https://github.com/JeffersonLab/rfscopedb-container
cd rfscoped-container
docker build -t rfscopedb .
```
Alterantively, the command `docker compose -f build.yml up` will build the image and run a conainter based on that image.

## Release
1. Create a new release on the GitHub [Releases](https://github.com/JeffersonLab/rfscopedb-container/releases) page.
2. Build and publish a new Docker image from the GitHub tag.  This project uses [GitHub actions](https://github.com/JeffersonLab/rfscopedb-container/actions/workflows/docker-publish.yml) to do this on the publication of a new release based on the semver tag associated with the release.
3. Bump and commit quick start [image version](https://github.com/JeffersonLab/rfscopedb-container/blob/main/docker-compose.override.yml)

## See Also
- [rfscopedb](https://https://github.com/JeffersonLab/rfscopedb)
- [DockerHub Page](https://hub.docker.com/repository/docker/jeffersonlab/rfscopedb)
