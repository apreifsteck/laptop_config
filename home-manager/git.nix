{ pkgs, ...}: {
  programs.git = {
    enable = true;

    aliases = {
      c = "commit -m";
      sw = "switch";
      st = "status";
    };

    ignores = [
      ".devenv*"
      "devenv*"
      ".envrc"
      "devenv.local.nix"
      # direnv
      ".direnv"
      # pre-commit
      ".pre-commit-config.yaml"
    ];
  };
}

