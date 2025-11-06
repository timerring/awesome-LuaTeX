-- GitHub Stars Fetcher
-- Usage: \getgithubstars{owner/repo}
-- Returns: Formatted star count (e.g., "3.0k+", "510+")

-- Main function to fetch and format GitHub stars
function getgithubstars(repo)
    -- Use shields.io API to get star count (bypasses GitHub rate limit)
    -- Parse SVG to extract star count (compatible with macOS)
    local cmd = string.format('curl -s "https://img.shields.io/github/stars/%s?style=flat" 2>/dev/null | sed -n \'s/.*textLength="[0-9]*">\\([0-9.kmb]*\\)<\\/text><\\/a><\\/g><\\/svg>/\\1/p\'', repo)
    local handle = io.popen(cmd)
    local stars_str = handle:read("*a")
    handle:close()
    
    -- Remove whitespace
    stars_str = stars_str:gsub("^%s*(.-)%s*$", "%1")
    
    -- Parse the value (might be like "3k" or "3000")
    local stars = 0
    if stars_str ~= "" and stars_str ~= nil then
        if stars_str:match("k$") then
            local num = tonumber(stars_str:match("([0-9.]+)"))
            stars = math.floor((num or 0) * 1000)
        elseif stars_str:match("m$") then
            local num = tonumber(stars_str:match("([0-9.]+)"))
            stars = math.floor((num or 0) * 1000000)
        else
            stars = tonumber(stars_str) or 0
        end
    end
    
    -- Format output - shields.io already provides formatted strings like "240k"
    -- We just add "+" to indicate "at least"
    local result = stars_str
    if result:match("[kmb]$") then
        result = result .. "+"
    end
    
    tex.print(result)
end

-- Automatically define the LaTeX command when this script is loaded
-- This allows direct usage of \getgithubstars{repo} in LaTeX
tex.print([[\newcommand{\getgithubstars}[1]{\directlua{getgithubstars("#1")}}]])

