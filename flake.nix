{
  description = "A very basic flake";
  inputs.nixpkgs.url = "github:benxiao/nixpkgs/mediapipe";
  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.default =
      let
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        python = (pkgs.python3.withPackages (p: [ p.mediapipe ]));
      in
      pkgs.writeShellScriptBin "test" ''
        ${python}/bin/python3 ${./example.py}
      '';
  };
}
