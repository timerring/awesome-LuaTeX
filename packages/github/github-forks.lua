-- GitHub Forks Counter
-- Usage: \getgithubforks{owner/repo}
-- Returns: Number of forks (e.g., "1.2k+")

function getgithubforks(repo)
    local cmd = string.format('curl -s "https://img.shields.io/github/forks/%s?style=flat" 2>/dev/null | grep -oE ">[0-9.kmb]+<" | sed "s/[><]//g" | head -1', repo)
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

tex.print([[\newcommand{\getgithubforks}[1]{\directlua{getgithubforks("#1")}}]])
