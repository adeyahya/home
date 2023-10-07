{ ... }:
{
  programs.tmux = {
    enable = true;
    plugins = [];
    extraConfig = ''
      set -g default-terminal "xterm-256color"
      
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
