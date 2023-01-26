{ config
, pkgs
, ...
}: {
  services.smokeping = {
    package =
      (builtins.getFlake "github:nixos/nixpkgs/e779fb4a661168a24db731e2e4fcd1d26c96985e").legacyPackages.x86_64-linux.smokeping;
    enable = true;
    port = 8081;
    host = "0.0.0.0";
    targetConfig = builtins.readFile ./Targets;
  };
}
