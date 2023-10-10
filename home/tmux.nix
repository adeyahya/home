{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      resurrect
    ];
    extraConfig = ''
      thm_bg="#16161d"
      thm_fg="#dcd7ba"
      thm_cyan="#6a9589"
      thm_black="#090618"
      thm_gray="#363646"
      thm_magenta="#957fb8"
      thm_pink="#938aa9"
      thm_red="#c34043"
      thm_green="#76946a"
      thm_yellow="#c0a36e"
      thm_blue="#7e9cd8"
      thm_orange="#ffa066"
      thm_altblack="#727169"

      set status "on"
      set status-bg "${thm_bg}"
      set status-justify "left"
      set status-left-length "100"
      set status-right-length "100"

      # messages
      set message-style "fg=${thm_cyan},bg=${thm_gray},align=centre"
      set message-command-style "fg=${thm_cyan},bg=${thm_gray},align=centre"

      # panes
      set pane-border-style "fg=${thm_gray}"
      set pane-active-border-style "fg=${thm_blue}"

      # windows
      setw window-status-activity-style "fg=${thm_fg},bg=${thm_bg},none"
      setw window-status-separator ""
      setw window-status-style "fg=${thm_fg},bg=${thm_bg},none"

      set -g default-terminal "rio"
      set-option -ga terminal-overrides ",rio:Tc"
      set -g default-terminal "screen-256color"
      set-option -ga terminal-overrides ",screen-256color:Tc"
      
      # mouse mode
      set -g mouse on

      set -s escape-time 0
      set -g history-limit 50000

      # increase vim responsiveness
      set -sg escape-time 1

      # set prefix to Escape
      set-option -g prefix C-a
      unbind-key C-b
      bind-key C-a send-prefix

      # manage pane
      unbind %
      bind | split-window -h
      unbind '"'
      bind - split-window -v

      # Switch panes with hjkl
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # increase repeat time for repeatable commands
      set -g repeat-time 1000

      # start window index at 1 instead of 0
      set -g base-index 1

      # start pane index at 1 instead of 0
      setw -g pane-base-index 1

      # highlight window when it has new activity
      setw -g monitor-activity on
      set -g visual-activity on

      # re-number windows when one is closed
      set -g renumber-windows on

      ############################
      ## Status Bar
      ############################

      # enable UTF-8 support in status bar
      set -gq status-utf8 on

      # set refresh interval for status bar
      set -g status-interval 30

      # center the status bar
      # set -g status-justify centre

      # show session, window, pane in left status bar
      set -g status-left-length 40
      # set -g status-left '#[fg=green] #S #[fg=yellow]#I/#[fg=cyan]#P '

      # show hostname, date, tim 100
      set -g status-right '#(battery -t) #[fg=cyan] %d %b %R '

      # update status bar info
      set -g status-interval 60
    '';
  };
}
