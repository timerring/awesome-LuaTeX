-- GitHub User Total Stars Fetcher
-- Usage: \getgithubuserstars{username}
-- Returns: Formatted total stars count across all user repositories (e.g., "4.1k+")

function getgithubuserstars(username)
    -- Use GitHub Stats API to get total stars
    local api_url = string.format(
        'https://github-readme-stats-one-bice.vercel.app/api?username=%s&include_all_commits=true&count_private=true&show_icons=true&hide_border=true&role=OWNER,ORGANIZATION_MEMBER,COLLABORATOR',
        username
    )
    
    -- Fetch and parse the SVG response to extract stars count
    local cmd = string.format('curl -s "%s" 2>/dev/null | grep -A 1 \'data-testid="stars"\' | tail -1 | sed -n \'s/.*>\\([^<]*\\)<\\/text>/\\1/p\'', api_url)
    local handle = io.popen(cmd)
    local stars_str = handle:read("*a")
    handle:close()
    
    -- Remove whitespace
    stars_str = stars_str:gsub("^%s*(.-)%s*$", "%1")
    
    -- If we got a valid response, use it
    if stars_str ~= "" and stars_str ~= nil then
        -- The API may return formatted values like "4.1k" or plain numbers
        if stars_str:match("[kmb]$") then
            -- Already formatted by the API (e.g., "4.1k")
            tex.print(stars_str .. "+")
        else
            -- Plain number, format it ourselves
            local stars = tonumber(stars_str)
            if stars then
                if stars >= 1000 then
                    tex.print(string.format("%.1fk+", stars / 1000))
                else
                    tex.print(tostring(stars))
                end
            else
                tex.print("N/A")
            end
        end
    else
        -- Fallback if API request fails
        tex.print("N/A")
    end
end

tex.print([[\newcommand{\getgithubuserstars}[1]{\directlua{getgithubuserstars("#1")}}]])

