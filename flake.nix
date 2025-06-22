# code-owner: @agoose77
# This flake sets up an FSH dev-shell that installs all the required
# packages for running deployer, and then installs the tool in the virtual environment
# It is not best-practice for the nix-way of distributing this code,
# but its purpose is to get an environment up and running.
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      envWithScript = script:
        (pkgs.buildFHSUserEnv {
          name = "lecture-env";
          targetPkgs = pkgs: (with pkgs; [
            nodejs_24
          ]);
          runScript = "${pkgs.writeShellScriptBin "runScript" (''
              set -e
              if [[ ! -d node_modules ]]; then
                ${pkgs.lib.getExe' pkgs.nodejs_24 "npm"} install
              fi
              export PATH="$PWD/node_modules/.bin/:$PATH"
              set +e
            ''
            + script)}/bin/runScript";
        })
        .env;
    in {
      devShell = envWithScript "bash";
    });
}
