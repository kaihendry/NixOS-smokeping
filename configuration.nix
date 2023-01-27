{ config
, pkgs
, ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./smokeping.nix
  ];

  system.stateVersion = "22.11";

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "vnixos";
  networking.domain = "local";
  networking.firewall.enable = false; # we want smokeping httpd to be accessible

  networking = {
    useDHCP = false;
    useNetworkd = true;
  };

  systemd.network = {
    networks = {
      "enp0s3" = {
        name = "enp0s3";
        DHCP = "ipv4";
        networkConfig = {
          MulticastDNS = true;
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    git
    tmate
    ripgrep
    fd
    file
  ];

  services =
    {
      openssh.enable = true;
      resolved = {
        enable = true;
      };
    };

  system.copySystemConfiguration = true;
  programs.vim.defaultEditor = true;
}
