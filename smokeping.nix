{ config
, pkgs
, ...
}: {
  services.smokeping = {
    package =
      (builtins.getFlake "github:nixos/nixpkgs/e779fb4a661168a24db731e2e4fcd1d26c96985e").legacyPackages.aarch64-linux.smokeping;
    enable = true;
    port = 8081;
    host = "0.0.0.0";
    owner = "Kai Hendry";
    ownerEmail = "hendry+smokeping@iki.fi";
    targetConfig = builtins.readFile ./Targets;
  };
}
