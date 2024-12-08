{ config, pkgs, ... }:
{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "github.com" = {
        identityFile = "~/.ssh/id_ed25519";
        identitiesOnly = true;
      };

      "dt-install-1" = {
        identityFile = "~/.ssh/dt-install-key";
        identitiesOnly = true;
      };
    };
  };

  # Ensure the ~/.ssh directory exists with correct permissions
  home.file.".ssh/config".onChange = ''
    chmod 700 ~/.ssh
  '';
}
