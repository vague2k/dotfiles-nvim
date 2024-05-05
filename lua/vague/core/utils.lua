function R()
    local cwd = vim.fn.getcwd()
    local split_path = vim.fn.split(cwd, "/")
    local plugin_name = split_path[#split_path]
    vim.cmd("Lazy reload " .. plugin_name)
end

function Project_path()
    -- see https://www.lua.org/manual/5.3/manual.html#pdf-package.config
    -- for details on package.config

    -- If unix sys
    if package.config:sub(1, 1) == "/" then
        local home = os.getenv("HOME")
        return home .. "/Documents/GitHub"
    end

    -- If windows sys
    if package.config:sub(1, 1) == "\\" then
        local home = os.getenv("HOME")
        return home .. "\\Documents\\GitHub"
    end
end
