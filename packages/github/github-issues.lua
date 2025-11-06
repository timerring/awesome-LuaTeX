-- GitHub Open Issues Counter
-- Usage: \getgithubissues{owner/repo}
-- Returns: Number of open issues (e.g., "823")

function getgithubissues(repo)
    -- Issues format is "XXX open", we need to extract just the number
    local cmd = string.format('curl -s "https://img.shields.io/github/issues/%s?style=flat" 2>/dev/null | grep -oE ">[0-9.kmb]+ open<" | sed "s/[><]//g; s/ open//" | head -1', repo)
    local handle = io.popen(cmd)
    local result_str = handle:read("*a")
    handle:close()
    
    result_str = result_str:gsub("^%s*(.-)%s*$", "%1")
    
    if result_str == "" or result_str == nil then
        tex.print("N/A")
        return
    end
    
    -- Add "+" if ends with k, m, or b
    if result_str:match("[kmb]$") then
        result_str = result_str .. "+"
    end
    
    tex.print(result_str)
end

tex.print([[\newcommand{\getgithubissues}[1]{\directlua{getgithubissues("#1")}}]])
