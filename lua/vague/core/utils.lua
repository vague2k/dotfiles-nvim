function P(value)
    print(vim.inspect(value))
    return value
end

function R(name)
    return require("plenary.reload").reload_module(name)
end

function Get_home_path()
    local home = ""

    local is_mac = vim.loop.os_uname().sysname == "Darwin"
    local is_linux = vim.loop.os_uname().sysname == "Linux"
    local is_windows = vim.loop.os_uname().sysname:find("Windows") and true or false

    if is_mac or is_linux then
        home = os.getenv("HOME") or ""
    elseif is_windows then
        home = os.getenv("USERPROFILE") or ""
    end

    return home
end

function Get_github_path(project)
    if project == nil then
        return Get_home_path() .. "/Documents/GitHub/"
    end
    return Get_home_path() .. "/Documents/GitHub/" .. project
end

local utils = {}

utils.dir = {
    -- my own plugins
    huez = Get_github_path("huez"),
    -- contribution
    cd_project_nvim = Get_github_path("cd-project.nvim"),
}

return utils
