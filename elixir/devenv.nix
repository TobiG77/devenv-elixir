 { pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.LANG = "en_NZ.UTF-8";
  env.LANGUAGE = "en_NZ.UTF-8";
  env.LC_ALL = "en_NZ.UTF-8";

  # https://devenv.sh/packages/
  packages = [ pkgs.git ];

  enterShell = ''
    elixir --version
  '';

  languages = {
    elixir = {
      enable = true;
      package = pkgs.beam.packages.erlangR26.elixir_1_15;
    };
  };
  
}
