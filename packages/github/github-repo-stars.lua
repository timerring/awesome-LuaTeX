-- GitHub Repository Stars Fetcher
-- Usage: \getgithubrepostars{owner/repo}
-- Returns: Formatted star count for a specific repository (e.g., "240k+", "823")

function getgithubrepostars(repo)
    -- Use shields.io API to get star count (bypasses GitHub rate limit)
    local cmd = string.format('curl -s "https://img.shields.io/github/stars/%s?style=flat" 2>/dev/null | grep -oE ">[0-9.kmb]+<" | sed "s/[><]//g" | head -1', repo)
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

tex.print([[\newcommand{\getgithubrepostars}[1]{\directlua{getgithubrepostars("#1")}}]])

