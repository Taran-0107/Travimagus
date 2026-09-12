local function get_pyproject()
    local file=vim.api.nvim_buf_get_name(0)
    local dir= vim.fs.dirname(file)

    local result=vim.fs.find("pyproject.toml",{
        path=dir,
        upward=true
    })
    return result[1]
end

local function read_file(filename)
    if filename==nil then
        return nil
    end
    local file=io.open(filename,"r")
    if file==nil then
        return nil
    end
    local contents=file:read("a")

    return contents
end

local function get_venv_name(content)
    local name=content:match('venv%s*=%s*"([^"]+)')

    return name
end

local function parse_pyproject()
    local pp=get_pyproject()
    if pp == nil then
        return nil
    end
    local content=read_file(pp)
    if content==nil then
        return nil
    end
    local envname=get_venv_name(content)

    return envname
end

return {func=parse_pyproject}
