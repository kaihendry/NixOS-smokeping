{ config
, pkgs
, ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./smokeping.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "vnixos";
  networking.domain = "local";

  users.users.hendry = {
    password = "hello";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    git
    tmate
    ripgrep
    fd
    file
  ];
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "22.11";

  services.avahi.enable = true;
  services.avahi.nssmdns = true;

  networking.firewall.enable = false; # we want smokeping httpd to be accessible

  system.copySystemConfiguration = true;

  programs.vim.defaultEditor = true;

}
