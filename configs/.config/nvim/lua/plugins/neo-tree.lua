return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.filesystem = opts.filesystem or {}
    opts.filesystem = {
      filtered_items = {
        visible = true,
      },
    }

    opts.window = opts.window or {}
    opts.window.position = "float"
    opts.window.popup = {
      size = {
        height = "80%",
        width = "60%",
      },
      position = "50%",
    }
    return opts
  end,
}
