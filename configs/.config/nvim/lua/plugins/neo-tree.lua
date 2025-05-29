return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
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
