local present, galaxyline_colors = pcall(require, "galaxyline.themes.colors")
if not present then
  return
end

local palette = require("rose-pine.palette")

galaxyline_colors["rose-pine"] = {
  bg = palette.overlay,
  fg = palette.text,
  fg_alt = palette.subtle,
  yellow = palette.gold,
  cyan = palette.foam,
  green = palette.inactive,
  orange = palette.rose,
  magenta = palette.iris,
  blue = palette.foam,
  red = palette.love,
}
