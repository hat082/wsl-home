# Getting Started

when asked to create the key, use `github_key` as the name

```sh
nix shell nixpkgs#home-manager nixpkgs#gh --command sh -c "\
gh auth login \
&& gh repo clone hat082/wsl-home -- --depth=1 \
&& home-manager switch --flake ./wsl-home "
```
