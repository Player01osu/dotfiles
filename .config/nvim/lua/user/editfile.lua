local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values

local find = finders:new{
  entry_maker     = function(line) end,
  fn_command      = function() return { command = "", args  = { "ls-files" } } end,
  static          = false,
  maximum_results = false
}

-- our picker function: colors
local colors = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "colors",
    finder = finders.new_table {
      results = { "red", "green", "blue" }
    },
    sorter = conf.file_sorter(opts),
  }):find()
end

local le_finder = function(opts)
	opts = opts or {}
	return { "bruh", "nuts" }
end

local colors_different = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "colors",
    --finder = finders.new_oneshot_job({ "find" }, opts ),
    finder = find,
    sorter = conf.file_sorter(opts),
  }):find()
end

--colors()
--colors(require("telescope.themes").get_dropdown{})
colors_different(require("telescope.themes").get_dropdown{})
