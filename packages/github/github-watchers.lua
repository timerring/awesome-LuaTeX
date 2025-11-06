-- GitHub Watchers Counter
-- Usage: \getgithubwatchers{owner/repo}
-- Returns: Number of watchers (e.g., "500+")

function getgithubwatchers(repo)
    local cmd = string.format('curl -s "https://img.shields.io/github/watchers/%s?style=flat" 2>/dev/null | grep -oE ">[0-9.kmb]+<" | sed "s/[><]//g" | head -1', repo)
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

tex.print([[\newcommand{\getgithubwatchers}[1]{\directlua{getgithubwatchers("#1")}}]])
