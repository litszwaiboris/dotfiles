if vim.env.WAYLAND_DISPLAY and vim.fn.executable("wl-copy") and vim.fn.executable("wl-paste") then
  vim.g.clipboard = {
    name = "wl-copy",
    copy = {
      ["+"] = { "wl-copy", "--type", "text/plain" },
      ["*"] = { "wl-copy", "--primary", "--type", "text/plain" },
    },
    paste = {
      ["+"] = { "wl-paste", "--no-newline" },
      ["*"] = { "wl-paste", "--no-newline", "--primary" },
    },
  }
end
