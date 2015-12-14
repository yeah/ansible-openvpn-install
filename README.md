# Ansible playbook for openvpn-install

This playbook gives you handy OpenVPN servers including a local DNS cache (via unbound), fail2ban, unattended upgrades, and possibly a few other niceties.

The actual OpenVPN installation is done by [openvpn-install](https://github.com/Nyr/openvpn-install).

## Requirements

### Debian Jessie Server(s)

You will need a preferrably virgin Debian Jessie (other distros: ymmv) based server. It can be a minimal install. It needs to be connected to the Internet. You don't need to set up any keys, just have the `root` password handy.

On first run, the playbook will login, install your current public key (found in `~/.ssh/id_rsa.pub`) and then disable password authentication to make it secure.

### Ansible 2

At the time of writing, Ansible 2.0 isn't released yet, so you'd have to [run it form source](http://docs.ansible.com/ansible/intro_installation.html#running-from-source).

If you can get your hands on Ansible 2 via your favorite package manager, that should be fine as well.

## Usage

1. Adapt your inventory (servers) in the `production` file.
2. Run the playbook using `ansible-playbook site.yml`.
3. Profit!

In its last step, the playbook will try to download your `.ovpn` client configuration file(s) to `~/Downloads`. Be sure this folder exists.

The `.ovpn` files can be used with openvpn on the command line or imported into tools like [Tunnelblick](https://tunnelblick.net/) or the OpenVPN clients for [Android](https://play.google.com/store/apps/details?id=net.openvpn.openvpn) and [iOS](https://itunes.apple.com/de/app/openvpn-connect/id590379981?mt=8).

## License

MIT.

## Credits

[I](http://jan.sh) built this. By myself. On my computer.
