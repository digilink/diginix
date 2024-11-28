{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "kamino";
  networking.hostId = "398fe268"; 
  time.timeZone = "Europe/Berlin";
  
  # users
  users.users = {
    root = {
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKex8gLU7QfBdHu9cXXt6QgALh48f072b1nIXneyKnvj sbrown@fastmail.com"
      ];
    };

  sbrown = {
    isNormalUser = true;
    openssh.authorizedKeys.keys = [ 
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKex8gLU7QfBdHu9cXXt6QgALh48f072b1nIXneyKnvj sbrown@fastmail.com"
    ];
    extraGroups = [ "wheel" ];
  };  
};

  # system packages
  environment.systemPackages = with pkgs; [
    age
    direnv
    expect
    fastfetch
    fzf
    gh
    git
    go-task
    gron
    htop
    moreutils
    neovim
    nettools
    netcat
    nmap
    rsync
    tcpdump
    tree
    yq
    zoxide
    wget
  ];
  
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "prohibit-password"; 
      PasswordAuthentication = false;
    };
  };

  security.sudo.wheelNeedsPassword = false;
  networking.firewall.enable = false; 
  system.stateVersion = "24.05"; 
}
