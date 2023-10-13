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
            "Alt-1" = "SUPER-1";
            "Alt-2" = "SUPER-2";
            "Alt-3" = "SUPER-3";
            "Alt-4" = "SUPER-4";
            "Alt-5" = "SUPER-5";
            "Alt-6" = "SUPER-6";
            "Alt-7" = "SUPER-7";
            "Alt-8" = "SUPER-8";
            "Alt-9" = "SUPER-9";
            "Alt-0" = "SUPER-0";
            "Alt-Tab" = "SUPER-Tab";
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
