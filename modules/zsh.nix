{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    initExtra = ''
      # Enable proper UTF-8 support
      export LANG=en_US.UTF-8
      export LC_ALL=en_US.UTF-8

      # Enable proper terminal colors
      export TERM=xterm-256color

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

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "code";
      XDG_CONFIG_HOME = "$HOME/.config";
      REPOS = "$HOME/Repos";
      GITUSER = "johanhanses";
      GHREPOS = "$HOME/Repos/github.com/johanhanses";
      DOTFILES = "$GHREPOS/dotfiles";
      SCRIPTS = "$DOTFILES/scripts";
      SECOND_BRAIN = "$GHREPOS/zettelkasten";
      WORK_DIR = "$REPOS/github.com/Digital-Tvilling";
      LKAB_DIR = "$WORK_DIR/.lkab";
      ONPREM_CONFIG_DIR = "$LKAB_DIR/on-prem/config";
      ONPREM_CERT_DIR = "$LKAB_DIR/on-prem/cert";
      PATH = "$XDG_CONFIG_HOME/scripts:$PATH";
    };

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#";
      repos = "cd $REPOS";
      ghrepos = "cd $GHREPOS";
      dot = "cd $GHREPOS/dotfiles";
      scripts = "cd $DOTFILES/scripts";
      rwdot = "cd $REPOS/github.com/rwxrob/dot";
      rob = "cd $REPOS/github.com/rwxrob";
      dt = "cd $REPOS/github.com/Digital-Tvilling";
      plan = "cd $REPOS/github.com/Digital-Tvilling/DT-Frontend-planning";
      rtm = "cd $REPOS/github.com/Digital-Tvilling/dt-frontend-vite";
      deploy = "cd $REPOS/github.com/Digital-Tvilling/deployment-configuration";
      backend = "cd $REPOS/github.com/Digital-Tvilling/deployment-configuration/external/localhost";
      dti = "cd $REPOS/github.com/Digital-Tvilling/dti";
      sb = "cd $SECOND_BRAIN";
      # in = "cd $SECOND_BRAIN/0\ Inbox";
      config = "cd $XDG_CONFIG_HOME";
      sysfig = "cd $HOME/nixos-config";
      windows = "cd /mnt/c/Users/johanhanses";
      szr = "source ~/.zshrc";
      cat = "bat";
      fast = "fast -u --single-line";
      nv = "nvim";
      # .. = " c d ..";
      c = "clear";
      n = "npm";
      nr = "npm run";
      ns = "npm start";
      ls = "ls --color=auto";
      ll = "ls -la";
      l = "ls -l";
      la = "ls -lathr";
      e = "exit";
      gm = "git checkout main && git pull";
      gp = "git push";
      ga = "git add .";
      gs = "git status";
      gc = "git checkout";
      gcb = "git checkout -b";
      gcm = "git cz";
      wip = "git commit -m 'wip' --no-verify";
      lg = "lazygit";
      k = "kubectl";
      t = "tmux";
      tk = "tmux kill-server";
      tl = "tmux ls";
      ta = "tmux a";
      d = "docker";
      dc = "docker compose";
    };
  };
}
