{ config
, pkgs
, ...
}: {
  services.smokeping = {
    package =
      (builtins.getFlake "github:nixos/nixpkgs/e779fb4a661168a24db731e2e4fcd1d26c96985e").legacyPackages.x86_64-linux.smokeping;
    enable = true;
    port = 8081;
    host = "192.168.1.40";
    targetConfig = ''
          probe = FPing
          menu = Top
          title = Network Latency Grapher
          remark = Welcome to the SmokePing website of xxx Company. \
      	     Here you will learn all about the latency of our network.
          + Local
          menu = Local
          title = Local Network
          ++ LocalMachine
          menu = Local Machine
          title = This host
          host = localhost
          + DNS
          menu = DNS
          title = Name servers
          ++ Google
          menu = Google servers
          title = EightEightEightEight
          host = 8.8.8.8
    '';

  };
}
