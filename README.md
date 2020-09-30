# App Inventor Dockerized for offline-LAN

This repository contains a ready-to-use Dockerfile to help you build an [AppInventor](https://appinventor.mit.edu) docker image you can run offline in a LAN.

It is based on the Vagrant build process of the official [appinventor-sources](https://github.com/mit-cml/appinventor-sources) repository. It will download that code and its dependencies during the build.

## rendezvous

For quick and easy setup, the files are included in this repository.
They are just a copy of `appinventor/misc/rendezvous`.

You have to update the value of the `use.rendezvousserver` in `config/appengine-web.xml` to the IP on which your appinventor (docker host) is running in your LAN.

## Building / Running

You can adjust the version you want to build in the docker-compose-file:
Set `appinventorserver.build.args.VERSION` to something which `git checkout` understands.

- Run `docker-compose up` (it will take ~15 minutes for the first build)
- Access it with <http://localhost:8888>
- Login "with Google" and `test@example.com`

## TODO

- Persistence
- Auto-configuration of rendenzvouz IP

## Connection Debugging

### Rendezvous

- `docker-compose exec rendezvous sh`
- `tail supervisor/rendezvous-stdout-*.log`
