# Deploy from script or cloud-init

You can use `install.sh` to prepare the environment and deploy rAlgoVPN on the local Ubuntu server in one shot using cloud-init, or run the script directly on the server after it's been created. 
The script doesn't configure any parameters in your cloud, so you're on your own to configure related [firewall rules](/docs/firewalls.md), a floating IP address and other resources you may need. The output of the install script (including the p12 and CA passwords) can be found at `/var/log/ralgo.log`, and user config files will be installed into the `/opt/ralgo/configs/localhost` directory. If you need to update users later, `cd /opt/ralgo`, change the user list in `config.cfg`, install additional dependencies as in step 4 of the [main README](https://github.com/rhdsx/ralgo/blob/master/README.md), and run `./ralgo update-users` from that directory.

## Cloud init deployment

You can copy-paste the snippet below to the user data (cloud-init or startup script) field when creating a new server. 

For now this has only been successfully tested on Amazon [EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html).

```
#!/bin/bash
curl -s https://raw.githubusercontent.com/rhdsx/ralgo/master/install.sh | sudo -E bash -x
```
The command will prepare the environment and install rAlgoVPN with the default parameters below. If you want to modify the behavior you may define additional variables.

## Variables

- `METHOD`: which method of the deployment to use. Possible values are local and cloud. Default: cloud. The cloud method is intended to use in cloud-init deployments only. If you are not using cloud-init to deploy the server you have to use the local method.

- `DNS_ADBLOCKING`: To install an ad blocking DNS resolver. Default: false.

- `ENDPOINT`: The public IP address or domain name of your server: (IMPORTANT! This is used to verify the certificate). It will be gathered automatically for DigitalOcean, AWS, GCE, Azure or Vultr if the `METHOD` is cloud. Otherwise you need to define this variable according to your public IP address.

- `USERS`: list of VPN users. Comma-separated list. Default: user1.

- `REPO_SLUG`: Owner and repository that used to get the installation scripts from. Default: rhdsx/ralgo.

- `REPO_BRANCH`: Branch for `REPO_SLUG`. Default: master.

- `EXTRA_VARS`: Additional extra variables.

- `ANSIBLE_EXTRA_ARGS`: Any available ansible parameters. ie: `--skip-tags apparmor`.

## Examples

##### How to customise a cloud-init deployment by variables

```
#!/bin/bash
curl -s https://raw.githubusercontent.com/rhdsx/ralgo/master/install.sh | sudo -E bash -x
```

##### How to deploy locally without using cloud-init

```
export METHOD=local
export ENDPOINT=[your server's IP here]
curl -s https://raw.githubusercontent.com/rhdsx/ralgo/master/install.sh | sudo -E bash -x
```

##### How to deploy a server using arguments

The arguments order as per [variables](#variables) above

```
curl -s https://raw.githubusercontent.com/rhdsx/ralgo/master/install.sh | sudo -E bash -x -s local true false _null true true true true myvpnserver.com phone,laptop,desktop
```
