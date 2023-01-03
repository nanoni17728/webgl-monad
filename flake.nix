{
  description = "Experimental state management with WebGL";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    node2nix.url = "github:svanderburg/node2nix";
  };

  outputs = { self, nixpkgs, node2nix }: {
    project-name = "webgl-monad";

    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };
      pkgs.mkShell {
        name = self.project-name;
        src = self;
        nativeBuildInputs = [
          pkgs.node2nix
          pkgs.nodejs
          pkgs.openjdk
        ];

        shellHook = ''
          if command -v fish > /dev/null
            then fish
          fi
        '';
      };
  };
}
