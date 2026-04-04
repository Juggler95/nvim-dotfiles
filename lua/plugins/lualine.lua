return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      sections = {
        lualine_x = {
          "venv-selector",
        },
      },
      options = {
        theme = "dracula",
      },
    })
  end,
}
