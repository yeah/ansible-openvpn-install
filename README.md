# Ansible playbook for openvpn-install

This playbook gives you handy OpenVPN servers including a local DNS cache (via unbound), fail2ban, unattended upgrades, and possibly a few other niceties.

The actual OpenVPN installation is done by [openvpn-install](https://github.com/Nyr/openvpn-install).

## Requirements

### Debian Jessie server(s)

You will need one or more preferrably virgin Debian Jessie (other distros: ymmv) based server(s). It can be a minimal install. It needs to be connected to the Internet. You don't need to set up any keys, just have the `root` password handy.

On first run, the playbook will login, install your current public key (found in `~/.ssh/id_rsa.pub`) and then disable password authentication to make it more secure.

### Ansible 2

Ansible 2 is required. It's still quite new, so your favorite package manager might not have it yet. If that's the case, you'd have to [run it form source](http://docs.ansible.com/ansible/intro_installation.html#running-from-source).

If your package manager has Ansible 2, using that is preferred, obviously.

## Usage

1. Copy `production.example` to `production` and adapt your inventory (servers).
2. Run the playbook using `ansible-playbook --ask-pass site.yml`.
3. Profit!

In its last step, the playbook will try to download your `.ovpn` client configuration file(s) to `~/Downloads`. Be sure this folder exists.

The `.ovpn` files can be used with `openvpn` on the command line or imported into tools like [Tunnelblick](https://tunnelblick.net/) or the OpenVPN clients for [Android](https://play.google.com/store/apps/details?id=net.openvpn.openvpn) and [iOS](https://itunes.apple.com/de/app/openvpn-connect/id590379981?mt=8).

## License

MIT.

## Credits

[I](http://jan.sh) built this. By myself. On my computer.
