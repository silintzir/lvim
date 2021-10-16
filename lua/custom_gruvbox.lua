local M = {}

M.palette = {
    black = "#282828",
    white = "#ebdbb2",
    red = "#fb4934",
    green = "#b8bb26",
    blue = "#83a598",
    yellow = "#fe8019",
    gray = "#a89984",
    darkgray = "#3c3836",
    lightgray = "#504945",
    inactivegray = "#7c6f64",
}

M.theme = {
    normal = {
        a = { bg = M.palette.gray, fg = M.palette.black, gui = "bold" },
        b = { bg = M.palette.lightgray, fg = M.palette.white },
        c = { bg = M.palette.darkgray, fg = M.palette.gray },
    },
    insert = {
        a = { bg = M.palette.blue, fg = M.palette.black, gui = "bold" },
        b = { bg = M.palette.lightgray, fg = M.palette.white },
        c = { bg = M.palette.lightgray, fg = M.palette.white },
    },
    visual = {
        a = { bg = M.palette.yellow, fg = M.palette.black, gui = "bold" },
        b = { bg = M.palette.lightgray, fg = M.palette.white },
        c = { bg = M.palette.inactivegray, fg = M.palette.black },
    },
    replace = {
        a = { bg = M.palette.red, fg = M.palette.black, gui = "bold" },
        b = { bg = M.palette.lightgray, fg = M.palette.white },
        c = { bg = M.palette.black, fg = M.palette.white },
    },
    command = {
        a = { bg = M.palette.green, fg = M.palette.black, gui = "bold" },
        b = { bg = M.palette.lightgray, fg = M.palette.white },
        c = { bg = M.palette.inactivegray, fg = M.palette.black },
    },
    inactive = {
        a = { bg = M.palette.darkgray, fg = M.palette.gray, gui = "bold" },
        b = { bg = M.palette.darkgray, fg = M.palette.gray },
        c = { bg = M.palette.darkgray, fg = M.palette.gray },
    },
}

return M
