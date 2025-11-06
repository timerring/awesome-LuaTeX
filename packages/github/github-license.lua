-- GitHub License
-- Usage: \getgithublicense{owner/repo}
-- Returns: License name (e.g., "MIT", "Apache-2.0")

function getgithublicense(repo)
    local cmd = string.format('curl -s "https://img.shields.io/github/license/%s?style=flat" 2>/dev/null | grep -oE ">[A-Za-z0-9. -]+<" | sed "s/[><]//g" | tail -1', repo)
    local handle = io.popen(cmd)
    local result_str = handle:read("*a")
    handle:close()
    
    result_str = result_str:gsub("^%s*(.-)%s*$", "%1")
    
    if result_str == "" or result_str == nil or result_str == "license" then
        tex.print("N/A")
        return
    end
    
    tex.print(result_str)
end

tex.print([[\newcommand{\getgithublicense}[1]{\directlua{getgithublicense("#1")}}]])
