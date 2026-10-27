return {
  {
    "deoreal/AmberFawn.nvim", -- AmberFawn theme plugin
    lazy = false, -- load this plugin immediately
    priority = 1000, -- ensure it loads first
    config = function()
      require("amberfawn").setup({
        -- Add any specific configuration here if needed
      })
      vim.cmd([[colorscheme amberfawn]])
    end,
  },
}
