local rg = '.*%.lua.symlink'
local rg2 = '.*.(%a+).symlink'
local rg3 = '.*%.(%a+).symlink'
local path = '/Users/spadia/.dotfiles/vim/kickstart.lua.symlink'

print(string.find(path, rg))
print(string.match(path, rg))

print(string.find(path, rg2))
for k, v in string.gmatch(path, rg2) do
	print(k, v)
end


print(string.find(path, rg3))
print(string.match(path, rg3))
