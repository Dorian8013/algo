# Deployment from Ansible

Before you begin, make sure you have installed all the dependencies necessary for your operating system as described in the [README](../README.md).

You can deploy rAlgo non-interactively by running the Ansible playbooks directly with `ansible-playbook`.

`ansible-playbook` accepts variables via the `-e` or `--extra-vars` option. You can pass variables as space separated key=value pairs. rAlgo requires certain variables that are listed below. You can also use the `--skip-tags` option to skip certain parts of the install, such as `iptables` (overwrite iptables rules), `wireguard` (install Wireguard). We don't recommend using the `-t` option as it will only include the tagged portions of the deployment, and skip certain necessary roles (such as `common`).

Here is a full example for DigitalOcean:

```shell
ansible-playbook main.yml -e "provider=digitalocean
                                server_name=ralgo
                                dns_adblocking=true
                                region=ams3
                                do_token=token"
```

See below for more information about variables and roles.

### Variables

- `provider` - (Required) The provider to use. See possible values below
- `server_name` - (Required) Server name. Default: ralgo
- `dns_adblocking` - (Optional) Enables dnscrypt-proxy adblocking. Default: false

If any of the above variables are unspecified, ansible will ask the user to input them.

### Ansible roles

Cloud roles can be activated by specifying an extra variable `provider`.

Cloud roles:

- role: cloud-ec2          [provider: ec2](#amazon-ec2)

Server roles:

- role: dns_adblocking
  * Installs DNS encryption through [dnscrypt-proxy](https://github.com/jedisct1/dnscrypt-proxy) with blacklists to be updated daily from `adblock_lists` in `config.cfg` - note this will occur even if `dns_encryption` in `config.cfg` is set to `false`
  * Constrains dnscrypt-proxy with AppArmor and cgroups CPU and memory limitations
- role: wireguard
  * Installs a [Wireguard](https://www.wireguard.com/) server, with a startup script, and automatic checks for upgrades
  * Creates wireguard.conf files for Linux clients as well as QR codes for Apple/Android clients

### Amazon EC2

Required variables:

- aws_access_key: `AKIA...`
- aws_secret_key
- region: e.g. `us-east-1`

Possible options can be gathered via cli `aws ec2 describe-regions`

Additional variables:

- [encrypted](https://aws.amazon.com/blogs/aws/new-encrypted-ebs-boot-volumes/) - Encrypted EBS boot volume. Boolean (Default: false)

#### Minimum required IAM permissions for deployment:

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PreDeployment",
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeImages",
                "ec2:DescribeKeyPairs",
                "ec2:DescribeRegions",
                "ec2:ImportKeyPair",
                "ec2:CopyImage"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "DeployCloudFormationStack",
            "Effect": "Allow",
            "Action": [
                "cloudformation:CreateStack",
                "cloudformation:UpdateStack",
                "cloudformation:DescribeStacks",
                "cloudformation:DescribeStackEvents",
                "cloudformation:ListStackResources"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "CloudFormationEC2Access",
            "Effect": "Allow",
            "Action": [
                "ec2:CreateInternetGateway",
                "ec2:DescribeVpcs",
                "ec2:CreateVpc",
                "ec2:DescribeInternetGateways",
                "ec2:ModifyVpcAttribute",
                "ec2:createTags",
                "ec2:CreateSubnet",
                "ec2:Associate*",
                "ec2:CreateRouteTable",
                "ec2:AttachInternetGateway",
                "ec2:DescribeRouteTables",
                "ec2:DescribeSubnets",
                "ec2:ModifySubnetAttribute",
                "ec2:CreateRoute",
                "ec2:CreateSecurityGroup",
                "ec2:DescribeSecurityGroups",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:RunInstances",
                "ec2:DescribeInstances",
                "ec2:AllocateAddress",
                "ec2:DescribeAddresses"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
```
