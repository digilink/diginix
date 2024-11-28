# diginix

My NixOS configuration (work in progress)

Largely, I expect this to change over time MANY times. Only 1 system in focus at this time: 

- kamino
  forgejo server hosted at hetzner 

To bootstrap:

```sh
# from console after booted with NixOS live cd
sudo -i
passwd; ip a

# ssh to node ip
ssh root@<nodeip>
nix-shell -p git neovim
git clone https://github.com/digilink/diginix.git
cd diginix/nixos; nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode disko disko-zfs.nix

# install
mkdir -p /mnt/etc/nixos; cp ~/diginix/nixos/kamino/*.nix /mnt/etc/nixos/
nixos-install --no-root-passwd
```
