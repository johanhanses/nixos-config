{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixos-wsl, home-manager, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ({ pkgs, ... }: {
            users.defaultUserShell = pkgs.zsh;
            programs.zsh.enable = true;

            # System-wide packages
            environment.systemPackages = with pkgs; [
              wget
              # Add nodejs for VSCode remote server compatibility
              nodejs_18
            ];

            # VSCode remote server compatibility
            system.activationScripts = {
              vscode-remote-workaround = {
                text = ''
                  # Check if VSCode server is installed
                  if [ -d "$HOME/.vscode-server/bin" ]; then
                    for i in "$HOME"/.vscode-server/bin/*; do
                      if [ -e "$i/node" ]; then
                        echo "Fixing vscode-server in $i..."
                        # Replace with a compatible Node.js binary
                        ln -sf ${pkgs.nodejs_18}/bin/node "$i/node"
                      fi
                    done
                  fi
                '';
                deps = ["users"];
              };
            };

            # Additional configuration to help with binary compatibility
            programs.nix-ld = {
              enable = true;
              package = pkgs.nix-ld-rs;
            };
          })

          nixos-wsl.nixosModules.default
          {
            system.stateVersion = "24.05";
            wsl.enable = true;
            wsl.defaultUser = "johanhanses";
          }

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.johanhanses = import ./home.nix;
          }
        ];
      };
    };
  };
}
