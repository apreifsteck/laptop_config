# laptop_config

A repo with all the files needed to configure a new laptop

## Steps

1.  [generate ssh keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and add them to your github (work and personal)
2.  Install every app in `apps_list.yaml`
3.  run `setup.sh`

## Nix installation (Experimental)
```shell
  rm -rf ~/Applications/Home\ Manager\ Apps.backup && rm -rf ~/Applications/Home\ Manager\ Apps
  nix build .#darwinConfigurations.Austins-MacBook-Pro.system
  ./result/sw/bin/darwin-rebuild switch --flake .
```
