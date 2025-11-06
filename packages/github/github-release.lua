-- GitHub Latest Release Version
-- Usage: \getgithubrelease{owner/repo}
-- Returns: Latest release version (e.g., "v1.2.3")

function getgithubrelease(repo)
    -- Get version number (starts with v or number)
    local cmd = string.format('curl -s "https://img.shields.io/github/v/release/%s?style=flat" 2>/dev/null | grep -oE ">[v0-9][^<]*<" | sed "s/[><]//g" | head -1', repo)
    local handle = io.popen(cmd)
    local result_str = handle:read("*a")
    handle:close()
    
    result_str = result_str:gsub("^%s*(.-)%s*$", "%1")
    
    if result_str == "" or result_str == nil or result_str:match("no release") then
        tex.print("N/A")
        return
    end
    
    tex.print(result_str)
end

tex.print([[\newcommand{\getgithubrelease}[1]{\directlua{getgithubrelease("#1")}}]])
