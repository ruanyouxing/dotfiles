{pkgs, ...}: {
  programs.starship.enable = true;
  programs.zoxide.enable = true;
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    plugins = [
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "1386f1213eb0b0589d73cd3cf7c56e6a972a9bfd";
          sha256 = "iKx7lsQCoSAbpANYFkNVCZlTFdwOEI34rx/h1rnraSg=";
        };
      }
      {
        name = "zsh-autopair";
        src = pkgs.fetchFromGitHub {
          owner = "hlissner";
          repo = "zsh-autopair";
          rev = "396c38a7468458ba29011f2ad4112e4fd35f78e6";
          sha256 = "PXHxPxFeoYXYMOC29YQKDdMnqTO0toyA7eJTSCV6PGE=";
        };
      }
      {
        name = "k";
        src = pkgs.fetchFromGitHub {
          owner = "supercrabtree";
          repo = "k";
          rev = "e2bfbaf3b8ca92d6ffc4280211805ce4b8a8c19e";
          sha256 = "32rJjBzqS2e6w/L78KMNwQRg4E3sqqdAmb87XEhqbRQ=";
        };
      }
    ];
    initExtra = ''
      cd(){
          if (( $# == 0  ))
            then builtin cd && builtin cd $(find . -type d -print | fzf );
          else
            builtin cd $1
          fi
        }
    '';
  };
  programs.exa = {
    enable = true;
    enableAliases = true;
    icons = true;
    git = true;
  };
  home = {
    sessionVariables = {
      DOTFILES = "/home/hungz/.dotfiles";
      GTK_IM_MODULE = "ibus";
      XMODIFIERS = "ibus";
      WLR_NO_HARDWARE_CURSORS = "1";
      QT_IM_MODULE = "ibus";
    };
    sessionPath = [
      "$HOME/.local/bin"
    ];
    shellAliases = {
      lg = "lazygit";
      g = "git";
      record = "ffmpeg -video_size 1920x1080 -framerate 60 -f x11grab -i :0.0
      output.mkv";
      startx = "startx ~/.xinitrc > /dev/null 2>&1";
      v = "fd -H | fzf | xargs nvim";
      hm-switch = "home-manager switch --flake '/home/hungz/.dotfiles#hungz'";
      nixos-switch = "sudo nixos-rebuild switch --flake '/home/hungz/.dotfiles#nixos'";
    };
  };
}
