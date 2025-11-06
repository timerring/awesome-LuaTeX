-- GitHub All Metrics
-- Load all GitHub metric fetchers at once
-- Usage: \directlua{dofile("packages/github/github-all.lua")}

dofile("packages/github/github-repo-stars.lua")
dofile("packages/github/github-user-stars.lua")
dofile("packages/github/github-forks.lua")
dofile("packages/github/github-watchers.lua")
dofile("packages/github/github-contributors.lua")
dofile("packages/github/github-issues.lua")
dofile("packages/github/github-license.lua")
dofile("packages/github/github-release.lua")
dofile("packages/github/github-tag.lua")
dofile("packages/github/github-language.lua")
dofile("packages/github/github-created.lua")

tex.print("% All GitHub metrics loaded")
