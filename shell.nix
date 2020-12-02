let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};
  puppet-catalog-test-env = pkgs.bundlerEnv {
    name = "puppet-catalog-test-env";
    inherit (pkgs.bundler) ruby;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
  };
in
pkgs.mkShell {
  buildInputs = [
    pkgs.gitAndTools.pre-commit
    puppet-catalog-test-env
    pkgs.ruby
    pkgs.augeas
    pkgs.rake
    pkgs.niv
  ];
  shellHook = ''
    export LC_ALL="en_US.UTF-8"
  '';
}
