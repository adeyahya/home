{ inputs, ... }:
{
  imports = [
    inputs.xremap-flake.homeManagerModules.default
  ];

  services.xremap = {
    withHypr = true;
    config = {
      keymap = [
        {
          name = "capslock esc";
          remap = {
            "CapsLock" = "Esc";
          };
        }
      ];
    };
  };
}
