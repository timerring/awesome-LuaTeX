-- GitHub Top Language
-- Usage: \getgithublanguage{owner/repo}
-- Returns: Primary programming language (e.g., "Python", "JavaScript")

function getgithublanguage(repo)
    -- Get the first alphabetic text (language name), not the percentage
    local cmd = string.format('curl -s "https://img.shields.io/github/languages/top/%s?style=flat" 2>/dev/null | grep -oE ">[A-Za-z][A-Za-z#+. -]*<" | sed "s/[><]//g" | head -1', repo)
    local handle = io.popen(cmd)
    local result_str = handle:read("*a")
    handle:close()
    
    result_str = result_str:gsub("^%s*(.-)%s*$", "%1")
    
    if result_str == "" or result_str == nil then
        tex.print("N/A")
        return
    end
    
    -- Capitalize first letter for common languages
    if result_str:lower() == "javascript" then
        result_str = "JavaScript"
    elseif result_str:lower() == "typescript" then
        result_str = "TypeScript"
    elseif result_str:lower() == "python" then
        result_str = "Python"
    else
        -- Capitalize first letter
        result_str = result_str:sub(1,1):upper() .. result_str:sub(2)
    end
    
    tex.print(result_str)
end

tex.print([[\newcommand{\getgithublanguage}[1]{\directlua{getgithublanguage("#1")}}]])
