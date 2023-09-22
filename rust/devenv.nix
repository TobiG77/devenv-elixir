 { pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.LANG = "en_NZ.UTF-8";
  env.LANGUAGE = "en_NZ.UTF-8";
  env.LC_ALL = "en_NZ.UTF-8";

  # https://devenv.sh/packages/
  packages = [ pkgs.git ];

  enterShell = ''
    rustc --version
  '';

  languages = {
    rust = {
      enable = true;
      # version = '1.72.0';
      components = [ "rustc" "cargo" "clippy" "rustfmt" "rust-analyzer" ];
    };
  };

  # pre-commit.hooks = {
  #   rustfmt.enable = true;
  #   clippy.enable = true;
  # };  
  
}
