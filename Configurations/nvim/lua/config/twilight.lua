require("twilight").setup {
  dimming = {
    alpha = 0.25, -- Amount of dimming (0.0 - fully dimmed, 1.0 - no dimming)
  },
  context = 10, -- Number of lines around the focused area
  treesitter = true, -- Use Treesitter for better context detection
  expand = {
    "function", -- Expand focus to surrounding functions
    "method",   -- Expand focus to methods
    "table",    -- Expand focus to tables
    "if_statement",
  },
}
