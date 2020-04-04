# rAlgo VPN

[![Main branch build status](https://github.com/Dorian8013/rAlgo/workflows/Main/badge.svg?branch=master)](https://github.com/Dorian8013/rAlgo/actions)

rAlgo VPN is a set of Terraform and Ansible scripts that simplify the setup of a personal, roaming WireGuard VPN. It uses the most secure defaults available and works with Amazon EC2.

[![](https://img.shields.io/badge/-WARNING-red)]()

This is a highly customized fork, that is currently _in progress_. Please visit the original [Algo VPN project](https://github.com/trailofbits/algo), as it is an incredible collection of highly flexible and thoughtful FOSS.
____

## Features

* Supports [WireGuard](https://www.wireguard.com/) iOS, Andriod, macOS, Linux, and Windows
    * Generates .conf files and QR codes for iOS, macOS, Android, and Windows WireGuard clients
* Includes a helper script to add and remove users
* Blocks ads with a local DNS resolver and [Pi-Hole](https://pi-hole.net/) (optional)
* Based on current versions of Ubuntu
* Installs to Amazon EC2 Spot
* Supports [tethered international roaming](docs/network-architecture.md), for the ultimate road-warrior installation

## Anti-features

* Does not support legacy cipher suites or protocols like L2TP, IKEv1, or RSA
* Does not support IPsec style VPN (see the original [Algo VPN](https://github.com/trailofbits/algo) project if you required this feature)
* Does not install Tor, OpenVPN, or other risky servers
* Does not depend on the security of [TLS](https://tools.ietf.org/html/rfc7457)
* Does not claim to provide anonymity or censorship avoidance
* Does not claim to protect you from the [FSB](https://en.wikipedia.org/wiki/Federal_Security_Service), [MSS](https://en.wikipedia.org/wiki/Ministry_of_State_Security_(China)), [DGSE](https://en.wikipedia.org/wiki/Directorate-General_for_External_Security), or [FSM](https://en.wikipedia.org/wiki/Flying_Spaghetti_Monster)

## Deploy the rAlgo Server

The easiest way to get an rAlgo server running is to run it on your local system or from [Google Cloud Shell](docs/deploy-from-cloudshell.md) and let it set up a _new_ virtual machine in the cloud for you.

1. **Setup an account on a cloud hosting provider.** rAlgo only supports [Amazon EC2](https://aws.amazon.com/).

2. **Get a copy of rAlgo.** The rAlgo scripts will be installed on your local system. There are two ways to get a copy:

    - Download the [ZIP file](https://github.com/Dorian8013/rAlgo/archive/master.zip). Unzip the file to create a directory named `ralgo-master` containing the rAlgo scripts.

    - Run the command `git clone https://github.com/Dorian8013/rAlgo.git` to create a directory named `rAlgo` containing the rAlgo scripts.

3. **Install rAlgo's core dependencies.** rAlgo requires that **Python 3.6 or later** and at least one supporting package are installed on your system.

    - **macOS:** Apple does not provide a suitable version of Python 3 with macOS. Here are two ways to obtain one:
        * Use the [Homebrew](https://brew.sh) package manager. After installing Homebrew install Python 3 by running `brew install python3`.

        * Download and install the latest stable [Python 3.7.x package](https://www.python.org/downloads/mac-osx/) (currently Python 3.8 will not work). Be sure to run the included *Install Certificates* command from Finder.

        See [Deploy from macOS](docs/deploy-from-macos.md) for more detailed information on installing Python 3 on macOS.

        Once Python 3 is installed on your Mac, from Terminal run:

        ```bash
        python3 -m pip install --upgrade virtualenv
        ```

4. **Install rAlgo's remaining dependencies.** You'll need to run these commands from the rAlgo directory each time you download a new copy of rAlgo. In a Terminal window `cd` into the `ralgo-master` (ZIP file) or `ralgo` (`git clone`) directory and run:
    ```bash
    python3 -m virtualenv --python="$(command -v python3)" .env &&
      source .env/bin/activate &&
      python3 -m pip install -U pip virtualenv &&
      python3 -m pip install -r requirements.txt
    ```
    On Fedora add the option `--system-site-packages` to the first command above. On macOS install the C compiler if prompted.

5. **Set your configuration options.** Open the file `config.cfg` in your favorite text editor. Specify the users you wish to create in the `users` list. Create a unique user for each device you plan to connect to your VPN. You should also review the other options before deployment, as changing your mind about them later [may require you to deploy a brand new server](https://github.com/Dorian8013/rAlgo/blob/master/docs/faq.md#i-deployed-an-ralgo-server-can-you-update-it-with-new-features).

6. **Start the deployment.** Return to your terminal. In the rAlgo directory, run `./ralgo` and follow the instructions. There are several optional features available. None are required for a fully functional VPN server. These optional features are described in greater detail in [here](docs/deploy-from-ansible.md).

That's it! You will get the message below when the server deployment process completes.

You can now set up clients to connect to your VPN. Proceed to [Configure the VPN Clients](#configure-the-vpn-clients) below.

```
    "#                          Congratulations!                            #"
    "#                     Your rAlgo server is running.                     #"
    "#    Config files and certificates are in the ./configs/ directory.    #"
    "#              Go to https://whoer.net/ after connecting               #"
    "#        and ensure that all your traffic passes through the VPN.      #"
    "#                     Local DNS resolver 172.16.0.1                    #"
    "#      Shell access: ssh -F configs/<server_ip>/ssh_config <hostname>  #"
```

## Configure the VPN Clients

Certificates and configuration files that users will need are placed in the `configs` directory. Make sure to secure these files since many contain private keys. All files are saved under a subdirectory named with the IP address of your new rAlgo VPN server.

### Apple Devices

WireGuard is used to provide VPN services on Apple devices. rAlgo generates a WireGuard configuration file, `wireguard/<username>.conf`, and a QR code, `wireguard/<username>.png`, for each user defined in `config.cfg`.

On iOS, install the [WireGuard](https://itunes.apple.com/us/app/wireguard/id1441195209?mt=8) app from the iOS App Store. Then, use the WireGuard app to scan the QR code or AirDrop the configuration file to the device.

On macOS Mojave or later, install the [WireGuard](https://itunes.apple.com/us/app/wireguard/id1451685025?mt=12) app from the Mac App Store. WireGuard will appear in the menu bar once you run the app. Click on the WireGuard icon, choose **Import tunnel(s) from file...**, then select the appropriate WireGuard configuration file.

On either iOS or macOS, you can enable "Connect on Demand" and/or exclude certain trusted Wi-Fi networks (such as your home or work) by editing the tunnel configuration in the WireGuard app. (rAlgo can't do this automatically for you.)

Installing WireGuard is a little more complicated on older version of macOS. See [Using macOS as a Client with WireGuard](docs/client-macos-wireguard.md).

Once WireGuard is installed, you can configure "Connect On-Demand", as well as excluded Wi-Fi SSIDs directly from the App.

### Android Devices

WireGuard is used to provide VPN services on Android. Install the [WireGuard VPN Client](https://play.google.com/store/apps/details?id=com.wireguard.android). Import the corresponding `wireguard/<name>.conf` file to your device, then setup a new connection with it. See the [Android setup instructions](/docs/client-android.md) for more detailed walkthrough.

### Windows

WireGuard is used to provide VPN services on Windows. rAlgo generates a WireGuard configuration file, `wireguard/<username>.conf`, for each user defined in `config.cfg`.

Install the [WireGuard VPN Client](https://www.wireguard.com/install/#windows-7-8-81-10-2012-2016-2019). Import the generated `wireguard/<username>.conf` file to your device, then setup a new connection with it.

### Linux WireGuard Clients

WireGuard works great with Linux clients. See [this page](docs/client-linux-wireguard.md) for an example of how to configure WireGuard on Ubuntu.

### Other Devices

Depending on the platform, you may need one or multiple of the following files.

* wireguard/<user>.conf: WireGuard configuration profile
* wireguard/<user>.png: WireGuard configuration QR code

## SSH into rAlgo Server

Your rAlgo server is configured for key-only SSH access for administrative purposes. Open the Terminal app, `cd` into the `ralgo-master` directory where you originally downloaded rAlgo, and then use the command listed on the success message:

`ssh -F configs/<ip>/ssh_config <hostname>`

where `<ip>` is the IP address of your rAlgo server. If you find yourself regularly logging into the server then it will be useful to load your rAlgo ssh key automatically. Add the following snippet to the bottom of `~/.bash_profile` to add it to your shell environment permanently.

 `ssh-add ~/.ssh/ralgo > /dev/null 2>&1`

Alternatively, you can choose to include the generated configuration for any rAlgo servers created into your SSH config. Edit the file `~/.ssh/config` to include this directive at the top:

```
Include <ralgodirectory>/configs/*/ssh_config
```

where `<ralgodirectory>` is the directory where you cloned rAlgo.

## Additional Documentation
* [Deployment instructions, cloud provider setup instructions, and further client setup instructions available here.](docs/index.md)
* [FAQ](docs/faq.md)
* [Network Architecture](docs/network-architecture.md)
* [Troubleshooting](docs/troubleshooting.md)
