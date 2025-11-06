-- GitHub Repository Creation Date
-- Usage: \getgithubcreated{owner/repo}
-- Returns: Creation date (e.g., "2015-04-10")

function getgithubcreated(repo)
    local cmd = string.format('curl -s "https://api.github.com/repos/%s" 2>/dev/null | grep \'"created_at"\' | head -1 | sed -E \'s/.*"([0-9]{4}-[0-9]{2}-[0-9]{2}).*/\\1/\'', repo)
    local handle = io.popen(cmd)
    local result_str = handle:read("*a")
    handle:close()
    
    result_str = result_str:gsub("^%s*(.-)%s*$", "%1")
    
    if result_str == "" or result_str == nil or not result_str:match("^%d%d%d%d%-%d%d%-%d%d$") then
        tex.print("N/A")
        return
    end
    
    tex.print(result_str)
end

tex.print([[\newcommand{\getgithubcreated}[1]{\directlua{getgithubcreated("#1")}}]])

