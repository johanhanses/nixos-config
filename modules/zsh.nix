{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    initExtra = ''
      if [[ -o interactive ]]; then
        export SHELL=${pkgs.zsh}/bin/zsh
      fi

      # Start SSH agent
      if [ -z "$SSH_AUTH_SOCK" ]; then
        eval `ssh-agent -s`
        ssh-add ~/.ssh/id_ed25519
        ssh-add ~/.ssh/dt-install-key
      fi
    '';

    shellAliases = {
      k = "kubectl";
      ll = "ls -la";
      l = "ls -l";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#";
      nv = "nvim";
      c = "clear";
      d = "docker";
      dc = "docker compose";
      gs = "git status";
      ga = "git add .";
      gcm = "git commit -m";
    };
  };
}
