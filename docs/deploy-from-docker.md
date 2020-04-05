# Docker Support

While it is not possible to run your rAlgo server from within a Docker container, it is possible to use Docker to provision your rAlgo server.

## Limitations

1. This has not yet been tested with user namespacing enabled.
2. If you're running this on Windows, take care when editing files under `configs/` to ensure that line endings are set appropriately for Unix systems.

## Deploying an rAlgo Server with Docker

1. Install [Docker](https://www.docker.com/community-edition#/download) --  setup and configuration is not covered here
2. Create a local directory to hold your VPN configs (e.g. `C:\Users\[USER]\Documents\VPNs\`)
3. Create a local copy of [config.cfg](https://github.com/rhdsx/ralgo/blob/master/config.cfg), with required modifications (e.g. `C:\Users\[USER]\Documents\VPNs\config.cfg`)
4. Run the Docker container, mounting your configurations appropriately (assuming the container is named `rhdsx/ralgo` with a tag `latest`):
  - From Windows:
   ```powershell
   C:\Users\[USER]> docker run --cap-drop=all -it \
     -v C:\Users\[USER]\Documents\VPNs:/data \
     rhdsx/ralgo:latest
   ```
  - From Linux:
  ```bash
  $ docker run --cap-drop=all -it \
    -v /home/[USER]/Documents/VPNs:/data \
    rhdsx/ralgo:latest
  ```
5. When it exits, you'll be left with a fully populated `configs` directory, containing all appropriate configuration data for your clients, and for future server management

### Providing Additional Files
If you need to provide additional files -- like authorization files for Google Cloud Project -- you can simply specify an additional `-v` parameter, and provide the appropriate path when prompted by `ralgo`.

For example, you can specify `-v C:\Users\[USER]\Documents\VPNs\gce_auth.json:/ralgo/gce_auth.json`, making the local path to your credentials JSON file `/ralgo/gce_auth.json`.

### Scripted deployment
Ansible variables (see [Deployment from Ansible](deploy-from-ansible.md)) can be passed via `RALGO_ARGS` environment variable.
_The leading `-e` (or `--extra-vars`) is required_, e.g.
```bash
$ RALGO_ARGS="-e
    provider=digitalocean
    server_name=ralgo
    dns_adblocking=true
    region=ams3
    do_token=token"

$ docker run --cap-drop=all -it \
    -e "RALGO_ARGS=$RALGO_ARGS" \
    -v /home/[USER]/Documents/VPNs:/data \
    rhdsx/ralgo:latest
```

## Managing an rAlgo Server with Docker

Even though the container itself is transient, because you've persisted the configuration data, you can use the same Docker image to manage your rAlgo server. This is done by setting the environment variable `RALGO_ARGS`.

If you want to use rAlgo to update the users on an existing server, specify `-e "RALGO_ARGS=update-users"` in your `docker run` command:
```powershell
$ docker run --cap-drop=all -it \
  -e "RALGO_ARGS=update-users" \
  -v C:\Users\[USER]\Documents\VPNs:/data \
  rhdsx/ralgo:latest
```

## GNU Makefile for Docker

You can also build and deploy with a Makefile. This simplifies some of the command strings and opens the door for further user configuration.

The `Makefile` consists of three targets: `docker-build`, `docker-deploy`, and `docker-prune`.
`docker-all` will run thru all of them.

## Building Your Own Docker Image

You can use the Dockerfile provided in this repository as-is, or modify it to suit your needs. Further instructions on building an image can be found in the [Docker engine](https://docs.docker.com/engine/) documents.

## Security Considerations

Using Docker is largely no different from running rAlgo yourself, with a couple of notable exceptions: we run as root within the container, and you're retrieving your content from Docker Hub.

To work around the limitations of bind mounts in docker, we have to run as root within the container. To mitigate concerns around doing this, we pass the `--cap-drop=all` parameter to `docker run`, which effectively removes all privileges from the root account, reducing it to a generic user account that happens to have a userid of 0. Further steps can be taken by applying `seccomp` profiles to the container; this is being considered as a future improvement.

Docker themselves provide a concept of [Content Trust](https://docs.docker.com/engine/security/trust/content_trust/) for image management, which helps to ensure that the image you download is, in fact, the image that was uploaded. Content trust is still under development, and while we may be using it, its implementation, limitations, and constraints are documented with Docker.

## Future Improvements

1. Even though we're taking care to drop all capabilities to minimize the impact of running as root, we can probably include not only a `seccomp` profile, but also AppArmor and/or SELinux profiles as well.
2. The Docker image doesn't natively support [advanced](deploy-from-ansible.md) rAlgo deployments, which is useful for scripting. This can be done by launching an interactive shell and running the commands yourself.
3. The way configuration is passed into and out of the container is a bit kludgy. Hopefully future improvements in Docker volumes will make this a bit easier to handle.

## Advanced Usage

If you want to poke around the Docker container yourself, you can do so by changing your `entrypoint`. Pass `--entrypoint=/bin/ash` as a parameter to `docker run`, and you'll be dropped into a full Linux shell in the container.
