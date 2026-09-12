 
local terminstance=require("termtoggle")

function Mcommand(lang,name)
    local cmds=require("runner.langs")
    local command=cmds[lang] .. " " .. name

    return command
end


function Runit()
    local lang=vim.bo.filetype
    local fname=vim.fn.expand("%")

    local s,r=pcall(Mcommand,lang,fname)

    if not s then
        error(r)
        return
    end


    terminstance.typeinterm(Mcommand(lang,fname),false)
end

function Ru()
    local s,r=pcall(Runit)

    if not s then
        print("language not setup for runnning",r)
    end
end

local function activate_env()
    local lang=vim.bo.filetype

    if lang=="python" then
        local projsearch=require("runner.readpyproject")

        local tfn=projsearch.func()
        if tfn~=nil then
            terminstance.typeinterm("source " .. tfn .. "/bin/activate",false)
        else
            print("no environment detected")
        end
    end


end


return {run=Ru,activate=activate_env}
