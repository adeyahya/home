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
          name = "macos terminal copy paste";
          remap = {
            "Alt-c" = "CONTROL-Shift-c";
            "Alt-v" = "CONTROL-Shift-v";
          };
          application = {
            only = ["Alacritty"];
          };
        }
        
        {
          name = "macos copy paste";
          remap = {
            "Alt-c" = "CONTROL-c";
            "Alt-v" = "CONTROL-v";
          };
          application = {
            not = ["Alacritty"];
          };
        }
        
        {
          name = "macos super";
          remap = {
            "Alt-q" = "SUPER-c"; # remap to hyprland quit
            "Alt-s" = "CONTROL-s";
            "Alt-e" = "SUPER-e";
            "Alt-w" = "CONTROL-w";
            "Alt-t" = "CONTROL-t";
            "Alt-Space" = "SUPER-s"; # rofi
          };
        }
      ];
      modmap = [
        {
          name = "capslock esc - control";
          remap = {
            "CapsLock" = {
              "held" = ["CONTROL_L"];
              "alone" = ["Esc"];
              alone_timeout_millis = 300;
            };
          };
        }
      ];
    };
  };
}
