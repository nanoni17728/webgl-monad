{
  description = "A Clojurescript environment for WebGL";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    node2nix.url = "github:svanderburg/node2nix";
  };

  outputs = { self, nixpkgs, node2nix }: {

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
