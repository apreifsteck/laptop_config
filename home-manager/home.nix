{ config, pkgs, ... }:
let user = "austinreifsteck";
in {

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  users.users.${user} = { 
    home = "/Users/${user}";
  };

  nix.settings.trusted-users = ["root" user];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home-manager.users.${user} = {config, pkgs, lib, ...}: {
    home.username = user;
    home.homeDirectory = "/Users/${user}";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "23.11"; # Please read the comment before changing.

    imports = [
      ./default.nix
    ];
  };
}
