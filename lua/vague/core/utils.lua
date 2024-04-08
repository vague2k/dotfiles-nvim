function P(value)
    print(vim.inspect(value))
    return value
end

function R(name)
    return require("plenary.reload").reload_module(name)
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
