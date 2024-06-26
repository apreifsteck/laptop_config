{ pkgs, ...}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      theme = "onedark";
      editor = {
        bufferline = "always";
        "auto-save" = true;
        file-picker = {
          hidden = false;
        };
      };

      editor.statusline = {
        center = ["version-control"];
      };

      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };

      keys.normal = {
        n = "move_line_down";
        e = "move_line_up";
        C-e = "goto_next_buffer";
        C-n = "goto_previous_buffer";
        C-w = ":bc";
        j = "search_next";
        J = "search_prev";
      };

      keys.insert.t = {
        g = "normal_mode";
      };

      keys.select = {
        n = "extend_line_down";
        e = "extend_line_up";
      };
    };
  };
}
