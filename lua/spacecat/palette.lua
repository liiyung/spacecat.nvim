---@class Palette
-- return {
--    bg = "#17191a",
--    fg = "#bebebf",
--    selection = "#44475A",
--    comment = "#559988",
--    red = "#e07a9d",
--    orange = "#e9ac7f",
--    yellow = "#9cc087",
--    green = "#559988",
--    purple = "#a59cf5",
--    cyan = "#9bbbdd",
--    pink = "#e07a9d",
--    sakura = "#fad6f8",
--    bright_red = "#e07a9d",
--    bright_green = "#9cc087",
--    bright_yellow = "#e9ac7f",
--    bright_blue = "#9bbbdd",
--    bright_magenta = "#a59cf5",
--    bright_cyan = "#559988",
--    bright_white = "#bebebf",
--    menu = "#17191a",
--    visual = "#2d2a28",
--    gutter_fg = "#17191a",
--    nontext = "#414141",
--    white = "#bebebf",
--    black = "#17191a",
-- }


local setup, auto_dark_mode = pcall(require, "auto-dark-mode")
if not setup then
	return
end

auto_dark_mode.setup({
	update_interval = 1000,
	set_dark_mode = function()
         return {
            bg = "#17191a",
            fg = "#bebebf",
            selection = "#44475A",
            comment = "#559988",
            red = "#e07a9d",
            orange = "#e9ac7f",
            yellow = "#9cc087",
            green = "#559988",
            purple = "#a59cf5",
            cyan = "#9bbbdd",
            pink = "#e07a9d",
            sakura = "#fad6f8",
            bright_red = "#e07a9d",
            bright_green = "#9cc087",
            bright_yellow = "#e9ac7f",
            bright_blue = "#9bbbdd",
            bright_magenta = "#a59cf5",
            bright_cyan = "#559988",
            bright_white = "#bebebf",
            menu = "#17191a",
            visual = "#2d2a28",
            gutter_fg = "#17191a",
            nontext = "#414141",
            white = "#bebebf",
            black = "#17191a",
         }
	end,
      
   set_light_mode = function()
         return {
            bg = "#fefaf0",
            fg = "#bebebf",
            selection = "#44475A",
            comment = "#559988",
            red = "#e07a9d",
            orange = "#e9ac7f",
            yellow = "#9cc087",
            green = "#559988",
            purple = "#a59cf5",
            cyan = "#9bbbdd",
            pink = "#e07a9d",
            sakura = "#fad6f8",
            bright_red = "#e07a9d",
            bright_green = "#9cc087",
            bright_yellow = "#e9ac7f",
            bright_blue = "#9bbbdd",
            bright_magenta = "#a59cf5",
            bright_cyan = "#559988",
            bright_white = "#bebebf",
            menu = "#fefaf0",
            visual = "#2d2a28",
            gutter_fg = "#fefaf0",
            nontext = "#414141",
            white = "#bebebf",
            black = "#fefaf0",
         } 
   end,
})
auto_dark_mode.init()
