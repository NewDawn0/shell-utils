{ pkgs }:
pkgs.buildGoModule {
  name = "ansi";
  pname = "ansi";
  version = "0.1.0";
  src = ./.;
  vendorHash = null;
  meta = with pkgs.lib; {
    description = "Ansi escape colors cheatsheet";
    maintainers = with maintainers; [ "NewDawn0" ];
    license = licenses.mit;
  };
}
